# Logo-Optimierungs-Workflow

Du startest jetzt den **SAUNAZEIT Logo-Optimierungsworkflow** gemaess CLAUDE.md.

## Workflow-Schritte

### 1. Kontext sammeln
- Lies die aktuelle CLAUDE.md fuer Markenrichtlinien
- Pruefe vorhandene Iterationen in `logo/iterations/`
- Mache einen Screenshot von Illustrator (`mcp__illustrator__view`)

### 2. Iteration durchfuehren (max. 3 Schleifen)

Fuer jede Iteration:

**2.1 LogoDesignerAgent:**
- Interpretiere das Ziel des Benutzers
- Fuehre Aenderungen in Illustrator aus (`mcp__illustrator__run`)
- Speichere als neue Version

**2.2 DesignReviewerAgent:**
- Mache Screenshot des Ergebnisses
- Beurteile: Erkennbarkeit, Balance, Konsistenz
- Schreibe Review in `logo/iterations/v0X/review-v0X.md`

**2.3 Entscheidung:**
- "Akzeptieren" → Workflow beenden
- "Noch eine Iteration" → Weiter mit v0X+1
- v03 erreicht → Beste Version waehlen

## Farbpalette (immer verwenden)

```javascript
// Sauna-Orange #F47A20
var orange = new RGBColor();
orange.red = 244; orange.green = 122; orange.blue = 32;

// Anthrazit #121212
var anthrazit = new RGBColor();
anthrazit.red = 18; anthrazit.green = 18; anthrazit.blue = 18;

// Beige #E3C9A5
var beige = new RGBColor();
beige.red = 227; beige.green = 201; beige.blue = 165;
```

## Regeln
- Maximal 3 Iterationen
- Jede Iteration speichern und dokumentieren
- Nur bei Zielkonflikten nachfragen
- Immer Screenshot vor und nach Aenderungen

---

**Optimierungsziel:** $ARGUMENTS
