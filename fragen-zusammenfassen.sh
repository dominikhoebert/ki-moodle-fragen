#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Verwendung:
  ./fragen-zusammenfassen.sh <eingabe-ordner> [endung]

Parameter:
  eingabe-ordner   Ordner mit den Frage-Dateien
  endung           Optionaler Dateifilter ohne Punkt (z.B. txt, md)
                   Standard: alle Dateien

Ausgabe:
  Wird automatisch erzeugt als:
  <eingabe-ordner>/<ordnername>.txt

Beispiele:
  ./fragen-zusammenfassen.sh ./insy61
  ./fragen-zusammenfassen.sh ./insy61 txt
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo "Fehler: Ungueltige Anzahl an Parametern." >&2
  usage
  exit 1
fi

input_dir="$1"
extension="${2:-}"

if [[ ! -d "$input_dir" ]]; then
  echo "Fehler: Eingabe-Ordner existiert nicht: $input_dir" >&2
  exit 1
fi

input_abs="$(cd "$input_dir" && pwd)"
folder_name="$(basename "$input_abs")"
output_file="$input_abs/$folder_name.txt"

# Verhindert, dass die Ausgabedatei waehrend des Lesens erneut eingesammelt wird.
output_abs="$(cd "$(dirname "$output_file")" 2>/dev/null || true; pwd)/$(basename "$output_file")"

files=()

if [[ -n "$extension" ]]; then
  while IFS= read -r file; do
    files+=("$file")
  done < <(find "$input_abs" -type f -name "*.${extension}" | sort)
else
  while IFS= read -r file; do
    files+=("$file")
  done < <(find "$input_abs" -type f | sort)
fi

if [[ ${#files[@]} -eq 0 ]]; then
  echo "Keine passenden Dateien in '$input_dir' gefunden." >&2
  exit 1
fi

: > "$output_file"

merged_count=0

for file in "${files[@]}"; do
  file_abs="$(cd "$(dirname "$file")" && pwd)/$(basename "$file")"

  if [[ "$file_abs" == "$output_abs" ]]; then
    continue
  fi

  # Entfernt alte Sammel-Headerzeilen aus Eingabedateien.
  grep -E -v '^### DATEI:.*###$' "$file" >> "$output_file"
  printf '\n\n' >> "$output_file"
  merged_count=$((merged_count + 1))
done

if [[ $merged_count -eq 0 ]]; then
  echo "Keine passenden Dateien zum Zusammenfuehren gefunden." >&2
  rm -f "$output_file"
  exit 1
fi

echo "Fertig. Zusammengefuehrte Datei: $output_file ($merged_count Dateien)"