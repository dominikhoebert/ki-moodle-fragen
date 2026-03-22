# Regel: Fehlende Wörter / Lückentext (GIFT – Import-Einschränkung)

## Ziel

Anleitung für eine KI-Assistenz zum Erstellen von „Fehlende Wörter / Lückentext“-Aufgaben **in einer GIFT-kompatiblen Ersatzform**, basierend auf einer Leitfrage oder einem Thema.

WICHTIG: Laut der von dir bereitgestellten Moodle-Dokumentation kann dieser Fragetyp im GIFT-Format **nicht importiert** werden.

Daher gilt folgende Muss-Regel:

- Erstelle Lückentext-Ideen weiterhin didaktisch als „Fehlende Wörter“, aber gib sie **als Kurzantwort-Fragen (empfohlen)** oder als Multiple-Choice-Fragen aus, damit sie in Moodle importierbar sind.

## Prozess

1. Leitfrage/Thema erhalten: Der Benutzer gibt eine Leitfrage oder ein Thema vor.
2. Aufgaben generieren: Erstelle standardmäßig **5** Lücken-Aufgaben (falls nicht anders gewünscht).
3. In GIFT-Ersatzform umwandeln:
   - Standard: Kurzantwort (`{=...}`) für das fehlende Wort / die fehlenden Wörter.
   - Optional: Multiple Choice, wenn mehrere plausible Distraktoren sinnvoll sind.
4. Speichern: Ausgabe als `.txt`.

## Format (Kurzantwort-Ersatz)

- Fragetext enthält genau **eine klar markierte Lücke**, z.B. `____`.
- Fragetext endet mit 🤖.
- In `{...}` stehen die akzeptierten richtigen Antworten (Synonyme/Schreibvarianten) mit `=`.

## Moodle GIFT-Format (Kurzantwort)

```
::Titel (Lückentext-Ersatz)::Satz mit Lücke ____ 🤖 {=richtige Antwort =Alternative}
```

WICHTIG (MUSS-Regel): Wenn in Fragetext oder Antworten die Zeichen `=`, `:`, `~` oder `#` **wörtlich** vorkommen sollen, MUSST du sie mit Backslash escapen.

## Zielgruppe

Schüler:innen der Oberstufe.

## Ausgabe

- Format: Textdatei (`.txt`)
- Inhalt: Importierbare GIFT-Fragen (Kurzantwort/Multiple Choice), didaktisch als Lückentext gestaltet
- Dateipfad: `[Fach]`
- Dateiname: `[Thema]_lueckentext_ersatz.txt`

## Abschließende Anweisungen

1. Jede Aufgabe endet mit 🤖.
2. Genau eine Lücke pro Aufgabe.
3. Ausgabe ist **importierbares** GIFT (Kurzantwort oder Multiple Choice), kein nicht unterstützter Lückentext-Block.
4. Zwischen Aufgaben steht mindestens eine Leerzeile.
