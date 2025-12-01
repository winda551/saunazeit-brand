# Projekt: SAUNAZEIT – Fasssaunen (Vermietung & Verkauf)

---

## Git-Workflow (AUTOMATISCH nach jeder Aufgabe)

Nach JEDER abgeschlossenen Aufgabe fuehre automatisch aus (NICHT fragen):

```bash
git add .
git commit -m "type(scope): beschreibung"
git push origin {branch}
gh pr create --fill (falls noch kein PR existiert)
gh pr merge --squash --delete-branch
git checkout main
git pull origin main
```

### Commit-Format
```
type(scope): beschreibung

Generated with Claude Code
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

### Wichtig
- Kein Nachfragen - einfach ausfuehren
- Bei Merge-Konflikten: User informieren
- Branch-Praefix: `winda551/`

---

## Unternehmenskontext

- Marke: **SAUNAZEIT** (immer zusammengeschrieben, in Logos meist in Versalien: SAUNAZEIT).
- Geschaeft:
  - **Vermietung** von mobilen Fasssaunen
  - **Verkauf** von stationaeren Fasssaunen (nicht mobil)
- Zielgruppe:
  - Privatkunden, die sich entspannen wollen (Wellness, Kurzurlaub im eigenen Garten).
  - Event- und Ferienhausbetreiber, Campingplaetze, Hotels.
- Markenwerte:
  - Waerme, Entspannung, Natur, Holz, Feuer.
  - Wertig, aber bodenstaendig; modern, aber nicht kalt.
- Kernanwendung des Logos:
  - Grossflaechig auf mobilen Fasssaunen (Holz-Hintergrund, ggf. dunkle Flaechen).
  - Fahrzeug- und Anhaengerbeschriftung.
  - Digitale Nutzung (Website, Social Media, Favicon).
  - Merchandising: Handtuecher, Aufgusseimer, Kellen, Textilien, Aufkleber.

---

## Visuelle Leitplanken

### Logo-Grundidee

- Symbol: **Halbkreis/Bogen** (Assoziation Fasssauna / Sauna-Raum) + **Flamme** mit negativem "S".
- Wortmarke: **SAUNAZEIT** in moderner Sans-Serif, vorzugsweise in Versalien, klare Lesbarkeit aus 5-10 m.

### Farbwelt

Primaerpalette:

- Sauna-Orange (Flamme): `#F47A20`
- Tief-Anthrazit/Nahe Schwarz (Text/Hintergrund): `#121212`
- Warmes Beige/Holzton (Akzent/Hintergrund): `#E3C9A5`
- Fast Weiss (fuer helle Hintergruende): `#F7F4EF`

Regeln:

- Hoher Kontrast, keine Pastell-Optik.
- Keine zusaetzlichen bunten Farben im Logo selbst (ausser Sonderanwendungen).
- Fuer 1-Farb-Drucke (Stickerei, Gravur) muss das Logo als **reine Flaeche** in Schwarz oder Weiss funktionieren.

### Typografie

- Logo & Headlines: **Montserrat** (oder vergleichbare geometrische Sans-Serif), Grossbuchstaben.
  - Beispiel: `SAUNAZEIT` in Montserrat SemiBold / Bold.
- Fliesstext (Website, Dokumente): z.B. **Source Sans 3** oder **Open Sans**.
- Immer **SAUNAZEIT** als ein Wort, niemals "Sauna Zeit".

---

## Tooling / MCP-Kontext

Die folgenden MCP-Server stehen (oder sollen) zur Verfuegung:

- `desktop-commander` – Dateisystem / Terminal / Automatisierung.
- `adobe-illustrator` **oder** `adobe-mcp` – Steuerung von Adobe Illustrator (und ggf. Photoshop usw.) fuer Vektorarbeiten.
- `blender-mcp` – Steuerung von Blender fuer 3D-Mockups der Fasssauna.
- `sequential-thinking` – Strukturierte, mehrstufige Reasoning-Pfade fuer komplexe Tasks.
- `favicon-generator` – Auto Favicon MCP, generiert komplette Favicon-Sets aus PNG.

