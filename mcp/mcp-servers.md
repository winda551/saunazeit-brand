# MCP Server Konfiguration

## Verwendete MCP Server

### 1. Logo Designer Agent
- **Aufgabe**: Erstellt und optimiert Logo-Varianten
- **Prompt**: `prompts/logo_designer_prompt.md`
- **Input**: Feedback, Referenzbilder
- **Output**: AI/SVG Dateien in `logo/iterations/`

### 2. Design Reviewer Agent
- **Aufgabe**: Bewertet Logo-Versionen nach CD-Kriterien
- **Prompt**: `prompts/logo_reviewer_prompt.md`
- **Input**: Logo-Version aus iterations/
- **Output**: review-vXX.md mit Feedback

### 3. Favicon Generator Agent
- **Aufgabe**: Erstellt komplettes Favicon-Set
- **Prompt**: `prompts/favicon_agent_prompt.md`
- **Input**: `logo/exports/favicon-source/saunazeit-icon-1024.png`
- **Output**: Alle Groessen in `logo/exports/favicon-set/`

### 4. Color Agent
- **Aufgabe**: Farbharmonie-Pruefung, Kontrast-Check
- **Prompt**: `prompts/color_agent_prompt.md`
- **Input**: Farbpalette aus `brand/colors/`
- **Output**: Optimierungsvorschlaege

### 5. Typography Agent
- **Aufgabe**: Schriftpaarungen, Lesbarkeits-Check
- **Prompt**: `prompts/typography_agent_prompt.md`
- **Input**: Schriftdefinitionen aus `brand/fonts/`
- **Output**: Empfehlungen

---

## Workflow

```
1. Logo Designer erstellt v01
         ↓
2. Design Reviewer bewertet
         ↓
   [Freigabe?]
     ↓ Nein          ↓ Ja
3. Naechste Iteration   4. Export in alle Formate
     ↓                      ↓
   (max 3x)           5. Favicon Generator
```

---

## Konfiguration

Die MCP-Server werden in der lokalen Claude Desktop/Code Konfiguration eingerichtet.
Siehe Anthropic Dokumentation fuer Setup-Details.
