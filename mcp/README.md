# MCP Server - SAUNAZEIT Projekt

## Uebersicht

Dieses Verzeichnis enthaelt MCP (Model Context Protocol) Server zur Steuerung externer Anwendungen aus Claude Code heraus.

## Installierte MCP Server

### Adobe Illustrator (`illustrator-mcp`)

Ermoeglicht die direkte Steuerung von Adobe Illustrator via ExtendScript.

**Quelle:** https://github.com/anshuldalua/illustrator-mcp

**Voraussetzungen:**
- macOS (AppleScript-Abhaengigkeit)
- Adobe Illustrator installiert
- `uv` Package Manager (`brew install uv`)

**Verfuegbare Tools:**

| Tool | Beschreibung |
|------|--------------|
| `mcp__illustrator__view` | Screenshot des Illustrator-Fensters |
| `mcp__illustrator__run` | ExtendScript Code ausfuehren |

## Konfiguration

Die MCP-Konfiguration befindet sich in `/.mcp.json` im Projekt-Root:

```json
{
  "mcpServers": {
    "illustrator": {
      "command": "uv",
      "args": [
        "--directory",
        "./mcp/illustrator-mcp",
        "run",
        "illustrator"
      ]
    }
  }
}
```

## Nutzung in Claude Code

### Option 1: Slash-Command (Skill)
```
/illustrator Oeffne das Logo und zeige mir einen Screenshot
```

### Option 2: Direkte Tool-Nutzung
Die MCP-Tools sind nach dem Start von Claude Code automatisch verfuegbar:
- `mcp__illustrator__view` - Screenshot machen
- `mcp__illustrator__run` - Code ausfuehren

## Erste Schritte

1. **Adobe Illustrator oeffnen**
2. **Claude Code neu starten** (damit MCP geladen wird)
3. **Testen:** `/illustrator Mache einen Screenshot`

## ExtendScript Beispiele

### Neues Dokument erstellen
```javascript
var doc = app.documents.add(
    DocumentColorSpace.RGB,
    400, 300  // Breite, Hoehe in Punkten
);
doc.name = "SAUNAZEIT Logo";
```

### Rechteck mit Farbe
```javascript
var doc = app.activeDocument;
var rect = doc.pathItems.rectangle(200, 100, 150, 100);

var orange = new RGBColor();
orange.red = 244;
orange.green = 122;
orange.blue = 32;
rect.fillColor = orange;
rect.stroked = false;
```

### SVG importieren
```javascript
var doc = app.activeDocument;
var svgFile = new File("/Users/.../logo.svg");
var importedItem = doc.groupItems.createFromFile(svgFile);
```

### Als PNG exportieren
```javascript
var doc = app.activeDocument;
var exportFile = new File("/Users/.../export.png");
var opts = new ExportOptionsPNG24();
opts.artBoardClipping = true;
opts.horizontalScale = 200;
opts.verticalScale = 200;
doc.exportFile(exportFile, ExportType.PNG24, opts);
```

## Fehlerbehebung

| Problem | Loesung |
|---------|---------|
| MCP nicht verfuegbar | Claude Code neu starten |
| "Illustrator not running" | Adobe Illustrator zuerst oeffnen |
| Permissions-Fehler | System Preferences > Privacy > Accessibility > Claude erlauben |
| Screenshot schwarz | Illustrator in den Vordergrund bringen |

## Weitere MCP Server hinzufuegen

1. Repository nach `mcp/` klonen
2. Eintrag in `/.mcp.json` hinzufuegen
3. Optional: Skill in `.claude/commands/` erstellen
4. Claude Code neu starten
