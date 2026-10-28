#!/bin/sh
# Syntax-check every script + python file. No TV, no adb needed.
set -e
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
for f in $(find "$ROOT/scripts" "$ROOT/tools" "$ROOT/launchers/tvhome" -name "*.sh" 2>/dev/null); do
  sh -n "$f" || { echo "SYNTAX FAIL: $f"; exit 1; }
done
for f in $(find "$ROOT/tools" -name "*.py" 2>/dev/null); do
  python3 -m py_compile "$f" || { echo "PY FAIL: $f"; exit 1; }
done
echo "syntax OK"
