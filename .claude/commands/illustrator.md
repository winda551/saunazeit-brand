# Adobe Illustrator Steuerung

Du bist jetzt im **Illustrator-Modus**. Du kannst Adobe Illustrator direkt steuern.

## Verfuegbare MCP-Tools

### `mcp__illustrator__view`
Macht einen Screenshot des aktuellen Illustrator-Fensters.
- Keine Parameter erforderlich
- Gibt ein Bild zurueck

### `mcp__illustrator__run`
Fuehrt ExtendScript/JavaScript Code in Illustrator aus.
- Parameter: `code` (string) - Der auszufuehrende Code
- Laeuft im Kontext des aktuellen Dokuments

## Wichtige ExtendScript-Grundlagen

```javascript
// Aktuelles Dokument
var doc = app.activeDocument;

// Neues Dokument erstellen
var doc = app.documents.add();

// Ebene erstellen
var layer = doc.layers.add();
layer.name = "Meine Ebene";

// Rechteck erstellen
var rect = doc.pathItems.rectangle(100, 100, 200, 150);

// Farbe setzen
var color = new RGBColor();
color.red = 244;
color.green = 122;
color.blue = 32;
rect.fillColor = color;

// Text erstellen
var textFrame = doc.textFrames.add();
textFrame.contents = "SAUNAZEIT";
textFrame.position = [100, 200];

// SVG importieren
var file = new File("/pfad/zur/datei.svg");
doc.importFile(file);

// Exportieren
var exportFile = new File("/pfad/zum/export.png");
var exportOptions = new ExportOptionsPNG24();
exportOptions.artBoardClipping = true;
doc.exportFile(exportFile, ExportType.PNG24, exportOptions);
```

## Workflow fuer SAUNAZEIT Logo-Arbeiten

1. **Zuerst immer Screenshot machen** um den aktuellen Stand zu sehen
2. **Dann Aenderungen durchfuehren** mit `run`
3. **Ergebnis pruefen** mit erneutem Screenshot

## Farbpalette (aus CLAUDE.md)

```javascript
// Sauna-Orange
var orange = new RGBColor();
orange.red = 244; orange.green = 122; orange.blue = 32; // #F47A20

// Tief-Anthrazit
var anthrazit = new RGBColor();
anthrazit.red = 18; anthrazit.green = 18; anthrazit.blue = 18; // #121212

// Warmes Beige
var beige = new RGBColor();
beige.red = 227; beige.green = 201; beige.blue = 165; // #E3C9A5

// Fast Weiss
var weiss = new RGBColor();
weiss.red = 247; weiss.green = 244; weiss.blue = 239; // #F7F4EF
```

## Hinweise

- Illustrator muss geoeffnet sein
- macOS erforderlich (AppleScript-Abhaengigkeit)
- Bei Fehlern: Screenshot machen um Problem zu analysieren
- Komplexe Operationen in mehrere kleine Schritte aufteilen

---

**Benutzeranweisung:** $ARGUMENTS
