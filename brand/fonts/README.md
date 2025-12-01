# Saunazeit Typografie

## Verwendete Schriften

### Montserrat
- **Stil**: Bold
- **Verwendung**: Headlines, Logo-Wortmarke
- **Lizenz**: SIL Open Font License 1.1
- **Download**: [Google Fonts](https://fonts.google.com/specimen/Montserrat)

### Source Sans Pro
- **Stil**: Regular, Semibold
- **Verwendung**: Fliesstext, UI-Elemente
- **Lizenz**: SIL Open Font License 1.1
- **Download**: [Google Fonts](https://fonts.google.com/specimen/Source+Sans+Pro)

---

## Installation

### Web (Google Fonts)
```html
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&family=Source+Sans+Pro:wght@400;600&display=swap" rel="stylesheet">
```

### CSS
```css
:root {
  --font-headline: 'Montserrat', sans-serif;
  --font-body: 'Source Sans Pro', sans-serif;
}

h1, h2, h3 {
  font-family: var(--font-headline);
  font-weight: 700;
}

body {
  font-family: var(--font-body);
  font-weight: 400;
}
```

---

## Lizenzdateien
- `montserrat-license.txt` - Lizenztext Montserrat
- `source-sans-license.txt` - Lizenztext Source Sans Pro
