#!/bin/sh
# tv-clean orchestrator (new code, MIT): chains detect -> candidates -> confirm
# -> tools/disable.sh -> launcher install. Changes nothing until you confirm.
#   sh scripts/clean.sh <TV_IP> <debloat-list.txt> [--launcher cleanyourtv|tvhome]
set -e
TV="$1"; LIST="$2"; LAUNCHER=cleanyourtv
[ -n "$TV" ] && [ -f "$LIST" ] || { echo "Usage: sh scripts/clean.sh <TV_IP> <debloat-list.txt> [--launcher cleanyourtv|tvhome]" >&2; exit 2; }
for a in "$@"; do case "$a" in --launcher) shift;; cleanyourtv|tvhome) LAUNCHER=$a;; esac; done
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
sh "$ROOT/scripts/detect.sh" "$TV"
echo "--- candidates (review before anything is disabled) ---"
sh "$ROOT/scripts/candidates.sh" "$TV"
echo "--- about to disable the packages in $LIST and set $LAUNCHER as Home ---"
printf "Type YES to continue: "; read -r ok
[ "$ok" = "YES" ] || { echo "Aborted. Nothing changed."; exit 1; }
TV_HOST="$TV" sh "$ROOT/tools/disable.sh" "$LIST"
echo "--- verify ---"
sh "$ROOT/scripts/check.sh" "$TV"
echo "Done. Launcher install: see launchers/$LAUNCHER (build-and-install.sh / build.sh)."
echo "When finished, turn USB/network debugging OFF on the TV."