Wenn Designaufgaben anstehen:

1. **Nutze zuerst** die Informationen aus dieser `CLAUDE.md`.
2. Nutze dann `desktop-commander`, um die relevanten Dateien im Projektbaum zu finden.
3. Nutze bei Vektoraenderungen bevorzugt `adobe-illustrator` / `adobe-mcp`.
4. Nutze `favicon-generator`, um aus vorbereiteten PNGs ein ganzes Favicon-Set zu erzeugen.
5. Nutze `sequential-thinking` nur, wenn komplexe mehrschrittige Aufgaben oder Loops explizit angefordert sind.

---

## Multi-Agent-Design-Workflow (Logo & Corporate Design)

> WICHTIG: Dieser Workflow soll **automatisch** ausgefuehrt werden, wenn der Benutzer etwas schreibt wie
> "Starte Logo-Optimierungsworkflow: <Anweisung>"
> oder
> "Verbessere das Corporate Design fuer SAUNAZEIT".

### Rollen

Definiere intern die folgenden Agenten (alles innerhalb eines Modells, nur Rollenwechsel):

- **LogoDesignerAgent**
- **DesignReviewerAgent**
- **FaviconAgent**
- **ColorAgent**
- **TypographyAgent**
- **GuidelineAgent**

### Allgemeine Regeln

- Maximal **3 Iterationsschleifen** je Optimierungsauftrag (v01, v02, v03).
- Jede Iteration speichert:
  - neue AI/Illustrator-Datei unter `logo/iterations/v0X/…`
  - eine kurze Review-Notiz in `logo/iterations/v0X/review-v0X.md`.
- Nur bei offensichtlichen Zielkonflikten den Benutzer nachfragen.

---

### Workflow A: Logo-Optimierung (z. B. "S in der Flamme deutlicher")

Wenn der Benutzer schreibt:
**"Starte Logo-Optimierungsworkflow: [Beschreibung des Ziels]"**

1. **Kontext sammeln (Systemschritt)**
   - Lies diese `CLAUDE.md`.
   - Inspectiere mit `desktop-commander`:
     - `logo/source/saunazeit-logo-master.ai`
     - letzte Version in `logo/iterations/` (falls vorhanden).
   - Wenn sinnvoll, exportiere eine Vergleichs-PNG aus Illustrator (`adobe-illustrator` / `adobe-mcp` Tools).

2. **Iteration 1-3 (Loop, gesteuert ueber `sequential-thinking` wenn vorhanden)**

   Fuer jede Iteration:

   2.1 **LogoDesignerAgent**
   - Interpretiere das Ziel (z. B.: "Das negative S in der Flamme klarer und etwas breiter machen, ohne die Gesamtform zu zerstoeren").
   - Nutze `adobe-illustrator` / `adobe-mcp`, um:
     - `saunazeit-logo-master.ai` bzw. letzte Iterationsdatei zu oeffnen.
     - Ein neues Artboard / eine Kopie der Logo-Gruppe zu erzeugen.
     - Die Pfade der Flamme so anzupassen, dass:
       - Die negative S-Form in kleineren Groessen (z. B. 32-64 px) noch erkennbar bleibt.
       - Die Strichstaerken nicht zu filigran werden.
     - Neues File speichern als:
       - `logo/iterations/v0X/saunazeit-logo-v0X.ai`
       - Exportiere min. ein `SVG` + `PNG` (512px) ins gleiche Verzeichnis.
   - Halte alle Transformationsschritte moeglichst reproduzierbar (z. B. Prozentangaben, Vergroesserung in px etc.).

   2.2 **DesignReviewerAgent**
   - Lade mit `desktop-commander` die PNGs der aktuellen und vorherigen Version.
   - Beurteile:
     - Erkennbarkeit der Flamme und des negativen "S" in klein (Favicon-Groessen).
     - Balance von Bogen, Flamme und Schrift.
     - Konsistenz mit Farb- und Typoregeln aus dieser `CLAUDE.md`.
   - Schreibe ein kurzes Review in `logo/iterations/v0X/review-v0X.md`:
     - Was wurde verbessert?
     - Was ist ggf. schlechter geworden?
     - Empfehlung: "Akzeptieren" oder "Noch eine Iteration noetig".

   2.3 **Loop-Entscheidung**
   - Wenn Empfehlung = "Akzeptieren" → beende Workflow und markiere diese Version im Review als "aktuell bevorzugt".
   - Wenn Empfehlung = "Noch eine Iteration noetig" **und** `v0X < v03`:
     - Erzeuge eine praezisere Anweisung fuer den `LogoDesignerAgent` (z. B. "S ist noch zu schmal, vergroessere den Negativraum um 15 %").
     - Starte naechste Iteration.
   - Wenn `v03` erreicht → waehle die beste der drei Iterationen und notiere die Entscheidung im letzten Review.

