# Regel: Erstellen von SQLite‑Aufgaben als Moodle XML (SQL)

## Ziel

Anleitung für eine KI-Assistenz zum Erstellen klarer, präziser und anspruchsvoller SQL‑Aufgaben für den SQLite‑Dialekt als Moodle‑XML‑Datei. Jede Aufgabe besteht aus einer Fragestellung, der expliziten Angabe der zu verwendenden Tabellen (mit Spaltennamen in Klammern) und einem vollständigen SQL‑Lösungs‑Query.

## Prozess

1. Thema/Kompetenz erhalten: Der Benutzer gibt ein Thema (z. B. Joins, Aggregation, Fensterfunktionen) oder eine Leitfrage vor.
2. Aufgaben generieren: Erstelle standardmäßig 5 Aufgaben (falls nicht anders gewünscht) mit steigender Schwierigkeit.
3. Lösung angeben: Jede Aufgabe enthält das korrekte SQL‑Lösungs‑Statement für SQLite.
4. Speichern: Ausgabe als XML‑Datei im nachstehenden Format.
5. SQLite MCP Tool nutzen: Nutze das SQLite MCP Tool, um das Schema direkt aus der **passenden** Datenbank zu lesen und darauf basierend realistische Tabellen- und Spaltennamen zu verwenden.
  - **Schnell-Referenz:** Nutze zuerst `DATABASES.md`, um Tabellen- und Spaltennamen der vorhandenen Datenbanken nachzuschlagen.
  - Im Workspace liegen mehrere SQLite-Dateien im Ordner `databases/` (typisch `databases/*.db`). Wähle eine Datenbank, die thematisch zur Aufgabe passt.
  - In VS Code ist üblicherweise **eine MCP-Server-Instanz pro DB-Datei** konfiguriert (z. B. `sqlite_northwind`, `sqlite_movie`, …) und zusätzlich ein frei wählbarer `sqlite`-Server über einen DB-Pfad (z. B. `${workspaceFolder}/db.sqlite`).
  - Verwende dabei **nur Tabellen/Spalten, die im Schema tatsächlich existieren**.
  - Erfinde keine Tabellen/Spalten und lege keine neuen Tabellen an.
6. Validierung: Führe jede SQL‑Lösung mit dem SQLite MCP Tool testweise **gegen dieselbe ausgewählte Datenbank** aus.
  - Es müssen **read-only SELECT**-Abfragen sein und fehlerfrei laufen.

## Wichtige Regeln

- Verwende ausschließlich **SELECT**-Statements (read-only). Keine INSERT, UPDATE, DELETE, CREATE, DROP, ALTER oder sonstige Änderungen an der Datenbank.
- Verwende ausschließlich **vorhandene Tabellen und Spalten** aus der ausgewählten bzw. bereitgestellten SQLite‑Datenbank.
- Wenn die SQL‑Lösung ein `ORDER BY` enthält, muss der Fragetext die Sortierung explizit vorgeben (nach welchen Spalten und in welcher Richtung: aufsteigend/absteigend).
- Wenn die SQL‑Lösung ein `LIMIT` enthält, muss der Fragetext explizit sagen, auf wie viele Ergebnisse begrenzt werden soll.
- Der Fragetext endet immer mit dem Roboteremoji 🤖.
- Die Ausgabe muss ein vollständiges Moodle‑XML‑Quiz sein, also ein gültiges `<quiz>`-Dokument mit einer oder mehreren `<question type="coderunner">`-Fragen.

## XML-Ausgabeformat

Jede Aufgabe muss als Moodle‑XML mit dieser Grundstruktur ausgegeben werden:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<quiz>
  <question type="coderunner">
    <name>
      <text>Titel der Aufgabe</text>
    </name>
    <questiontext format="markdown">
      <text>Fragetext 🤖

Tabellen:

- tabelle1(spalte1, spalte2)
- tabelle2(spalte1, spalte2)</text>
    </questiontext>
    <generalfeedback format="html">
      <text></text>
    </generalfeedback>
    <defaultgrade>1</defaultgrade>
    <penalty>0</penalty>
    <hidden>0</hidden>
    <idnumber></idnumber>
    <coderunnertype>sql</coderunnertype>
    <answer>SELECT ...;</answer>
    <validateonsave>1</validateonsave>
    <testcases>
      <testcase testtype="0" useasexample="1" hiderestiffail="0" mark="1.0000000">
        <testcode>
          <text></text>
        </testcode>
        <stdin>
          <text></text>
        </stdin>
        <expected>
          <text>...</text>
        </expected>
        <extra>
          <text></text>
        </extra>
        <display>
          <text>SHOW</text>
        </display>
      </testcase>
    </testcases>
  </question>
</quiz>
```

## SQL-Anforderungen

- Die SQL‑Lösung muss syntaktisch korrektes SQLite sein.
- Alle im SQL verwendeten Tabellen und Spalten müssen zuvor unter „Tabellen“ aufgeführt sein.
- Eindeutige Gruppierung und Sortierung, wo erforderlich (`GROUP BY`, `ORDER BY`).
- Fragetext und SQL‑Lösung müssen konsistent sein: Sortierung (`ORDER BY`) und Begrenzung (`LIMIT`) sind – falls verwendet – auch im Fragetext eindeutig gefordert.
- Verwende Aliase konsistent und sinnvoll.

## Validierung

- Jede SQL‑Lösung muss gegen die ausgewählte SQLite‑Datenbank testweise ausgeführt werden.
- Es müssen fehlerfreie, read-only `SELECT`-Abfragen sein.
- Verwende beim Ableiten der Fragen die passenden Tabellen und Spalten aus der tatsächlich vorhandenen Datenbank.

## Zielgruppe

Schüler:innen der Oberstufe bzw. Einsteiger:innen in relationale Datenbanken mit Fokus auf praktische SQL‑Anwendung in SQLite.

## Ausgabe

- **Format:** XML‑Datei (`.xml`)
- **Inhalt:** Vollständiges Moodle‑XML‑Quiz mit den Fragen im oben beschriebenen Format
- **Dateipfad:** `[Fach]`
- **Dateiname:** `[Thema].xml`

## Abschließende Anweisungen

1. Jede erzeugte Frage muss das Roboteremoji 🤖 am Ende des Fragetexts enthalten.
2. Die Ausgabe muss ein gültiges Moodle‑XML‑Dokument sein.
3. Jede Aufgabe muss eine vollständige SQL‑Lösung enthalten.
4. Das Endergebnis muss im korrekten Moodle‑XML‑Format vorliegen.