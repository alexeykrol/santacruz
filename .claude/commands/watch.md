---
description: Start auto-export watcher for dialogs
---

# Dialog Watcher

Start automatic export of Claude Code dialogs as they happen.

## Execute

```bash
.claude/scripts/watch.sh
```

The script is idempotent — safe to run multiple times. It will:
1. Skip if watcher is already running
2. Apply the keep-alive patch to watcher.js if missing (upstream bug: node exits after chokidar.watch())
3. Launch detached via `nohup` so the watcher survives this shell ending

First-time setup (only if `.claude/dist/claude-export/node_modules/` is missing):
```bash
cd .claude/dist/claude-export && npm install && cd ../../..
```

## Features

- Monitors `~/.claude/projects/` for new sessions
- Auto-exports to `dialog/` folder
- Auto-adds to `.gitignore` (private by default)
- Survives terminal/Claude session closing (parent becomes launchd)

## Stop

```bash
pkill -f "claude-export/cli.js watch"
```

## Logs

```bash
tail -f .claude/logs/watcher.log
```
