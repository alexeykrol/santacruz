#!/bin/bash
# Robust dialog watcher launcher.
# - Idempotent: skips if watcher already running
# - Applies keep-alive patch to watcher.js if not yet applied
#   (the upstream tool exits after chokidar.watch() returns; the patch adds
#    a setInterval to keep node alive)
# - Detaches via nohup so it survives this shell ending

set -e
cd "$(dirname "$0")/../.."   # to project root

WATCHER_JS=".claude/dist/claude-export/watcher.js"
LOG=".claude/logs/watcher.log"
PATCH_MARKER="PATCH: keep node alive"

mkdir -p .claude/logs

# 1. Check if already running
if pgrep -f "claude-export/cli.js watch" > /dev/null; then
    PID=$(pgrep -f "claude-export/cli.js watch" | head -1)
    echo "Watcher already running (PID $PID)."
    exit 0
fi

# 2. Apply patch if missing
if [ ! -f "$WATCHER_JS" ]; then
    echo "ERROR: $WATCHER_JS not found. Run: cd .claude/dist/claude-export && npm install"
    exit 1
fi

if ! grep -q "$PATCH_MARKER" "$WATCHER_JS"; then
    echo "Applying keep-alive patch to $WATCHER_JS..."
    # Insert setInterval before "return watcher;" in startWatcher
    python3 -c "
import re
with open('$WATCHER_JS', 'r') as f:
    content = f.read()
patched = content.replace(
    '    await watcher.start();\n    return watcher;\n}',
    '    await watcher.start();\n    // PATCH: keep node alive so chokidar can fire events\n    setInterval(() => {}, 1 << 30);\n    return watcher;\n}'
)
if patched == content:
    raise SystemExit('Could not find anchor for patch — file may be already patched or upstream changed.')
with open('$WATCHER_JS', 'w') as f:
    f.write(patched)
print('Patch applied.')
"
fi

# 3. Launch detached
nohup node .claude/dist/claude-export/cli.js watch > "$LOG" 2>&1 < /dev/null &
disown
sleep 2

# 4. Verify
if pgrep -f "claude-export/cli.js watch" > /dev/null; then
    PID=$(pgrep -f "claude-export/cli.js watch" | head -1)
    echo "Watcher started (PID $PID). Log: $LOG"
else
    echo "ERROR: Watcher failed to start. Check $LOG"
    tail -20 "$LOG"
    exit 1
fi
