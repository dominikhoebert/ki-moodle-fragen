# Regel: Erstellen von SQLite‑Aufgaben (SQL)

## Ziel

Anleitung für eine KI-Assistenz zum Erstellen von klaren, präzisen und anspruchsvollen SQL‑Aufgaben für den SQLite‑Dialekt. Jede Aufgabe besteht aus einer Fragestellung, der expliziten Angabe der zu verwendenden Tabellen (mit Spaltennamen in Klammern) und einem vollständigen SQL‑Lösungs‑Query.

WICHTIG (MUSS-Regeln):

- Verwende ausschließlich **SELECT**-Statements (read-only). Keine INSERT, UPDATE, DELETE, CREATE, DROP, ALTER oder sonstige Änderungen an der Datenbank.
- Verwende ausschließlich **vorhandene Tabellen und Spalten** aus der ausgewählten/bereitgestellten SQLite‑Datenbank (eine der vorhandenen `.db`-Dateien im Workspace).
- Wenn die SQL‑Lösung ein `ORDER BY` enthält, muss der **Fragetext** die Sortierung explizit vorgeben (nach welchen Spalten und in welcher Richtung: aufsteigend/absteigend).
- Wenn die SQL‑Lösung ein `LIMIT` enthält, muss der **Fragetext** explizit sagen, auf wie viele Ergebnisse begrenzt werden soll.

## Prozess

1. Thema/Kompetenz erhalten: Der Benutzer gibt ein Thema (z. B. Joins, Aggregation, Fensterfunktionen) oder eine Leitfrage vor.
2. Aufgaben generieren: Erstelle standardmäßig 5 Aufgaben (falls nicht anders gewünscht) mit steigender Schwierigkeit.
3. Lösung angeben: Jede Aufgabe enthält das korrekte SQL‑Lösungs‑Statement für SQLite.
4. Speichern: Ausgabe als Textdatei im nachstehenden Format.
	- Speicherort: In einem Ordner mit dem Fachnamen (z. B. `insy51/`, `syt111/`). Falls der Ordner nicht existiert, erstelle ihn.
	- Dateiname: `<Thema>_sqlite_aufgaben.txt` (nur Kleinbuchstaben, Leerzeichen durch Unterstriche ersetzen).

5. SQLite MCP Tool nutzen: Nutze das SQLite MCP Tool, um das Schema direkt aus der **passenden** Datenbank zu lesen und darauf basierend realistische Tabellen- und Spaltennamen zu verwenden.
	- **Schnell-Referenz:** Nutze zuerst `DATABASES.md`, um Tabellen- und Spaltennamen der vorhandenen Datenbanken nachzuschlagen.
	- Im Workspace liegen mehrere SQLite-Dateien im Ordner `databases/` (typisch `databases/*.db`). Wähle eine Datenbank, die thematisch zur Aufgabe passt.
	- In VS Code ist üblicherweise **eine MCP-Server-Instanz pro DB-Datei** konfiguriert (z. B. `sqlite_northwind`, `sqlite_movie`, …) und zusätzlich ein frei wählbarer `sqlite`-Server über einen DB-Pfad (z. B. `${workspaceFolder}/db.sqlite`).
	- Verwende dabei **nur Tabellen/Spalten, die im Schema tatsächlich existieren**.
	- Erfinde keine Tabellen/Spalten und lege keine neuen Tabellen an.

6. Validierung: Führe jede SQL‑Lösung mit dem SQLite MCP Tool testweise **gegen dieselbe ausgewählte Datenbank** aus.
	- Es müssen **read-only SELECT**-Abfragen sein und fehlerfrei laufen.

## Zielgruppe

Schüler:innen der Oberstufe bzw. Einsteiger:innen in relationale Datenbanken mit Fokus auf praktische SQL‑Anwendung in SQLite.

## Wichtige Vorgaben (SQLite‑spezifisch)

