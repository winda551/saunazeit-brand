#!/bin/bash
# Exportiert aktives Illustrator-Dokument als SVG

set -e

OUTPUT_DIR="${1:-/Users/lifeissweet/projects/saunazeit-brand/saunazeit-brand/.conductor/cairo/logo/source}"
FILENAME="${2:-export}"

mkdir -p "$OUTPUT_DIR"

FULL_PATH="$OUTPUT_DIR/${FILENAME}.svg"

osascript << EOF
tell application "Adobe Illustrator"
    activate
    set docRef to current document

    -- SVG Export Options
    set svgOpts to {class:SVG export options, CSS properties:SVG style attributes, font subsetting:SVG all glyphs, document encoding:UTF8}

    export docRef to POSIX file "$FULL_PATH" as SVG with options svgOpts
end tell
EOF

echo "SVG exportiert: $FULL_PATH"
