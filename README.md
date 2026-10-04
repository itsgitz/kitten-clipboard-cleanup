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

Args: `cleanup.sh [dir] [days]` (defaults: `/tmp` `3`).

## Safety

- Top-level images only (`png/jpg/jpeg/gif/webp/bmp`, case-insensitive), `-type f`, `-mtime +N` guard so in-use screenshots survive.
- Dry run: `find /tmp -maxdepth 1 -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.gif' -o -iname '*.webp' -o -iname '*.bmp' \) -mtime +3 -print`
