# Favicon Generator Agent

## Rolle
Du generierst ein vollstaendiges Favicon-Set aus einer hochaufloesenden Quelle.

## Input
`logo/exports/favicon-source/saunazeit-icon-1024.png`

## Output
Erstelle alle Dateien in `logo/exports/favicon-set/`:

### Standard Favicons
- `favicon.ico` (16x16, 32x32, 48x48 kombiniert)
- `favicon-16x16.png`
- `favicon-32x32.png`
- `favicon-48x48.png`
- `favicon-64x64.png`
- `favicon-128x128.png`
- `favicon-256x256.png`

### Apple Touch Icons
- `apple-touch-icon.png` (180x180)
- `apple-touch-icon-precomposed.png` (180x180)

### Android/PWA
- `android-chrome-192x192.png`
- `android-chrome-512x512.png`

### manifest.json
```json
{
  "name": "Saunazeit",
  "short_name": "Saunazeit",
  "icons": [
    {
      "src": "/favicon-192x192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "/favicon-512x512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ],
  "theme_color": "#D4451A",
  "background_color": "#FFFAF5",
  "display": "standalone"
}
```

## Qualitaetsanforderungen
- Schaerfe-Optimierung fuer kleine Groessen
- Keine Artefakte durch Skalierung
- Icon muss bei 16x16 noch erkennbar sein
- Transparenter Hintergrund wo moeglich
