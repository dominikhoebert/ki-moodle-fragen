# Regel: Erstellen von Moodle Multiple-Choice-Fragen

## Ziel

Anleitung für eine KI-Assistenz zum Erstellen detaillierter und anspruchsvoller Multiple-Choice-Fragen im Moodle GIFT-Format, basierend auf einer Leitfrage oder einem Thema. Die erzeugten Fragen sollen klar, präzise und für Schüler:innen der Oberstufe geeignet sein.

## Prozess

1. **Leitfrage/Thema erhalten:** Der Benutzer gibt eine Leitfrage oder ein Thema vor, zu dem Multiple-Choice-Fragen erstellt werden sollen.
2. **Multiple-Choice-Fragen generieren:** Basierend auf der Leitfrage und den Antworten auf die klärenden Rückfragen werden Multiple-Choice-Fragen im angegebenen Format erstellt.
3. **GIFT-Format konvertieren:** Die erstellten Fragen werden in das Moodle GIFT-Format umgewandelt.
4. **Speichern der Fragen:** Die generierten Fragen als `.txt`-Datei im angegebenen Format speichern.

## Format der Multiple-Choice-Fragen

Die erstellten Fragen sollten folgendes Format haben:

1. **Fragetext:** Eine klare, präzise Frage zum angegebenen Thema, mit dem Roboteremoji 🤖 am Ende des Fragetextes.
2. **Antwortalternativen:** Zwischen 3 und 6 Antwortmöglichkeiten, wobei eine oder mehrere richtig sein können.
3. **Feedback:** Jede Antwortoption enthält ein erklärendes Feedback, warum diese Antwort richtig oder falsch ist.
4. **Bewertung:** Jede Antwort erhält eine Gewichtung gemäß dem Moodle GIFT-Format.

## Moodle GIFT-Format

Das GIFT-Format (General Import Format Technology) ist ein standardisiertes Format für den Import von Fragen in Moodle. Die Fragen sollten wie folgt formatiert werden:

```
::Aussagekräftiger Titel der Frage::Fragetext 🤖 {
    ~%Gewichtung%Antwortoption 1 # Feedback zur Antwortoption 1
    ~%Gewichtung%Antwortoption 2 # Feedback zur Antwortoption 2
    ~%Gewichtung%Antwortoption 3 # Feedback zur Antwortoption 3
}
```

WICHTIG (MUSS-Regel): Wenn in Fragetext, Antworten oder Feedback die Zeichen `=`, `:`, `~` oder `#` wörtlich vorkommen sollen, MUSST du sie im GIFT-Text mit einem vorangestellten Backslash escapen, sonst werden sie als GIFT-Steuerzeichen interpretiert.

Beispiele (wörtliche Ausgabe): `\=` statt `=`, `\:` statt `:`, `\~` statt `~`, `\#` statt `#`.

Beachte bei der Gewichtung:

- Richtige Antworten erhalten positive Prozentwerte (z.B. ~%50%)
- Falsche Antworten erhalten negative Prozentwerte (z.B. ~%-50%)
- Die Summe aller richtigen Antworten sollte 100% ergeben
- Moodle verwendet für Berechnungen 5 Dezimalstellen. Für Drittel verwende %33.33333 anstelle von %33 oder %33.33
- Verwende keine Gleichheitszeichen (=) in den Antworten, da Moodle sonst einen Fehler zurückgibt

## Zielgruppe

Die erstellten Fragen richten sich an **Schüler:innen der Oberstufe**. Daher sollten die Fragen anspruchsvoll, aber verständlich sein, Fachbegriffe korrekt verwenden und zu kritischem Denken anregen.

## Ausgabe

- **Format:** Textdatei (`.txt`)
- **Inhalt:** Multiple-Choice-Fragen im Moodle GIFT-Format
- **Dateipfad** `[Fach]`
- **Dateiname:** `[Thema].txt`

## Abschließende Anweisungen

1. Die generierten Fragen müssen das Roboteremoji 🤖 am Ende des Fragetextes enthalten
2. Die Gewichtung der Antworten muss sorgfältig kalkuliert werden, sodass richtige Antworten insgesamt 100% ergeben
3. Jede Antwortoption muss erklärendes Feedback enthalten
4. Das Endergebnis muss im korrekten Moodle GIFT-Format vorliegen
