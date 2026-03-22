# Regel: Erstellen von Moodle Zuordnungsfragen (GIFT)

## Ziel

Anleitung für eine KI-Assistenz zum Erstellen anspruchsvoller **Zuordnungsfragen** (Matching) im Moodle **GIFT-Format**, basierend auf einer Leitfrage oder einem Thema.

## Prozess

1. Leitfrage/Thema erhalten: Der Benutzer gibt eine Leitfrage oder ein Thema vor.
2. Fragen generieren: Erstelle standardmäßig **5** Zuordnungsfragen (falls nicht anders gewünscht).
3. Zuordnungen definieren: Pro Frage 3–6 Paare (links -> rechts).
4. GIFT-Format ausgeben und speichern: Ausgabe als `.txt`.

## Allgemeine Hinweise (GIFT)

- Zwischen einzelnen Fragen muss mindestens **eine Leerzeile** stehen.
- Kommentarzeilen mit `//` werden beim Import ignoriert.

## Format der Zuordnungsfragen

- Fragetext endet mit 🤖.
- Jede Zuordnung wird mit `=` eingeleitet.
- Linke und rechte Seite werden mit `->` getrennt.

## Moodle GIFT-Format (Zuordnung)

```
::Aussagekräftiger Titel::Fragetext 🤖 {
    =Begriff 1 -> Zuordnung 1
    =Begriff 2 -> Zuordnung 2
    =Begriff 3 -> Zuordnung 3
}
```

Beispiel:

```
::Hauptstädte::Ordnen Sie den Ländern die richtigen Hauptstädte zu. 🤖 {
    =Kanada -> Ottawa
    =Italien -> Rom
    =Japan -> Tokio
    =Indien -> Neu Delhi
}
```

WICHTIG (MUSS-Regel): Wenn in Fragetext oder Zuordnungen die Zeichen `=`, `:`, `~` oder `#` **wörtlich** vorkommen sollen, MUSST du sie mit Backslash escapen.

## Zielgruppe

Schüler:innen der Oberstufe.

## Ausgabe

- Format: Textdatei (`.txt`)
- Inhalt: Zuordnungsfragen im Moodle GIFT-Format
- Dateipfad: `[Fach]`
- Dateiname: `[Thema]_zuordnung.txt`

## Abschließende Anweisungen

1. Jede Frage endet mit 🤖.
2. Pro Frage 3–6 Zuordnungspaare.
3. Zwischen Fragen steht mindestens eine Leerzeile.
4. Ergebnis ist valides Moodle GIFT.
