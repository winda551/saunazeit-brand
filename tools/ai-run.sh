#!/bin/bash
# ExtendScript in Adobe Illustrator ausfuehren
# Nutzt osascript um JavaScript an Illustrator zu senden

set -e

SCRIPT="$1"

if [ -z "$SCRIPT" ]; then
    echo "Usage: ai-run.sh '<ExtendScript-Code>'"
    echo "       ai-run.sh /pfad/zu/script.jsx"
    exit 1
fi

# Pruefen ob Illustrator laeuft
if ! pgrep -x "Adobe Illustrator" > /dev/null; then
    echo "Starte Adobe Illustrator..."
    open -a "Adobe Illustrator"
    sleep 5
fi

# Script-Datei oder inline Code?
if [ -f "$SCRIPT" ]; then
    SCRIPT_CONTENT=$(cat "$SCRIPT")
else
    SCRIPT_CONTENT="$SCRIPT"
fi

# Via AppleScript an Illustrator senden
osascript << EOF
tell application "Adobe Illustrator"
    activate
    do javascript "$SCRIPT_CONTENT"
end tell
EOF

echo "ExtendScript ausgefuehrt."
