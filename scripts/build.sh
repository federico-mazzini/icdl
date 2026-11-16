#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."
build_dir=$(mktemp -d)
trap 'rm -rf "$build_dir"' EXIT

count=0
for source in src/*.typ; do
  [[ -f "$source" ]] || continue
  name=${source##*/}
  output=${name%.typ}.pdf
  printf 'Compilo %s\n' "$name"
  typst compile --root . "$source" "$build_dir/$output"
  test -s "$build_dir/$output"
  count=$((count + 1))
done

if [[ "$count" -eq 0 ]]; then
  printf 'Nessun sorgente Typst trovato in src/.\n' >&2
  exit 1
fi

python3 scripts/build_index.py "$build_dir"
touch "$build_dir/.nojekyll"
mkdir -p dist
# Aggiorna gli output solo dopo che tutti i PDF sono stati compilati.
cp "$build_dir/"*.pdf "$build_dir/index.html" "$build_dir/.nojekyll" dist/
printf 'Compilati %s PDF in dist/.\n' "$count"
