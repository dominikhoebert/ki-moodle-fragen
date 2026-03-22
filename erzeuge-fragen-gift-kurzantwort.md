# Regel: Erstellen von Moodle Kurzantwort-Fragen (GIFT)

## Ziel

Anleitung für eine KI-Assistenz zum Erstellen anspruchsvoller **Kurzantwort-Fragen** im Moodle **GIFT-Format**, basierend auf einer Leitfrage oder einem Thema.

## Prozess

1. Leitfrage/Thema erhalten: Der Benutzer gibt eine Leitfrage oder ein Thema vor.
2. Fragen generieren: Erstelle standardmäßig **5** Kurzantwort-Fragen (falls nicht anders gewünscht).
3. Antworten definieren: Gib pro Frage mehrere äquivalente richtige Antworten an (Synonyme, alternative Schreibweisen).
4. GIFT-Format ausgeben und speichern: Ausgabe als `.txt`.

## Allgemeine Hinweise (GIFT)

- Zwischen einzelnen Fragen muss mindestens **eine Leerzeile** stehen.
- Kommentarzeilen mit `//` werden beim Import ignoriert.

## Format der Kurzantwort-Fragen

- Fragetext endet mit 🤖.
- Innerhalb der geschweiften Klammern `{ ... }` werden alle akzeptierten richtigen Antworten mit `=` eingeleitet.

## Moodle GIFT-Format (Kurzantwort)

```
::Aussagekräftiger Titel::Fragetext 🤖 {=Antwort 1 =Antwort 2 =Antwort 3}
```

Beispiele:

```
::Grants Grab::Wer liegt in Grant's Grab? 🤖 {=Grant =Ulysses S. Grant =Ulysses Grant}

::Zahlwort::Zwei plus zwei ist 🤖 {=vier =4}
```

WICHTIG (MUSS-Regel): Wenn in Fragetext oder Antworten die Zeichen `=`, `:`, `~` oder `#` **wörtlich** vorkommen sollen, MUSST du sie mit Backslash escapen.

Tipp: Wenn du eine Erklärung/Begründung beilegen willst, schreibe sie als Kommentarzeile direkt nach der Frage.

## Zielgruppe

Schüler:innen der Oberstufe.

## Ausgabe

- Format: Textdatei (`.txt`)
- Inhalt: Kurzantwort-Fragen im Moodle GIFT-Format
- Dateipfad: `[Fach]`
- Dateiname: `[Thema]_kurzantwort.txt`

## Abschließende Anweisungen

1. Jede Frage endet mit 🤖.
2. Jede Frage enthält mindestens **2** akzeptierte richtige Antworten (wo sinnvoll).
3. Zwischen Fragen steht mindestens eine Leerzeile.
4. Ergebnis ist valides Moodle GIFT.
