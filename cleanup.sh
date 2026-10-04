#!/bin/sh
# Delete kitten clipboard images older than 3 days.
# Usage: cleanup.sh [dir] [days]  (defaults: /tmp 3)
# Cron:  0 3 * * * /path/to/cleanup.sh
# ponytail: mtime guard only, add lsof/fuser check if you hit read-while-delete races
set -eu
dir="${1:-/tmp}"
days="${2:-3}"
find "$dir" -maxdepth 1 -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.gif' -o -iname '*.webp' -o -iname '*.bmp' \) -mtime +"$days" -delete
