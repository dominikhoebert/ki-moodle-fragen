# Regel: Erstellen von Moodle Kurzantwort-Fragen (GIFT)

## Ziel

Anleitung für eine KI-Assistenz zum Erstellen anspruchsvoller **Kurzantwort-Fragen** im Moodle **GIFT-Format**, basierend auf einer Leitfrage oder einem Thema.

## Prozess

1. Leitfrage/Thema erhalten: Der Benutzer gibt eine Leitfrage oder ein Thema vor.
2. Fragen generieren: Erstelle standardmäßig **5** Kurzantwort-Fragen (falls nicht anders gewünscht).
3. Antworten definieren: Stelle sicher, dass jede richtige Antwort **genau ein (1) Wort** lang ist (keine Leerzeichen) und gib pro Frage – wo sinnvoll – mehrere äquivalente richtige Antworten an (Synonyme, alternative Schreibweisen).
4. GIFT-Format ausgeben und speichern: Ausgabe als `.txt`.

## Allgemeine Hinweise (GIFT)

- Zwischen einzelnen Fragen muss mindestens **eine Leerzeile** stehen.
- Kommentarzeilen mit `//` werden beim Import ignoriert.

## Moodle-Hinweis: Position des Antwortfelds (Unterstriche)

In Moodle erscheint das Eingabefeld normalerweise **unter** dem Fragetext. Wenn du jedoch **fünf oder mehr Unterstriche** (z.B. `_____`) in den Fragetext einfügst, wird das Eingabefeld **an dieser Stelle** platziert.

Kann-Regel (optional):

- Verwende im Fragetext eine Lücke aus **mindestens fünf Unterstrichen** (z.B. `_____`), **wenn** das Eingabefeld an einer bestimmten Stelle im Satz platziert werden soll.

MUSS-Regel:

- Die korrekte Lösung muss weiterhin **genau ein (1) Wort** sein.

## Format der Kurzantwort-Fragen

- Fragetext endet mit 🤖.
- Innerhalb der geschweiften Klammern `{ ... }` werden alle akzeptierten richtigen Antworten mit `=` eingeleitet.
- Jede akzeptierte richtige Antwort muss **exakt ein (1) Wort** sein, d.h. sie darf **keine Leerzeichen/Whitespace** enthalten.
- Erstelle **nur** Fragen, bei denen die korrekte Lösung als **ein einzelnes Wort** angegeben werden kann. Wenn das fachlich nicht sinnvoll ist, verwende stattdessen einen anderen Fragetyp (z.B. Multiple Choice).

## Moodle GIFT-Format (Kurzantwort)

```
::Aussagekräftiger Titel::Fragetext 🤖 {=Antwort1 =Antwort2 =Antwort3}
```

Beispiele:

```
::Zahlwort::Zwei plus zwei ist 🤖 {=vier =4}

::SQL::Wie heißt der SQL-Befehl zum Abfragen von Daten? 🤖 {=SELECT}

::Chemie::Wie lautet das chemische Symbol für Natrium? 🤖 {=Na}

::Moodle-Beispiel::Moodle steht für "Modular object oriented _____ environment". 🤖 {=learning}
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
2. Jede akzeptierte richtige Antwort ist **genau 1 Wort** (keine Leerzeichen).
3. Jede Frage enthält mindestens **2** akzeptierte richtige Antworten (wo sinnvoll).
4. Zwischen Fragen steht mindestens eine Leerzeile.
5. Ergebnis ist valides Moodle GIFT.