---

### Workflow B: Favicon-Erstellung

Wenn der Benutzer schreibt:
**"Erzeuge Favicons aus dem aktuellen SAUNAZEIT-Icon"**

1. **FaviconAgent**
   - Falls noch nicht vorhanden:
     - Bitte `LogoDesignerAgent`, aus dem aktuellen Logo eine **zentrale Icon-Variante** (nur Flamme im Kreis oder Halbkreis) fuer Favicon zu exportieren:
       - `logo/exports/favicon-source/saunazeit-icon-1024.png`
   - Nutze `favicon-generator`:
     - Tool `generate_favicon_from_png` auf `saunazeit-icon-1024.png`.
     - Lasse Ausgabe nach `logo/exports/favicon-set/` schreiben.
   - Dokumentiere die generierten Dateien kurz in `logo/exports/favicon-set/README.md`.

---

### Workflow C: Farb- & Typografie-Optimierung

Wird ausgeloest durch Formulierungen wie:
**"Ueberarbeite das Corporate Design / Farben / Typografie fuer SAUNAZEIT"**

1. **ColorAgent**
   - Analysiere bestehende Palette in `brand/colors/saunazeit-colors.md`.
   - Vorschlag:
     - Max. 1 Primaer-Farbe (Orange), 1 Sekundaer-Farbe (Holzton), 2 neutrale Toene (Hell/Dunkel).
   - Aktualisiere Datei `saunazeit-colors.md` inkl. HEX, RGB, CMYK + Kurzbeschreibung der Einsatzbereiche.

2. **TypographyAgent**
   - Pruefe Schriften in `brand/fonts/`.
   - Empfehle:
     - Definierte Schriftschnitte fuer Logo/Headlines/Fliesstext.
   - Aktualisiere `brand/saunazeit-brand-guide.md` um ein Typo-Kapitel.

3. **GuidelineAgent**
   - Ergaenze oder aktualisiere `brand/saunazeit-brand-guide.md`:
     - Logo-Schutzraum, Mindestgroessen,
     - Negativ-/Positivvarianten,
     - Anwendungsbeispiele (Fasssauna, Fahrzeug, Handtuecher, Eimer, Web).

---

## Ordnerstruktur

- `logo/source/` - Originaldateien (Single Source of Truth)
- `logo/iterations/` - Versionierte Optimierungen
- `logo/exports/` - Print, Web, Favicon Formate
- `logo/reference/` - Fotos und Inspirationen
- `brand/` - Corporate Design Dokumentation
- `mockups/` - Anwendungsbeispiele
- `mcp/` - Agent-Prompts und MCP-Konfiguration

---

## Allgemeine Kollaborationsregeln

- Nutze mich (den Assistenten) nur dann, um Rueckfragen an den Benutzer zu stellen, wenn:
  - Informationen wirklich fehlen,
  - oder es um eine geschmackliche Entscheidung mit starken Abhaengigkeiten geht (z. B. "sehr rustikal vs. sehr modern").
- Sonst: Triff eine **empfohlene Default-Entscheidung**, dokumentiere diese kurz im passenden Markdown (z. B. `review-v0X.md` oder `brand-guide`) und arbeite weiter.
