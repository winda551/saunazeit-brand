#!/bin/bash
# Oeffnet eine AI-Datei in Adobe Illustrator

set -e

FILE="$1"

if [ -z "$FILE" ]; then
    # Suche nach .ai Dateien im Projekt
    echo "Suche nach .ai Dateien..."
    FOUND=$(find /Users/lifeissweet/projects/saunazeit-brand -name "*.ai" -type f 2>/dev/null | head -5)

    if [ -z "$FOUND" ]; then
        echo "Keine .ai Dateien gefunden."
        exit 1
    fi

    echo "Gefundene .ai Dateien:"
    echo "$FOUND"
    echo "---"
    echo "Nutze: ai-open.sh /pfad/zur/datei.ai"
    exit 0
fi

if [ ! -f "$FILE" ]; then
    echo "Datei nicht gefunden: $FILE"
    exit 1
fi

echo "Oeffne in Illustrator: $FILE"

osascript << EOF
tell application "Adobe Illustrator"
    activate
    open POSIX file "$FILE"
end tell
EOF

echo "Datei geoeffnet."
