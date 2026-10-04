# AGENTS.md

POSIX `sh`, zero deps. Single script: `cleanup.sh [dir] [days]` (see `README.md` for install).

Verify with `sh -n cleanup.sh`; keep the `find -maxdepth 1 -type f \( -iname ... \) -mtime` guard.