- Dialekt: SQLite 3 (Standardfunktionen; RIGHT/FULL JOIN nicht verwenden)
- Wenn Fensterfunktionen genutzt werden, dann in der von SQLite unterstützten Syntax (z. B. ROW_NUMBER() OVER (...)).
- Nutze ausschließlich die in der Aufgabe unter „Tabellen“ angegebenen Tabellen und Spalten.
- Nutze ausschließlich SELECT-Statements (keine Änderungen an Daten oder Schema).
- Keine zusätzlichen Erklärtexte; nur die geforderten Blöcke ausgeben.
- Fragetext endet immer mit dem Roboteremoji 🤖.

## Ausgabestruktur pro Aufgabe

Jede Aufgabe muss exakt in folgender Struktur ausgegeben werden:

Aufgabe <Nr>:
Titel: <Kurzer, aussagekräftiger Titel>
Frage: <Präzise Aufgabenstellung in einem Satz/kurzem Absatz> 🤖
Tabellen:
- <Tabellenname>(<spalte1>, <spalte2>, ...)
- <weiteretabelle>(<spalte1>, <spalte2>, ...)
SQL‑Lösung:
<gültiges SQLite‑Statement, endend mit Semikolon>

Trenne Aufgaben optional mit einer Zeile aus drei Bindestrichen (---).

## Beispiel

Aufgabe 1:
Database: sqlite_flightdata
Titel: Bestellungen pro Kunde zählen
Frage: Finde alle Kundennamen und die Anzahl ihrer Bestellungen. 🤖

Tabellen:

- customers(id, name)
- orders(id, customer_id, created_at)
SQL‑Lösung:
SELECT c.name, COUNT(o.id) AS order_count
FROM customers AS c
LEFT JOIN orders AS o ON o.customer_id = c.id
GROUP BY c.name;

---

Aufgabe 2:
Database: sqlite_flightdata
Titel: Umsatz pro Produkt berechnen
Frage: Liste pro Produkt die Gesamtumsätze absteigend, zeige nur Produkte mit Umsatz > 1000. 🤖

Tabellen:

- products(id, name, price)
- order_items(id, order_id, product_id, quantity)
- orders(id, customer_id, created_at)
SQL‑Lösung:
SELECT p.name,
	   SUM(oi.quantity * p.price) AS revenue
FROM products AS p
JOIN order_items AS oi ON oi.product_id = p.id
JOIN orders AS o ON o.id = oi.order_id
GROUP BY p.name
HAVING SUM(oi.quantity * p.price) > 1000
ORDER BY revenue DESC;

## Ausgabe

- Format: Textdatei (.txt)
- Inhalt: Nur die Aufgaben im oben definierten Format (Frage, Tabellen, SQL‑Lösung). Keine zusätzlichen Erklärungen oder Metadaten.
- Speicherort: `<Fach>/<Thema>_sqlite_aufgaben.txt` (Beispiel: `insy51/joins_und_aggregation_sqlite_aufgaben.txt`).
- Hinweis: Erstelle den Fach-Ordner, wenn er noch nicht existiert.

## Qualitätskriterien

- Die SQL‑Lösung ist syntaktisch korrektes SQLite.
- Alle im SQL verwendeten Tabellen/Spalten sind zuvor unter „Tabellen“ aufgeführt.
- Eindeutige Gruppierung/Sortierung wo erforderlich (GROUP BY, ORDER BY).
- Fragetext und SQL‑Lösung sind konsistent: Sortierung (`ORDER BY`) und Begrenzung (`LIMIT`) sind – falls verwendet – auch im Fragetext eindeutig gefordert.
- Verwende Aliase konsistent und sinnvoll.
 - Jede SQL‑Lösung wurde gegen die bereitgestellte Datenbank mit dem SQLite MCP Tool ausgeführt.
 - Jede SQL‑Lösung ist ein reines SELECT-Statement (read-only).

## Hinweise

- Falls sinnvoll, steigere den Schwierigkeitsgrad (von einfachen SELECTs/WHERE/ORDER BY über JOIN/Aggregation bis hin zu Unterabfragen/Fensterfunktionen).
- Nutze realistische, aber generische Tabellennamen und Spalten.
- Füge am Ende jedes SQL‑Statements ein Semikolon an.
