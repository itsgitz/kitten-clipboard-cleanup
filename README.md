# kitten-clipboard-cleanup

Delete stale `kitten clipboard -g /tmp/*` images via daily cron.

## Install

```sh
chmod +x cleanup.sh
crontab -e
```

```cron
0 3 * * * /path/to/cleanup.sh /tmp 3
```

Usage: `cleanup.sh [dir] [days]`

| Arg | Default | What it does |
| --- | --- | --- |
| `dir` | `/tmp` | Directory to clean (top level only, no recursion). |
| `days` | `3` | Delete images with mtime older than N days (`-mtime +N`). |

```sh
./cleanup.sh            # clean /tmp, older than 3 days
./cleanup.sh /tmp 7     # clean /tmp, older than 7 days
./cleanup.sh ~/Pictures 1  # clean ~/Pictures, older than 1 day
```

## Safety

- Top-level images only (`png/jpg/jpeg/gif/webp/bmp`, case-insensitive), `-type f`, `-mtime +N` guard so in-use screenshots survive.
- Dry run: `find /tmp -maxdepth 1 -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.gif' -o -iname '*.webp' -o -iname '*.bmp' \) -mtime +3 -print`
