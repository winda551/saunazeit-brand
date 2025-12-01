# Logo Iterations

## Regeln fuer Optimierungen

### Versionierung
- Maximal **3 Iterationen** pro Optimierungsauftrag
- Jede Version in eigenem Ordner: `v01/`, `v02/`, `v03/`
- Nach 3 Schleifen: Finale Entscheidung oder neuer Auftrag

### Dateistruktur pro Version
```
v0X/
├── saunazeit-logo-v0X.ai    # Illustrator Quelldatei
├── saunazeit-logo-v0X.svg   # SVG Export
└── review-v0X.md            # Design-Review Kommentar
```

### Review-Prozess
1. Logo-Designer-Agent erstellt neue Version
2. Design-Reviewer-Agent bewertet und kommentiert
3. Bei Freigabe: Export in alle Formate
4. Bei Anpassungsbedarf: Naechste Iteration

### Naming Convention
- `saunazeit-logo-v01.ai` - Vollstaendiges Logo
- `saunazeit-icon-v01.ai` - Nur Flammen-Icon
- `saunazeit-wordmark-v01.ai` - Nur Schriftzug
