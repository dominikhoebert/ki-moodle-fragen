# Regel: Erstellen von Moodle Wahr/Falsch-Fragen (GIFT)

## Ziel

Anleitung für eine KI-Assistenz zum Erstellen anspruchsvoller **Wahr/Falsch-Fragen** im Moodle **GIFT-Format**, basierend auf einer Leitfrage oder einem Thema.

## Prozess

1. Leitfrage/Thema erhalten: Der Benutzer gibt eine Leitfrage oder ein Thema vor.
2. Fragen generieren: Erstelle standardmäßig **5** Wahr/Falsch-Fragen (falls nicht anders gewünscht).
3. GIFT-Format ausgeben: Gib die Fragen im korrekten Moodle GIFT-Format aus.
4. Speichern: Speichere die generierten Fragen als `.txt`-Datei.

## Allgemeine Hinweise (GIFT)

- Zwischen einzelnen Fragen muss mindestens **eine Leerzeile** stehen.
- Kommentarzeilen beginnen mit `//` und werden beim Import ignoriert.

## Format der Wahr/Falsch-Fragen

- Formuliere eine klare Aussage als Frage/Statement.
- Der Text endet immer mit dem Roboteremoji 🤖.
- Kennzeichne die Aussage als wahr (`{T}`) oder falsch (`{F}`).

## Moodle GIFT-Format (Wahr/Falsch)

```
// optional: Kommentar
::Titel der Frage::Aussage/Fragetext 🤖 {T}

::Titel der Frage::Aussage/Fragetext 🤖 {F}
```

Hinweis: In der oben dokumentierten Grundform enthält der Wahr/Falsch-Block keine Antwortlisten. Wenn du eine Begründung/Erklärung mitgeben willst, schreibe sie als Kommentarzeile direkt unter die Frage (wird nicht importiert, ist aber als Lehrkraft-Notiz hilfreich).

Beispiel:

```
::Wahre Aussage::Wasser kocht bei Normaldruck bei 100 °C. 🤖 {T}
//Begründung: Bei 1 atm liegt der Siedepunkt von Wasser bei 100 °C.
```

WICHTIG (MUSS-Regel): Wenn in Fragetext oder Kommentar die Zeichen `=`, `:`, `~` oder `#` **wörtlich** vorkommen sollen, MUSST du sie (im eigentlichen GIFT-Text) mit Backslash escapen.

## Zielgruppe

Schüler:innen der Oberstufe.

## Ausgabe

- Format: Textdatei (`.txt`)
- Inhalt: Wahr/Falsch-Fragen im Moodle GIFT-Format
- Dateipfad: `[Fach]`
- Dateiname: `[Thema]_wahr_falsch.txt`

## Abschließende Anweisungen

1. Jede Aussage endet mit 🤖.
2. Jede Frage hat genau **einen** Block `{T}` oder `{F}`.
3. Zwischen Fragen steht mindestens eine Leerzeile.
4. Ergebnis ist valides Moodle GIFT.
