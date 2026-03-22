# Regel: Erstellen von Moodle Multiple-Choice-Fragen (GIFT)

## Ziel

Anleitung für eine KI-Assistenz zum Erstellen detaillierter und anspruchsvoller **Multiple-Choice-Fragen** im Moodle **GIFT-Format**, basierend auf einer Leitfrage oder einem Thema. Die erzeugten Fragen sollen klar, präzise und für Schüler:innen der Oberstufe geeignet sein.

## Prozess

1. Leitfrage/Thema erhalten: Der Benutzer gibt eine Leitfrage oder ein Thema vor.
2. Fragen generieren: Erstelle standardmäßig **5** Multiple-Choice-Fragen (falls nicht anders gewünscht).
3. GIFT-Format ausgeben: Gib die Fragen im korrekten Moodle GIFT-Format aus.
4. Speichern: Speichere die generierten Fragen als `.txt`-Datei im angegebenen Format.

## Allgemeine Hinweise (GIFT)

- Zwischen einzelnen Fragen muss mindestens **eine Leerzeile** stehen.
- Verwende optional Kommentarzeilen mit `//` (werden beim Import ignoriert).
- Wenn du keinen Titel angibst, kann Moodle beim Import die Frage als Titel verwenden (nicht empfohlen).

## Format der Multiple-Choice-Fragen

Die erstellten Fragen sollten folgendes Format haben:

1. Fragetext: Eine klare, präzise Frage zum angegebenen Thema, **mit dem Roboteremoji 🤖 am Ende**.
2. Antwortalternativen: Zwischen **3 und 6** Antwortmöglichkeiten, wobei **eine oder mehrere** richtig sein können.
3. Feedback: Jede Antwortoption enthält ein erklärendes Feedback, warum diese Antwort richtig oder falsch ist.
4. Bewertung: Jede Antwort erhält eine Gewichtung (Prozent), richtige Antworten zusammen **100%**.

## Moodle GIFT-Format (Multiple Choice)

Nutze dieses Format:

```
::Aussagekräftiger Titel der Frage::Fragetext 🤖 {
    ~%Gewichtung%Antwortoption 1 # Feedback zur Antwortoption 1
    ~%Gewichtung%Antwortoption 2 # Feedback zur Antwortoption 2
    ~%Gewichtung%Antwortoption 3 # Feedback zur Antwortoption 3
}
```

WICHTIG (MUSS-Regel): Wenn in Fragetext, Antworten oder Feedback die Zeichen `=`, `:`, `~` oder `#` **wörtlich** vorkommen sollen, MUSST du sie im GIFT-Text mit einem vorangestellten Backslash escapen, sonst werden sie als GIFT-Steuerzeichen interpretiert.

Beispiele (wörtliche Ausgabe): `\=` statt `=`, `\:` statt `:`, `\~` statt `~`, `\#` statt `#`.

Beachte bei der Gewichtung:

- Richtige Antworten erhalten positive Prozentwerte (z.B. `~%50%`).
- Falsche Antworten erhalten negative Prozentwerte (z.B. `~%-50%`).
- Die Summe aller richtigen Antworten muss **100%** ergeben.
- Moodle verwendet für Berechnungen **5 Dezimalstellen**. Für Drittel verwende `33.33333`.

## Zielgruppe

Schüler:innen der Oberstufe.

## Ausgabe

- Format: Textdatei (`.txt`)
- Inhalt: Multiple-Choice-Fragen im Moodle GIFT-Format
- Dateipfad: `[Fach]`
- Dateiname: `[Thema].txt`

## Abschließende Anweisungen

1. Jede Frage endet im Fragetext mit 🤖.
2. Jede Antwortoption hat Feedback (`# ...`).
3. Richtige Antworten ergeben zusammen 100%.
4. Zwischen Fragen steht mindestens eine Leerzeile.
5. Ergebnis ist valides Moodle GIFT.
