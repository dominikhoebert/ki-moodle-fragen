# Regel: Erstellen von Moodle Numerischen Fragen (GIFT)

## Ziel

Anleitung für eine KI-Assistenz zum Erstellen anspruchsvoller **numerischer Fragen** im Moodle **GIFT-Format**, basierend auf einer Leitfrage oder einem Thema.

## Prozess

1. Leitfrage/Thema erhalten: Der Benutzer gibt eine Leitfrage oder ein Thema vor.
2. Fragen generieren: Erstelle standardmäßig **5** numerische Fragen (falls nicht anders gewünscht).
3. Toleranz festlegen: Gib pro Frage einen sinnvollen Zahlenbereich bzw. eine Toleranz an.
4. GIFT-Format ausgeben und speichern: Ausgabe als `.txt`.

## Allgemeine Hinweise (GIFT)

- Zwischen einzelnen Fragen muss mindestens **eine Leerzeile** stehen.
- Kommentarzeilen mit `//` werden beim Import ignoriert.

## Format der numerischen Fragen

- Fragetext endet mit 🤖.
- Numerische Antworten beginnen mit `{#`.
- Eine Antwort kann als `=Wert:Toleranz` angegeben werden (Toleranz ist ein Fehlerbereich).

## Moodle GIFT-Format (Numerisch)

Einfache Form:

```
::Titel::Fragetext 🤖 {#1822:5}
```

Komplexere Form mit Gewichtung und Feedback:

```
::Titel::Fragetext 🤖 {#
    =1822:0      #Richtig! Sie bekommen die volle Punktzahl.
    =%50%1822:2  #Sie sind nahe dran und bekommen die halbe Punktzahl.
}
```

WICHTIG (MUSS-Regel): Wenn in Fragetext oder Feedback die Zeichen `=`, `:`, `~` oder `#` **wörtlich** vorkommen sollen, MUSST du sie mit Backslash escapen.

## Zielgruppe

Schüler:innen der Oberstufe.

## Ausgabe

- Format: Textdatei (`.txt`)
- Inhalt: Numerische Fragen im Moodle GIFT-Format
- Dateipfad: `[Fach]`
- Dateiname: `[Thema]_numerisch.txt`

## Abschließende Anweisungen

1. Jede Frage endet mit 🤖.
2. Jede Frage enthält eine klare Toleranz/Genauigkeitsdefinition.
3. Nutze bevorzugt die komplexere Form mit Feedbackzeilen (`# ...`) für die volle bzw. teilweise Punktevergabe.
4. Zwischen Fragen steht mindestens eine Leerzeile.
5. Ergebnis ist valides Moodle GIFT.
