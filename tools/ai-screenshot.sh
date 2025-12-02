#!/bin/bash
# Illustrator Screenshot mit automatischer Komprimierung
# Haelt Bilder unter 4MB fuer Claude Code Kompatibilitaet

set -e

OUTPUT_DIR="${1:-/Users/lifeissweet/projects/saunazeit-brand/saunazeit-brand/.conductor/cairo/logo/source}"
FILENAME="${2:-illustrator-screenshot}"
MAX_SIZE_KB=4000  # 4MB max (Puffer fuer 5MB Limit)
TMP_DIR="/tmp/ai-screenshots"

mkdir -p "$TMP_DIR"
mkdir -p "$OUTPUT_DIR"

# Screenshot von Illustrator Fenster machen
echo "Suche Illustrator Fenster..."
WINDOW_ID=$(osascript -e 'tell application "System Events" to tell process "Adobe Illustrator" to get id of window 1' 2>/dev/null || echo "")

if [ -z "$WINDOW_ID" ]; then
    echo "Illustrator nicht gefunden oder kein Fenster offen. Mache Fullscreen-Screenshot..."
    screencapture -x "$TMP_DIR/raw.png"
else
    echo "Illustrator gefunden. Mache Fenster-Screenshot..."
    # Fenster-spezifischer Screenshot
    osascript -e 'tell application "Adobe Illustrator" to activate'
    sleep 0.5
    screencapture -x -w "$TMP_DIR/raw.png" 2>/dev/null || screencapture -x "$TMP_DIR/raw.png"
fi

RAW_SIZE=$(stat -f%z "$TMP_DIR/raw.png" 2>/dev/null || stat -c%s "$TMP_DIR/raw.png")
RAW_SIZE_KB=$((RAW_SIZE / 1024))
echo "Original: ${RAW_SIZE_KB}KB"

# Komprimierung falls noetig
QUALITY=85
SCALE=100

while [ $RAW_SIZE_KB -gt $MAX_SIZE_KB ] && [ $QUALITY -gt 20 ]; do
    if [ $QUALITY -gt 50 ]; then
        QUALITY=$((QUALITY - 15))
    else
        SCALE=$((SCALE - 20))
        QUALITY=70
    fi

    echo "Komprimiere: Quality=$QUALITY%, Scale=$SCALE%..."

    if [ $SCALE -lt 100 ]; then
        sips -s format jpeg -s formatOptions $QUALITY -Z $((2880 * SCALE / 100)) "$TMP_DIR/raw.png" --out "$TMP_DIR/compressed.jpg" 2>/dev/null
    else
        sips -s format jpeg -s formatOptions $QUALITY "$TMP_DIR/raw.png" --out "$TMP_DIR/compressed.jpg" 2>/dev/null
    fi

    RAW_SIZE=$(stat -f%z "$TMP_DIR/compressed.jpg" 2>/dev/null || stat -c%s "$TMP_DIR/compressed.jpg")
    RAW_SIZE_KB=$((RAW_SIZE / 1024))
done

# Finale Ausgabe
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
FINAL_PATH="$OUTPUT_DIR/${FILENAME}-${TIMESTAMP}.jpg"

if [ -f "$TMP_DIR/compressed.jpg" ]; then
    cp "$TMP_DIR/compressed.jpg" "$FINAL_PATH"
else
    sips -s format jpeg -s formatOptions 80 "$TMP_DIR/raw.png" --out "$FINAL_PATH" 2>/dev/null
fi

FINAL_SIZE=$(stat -f%z "$FINAL_PATH" 2>/dev/null || stat -c%s "$FINAL_PATH")
FINAL_SIZE_KB=$((FINAL_SIZE / 1024))

echo "---"
echo "Screenshot gespeichert: $FINAL_PATH"
echo "Groesse: ${FINAL_SIZE_KB}KB"

# Cleanup
rm -f "$TMP_DIR/raw.png" "$TMP_DIR/compressed.jpg"

# Pfad ausgeben fuer weitere Nutzung
echo "$FINAL_PATH"
