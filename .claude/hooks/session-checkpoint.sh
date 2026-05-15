#!/bin/bash
# Session-checkpoint hook (Stop event).
# Срабатывает после каждого ответа ассистента.
# Извлекает хвост текущего jsonl-транскрипта и пишет краткое resumé
# в .claude/LAST_SESSION.md, чтобы следующая сессия не начиналась с нуля.
#
# Стоимость одного запуска: ~100-300 ms (tail + jq -s по последним 400 строкам).
# Молчит в stdout, чтобы не мешать UI.

set +e

PROJECT_DIR="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
OUT="$PROJECT_DIR/.claude/LAST_SESSION.md"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# 1. Получить transcript_path из stdin (Claude Code передаёт JSON-payload).
INPUT="$(cat 2>/dev/null)"
TRANSCRIPT="$(printf '%s' "$INPUT" | jq -r '.transcript_path // empty' 2>/dev/null)"

# 2. Fallback: если payload не прилетел, взять самый свежий jsonl
#    в каталоге транскриптов этого проекта.
if [ -z "$TRANSCRIPT" ] || [ ! -f "$TRANSCRIPT" ]; then
    CC_PROJECTS="$HOME/.claude/projects"
    # Имя каталога проекта = путь с / заменёнными на -. Точки сохраняются.
    PROJECT_SLUG="$(printf '%s' "$PROJECT_DIR" | sed 's:/:-:g')"
    CANDIDATE_DIR="$CC_PROJECTS/$PROJECT_SLUG"
    if [ -d "$CANDIDATE_DIR" ]; then
        TRANSCRIPT="$(ls -t "$CANDIDATE_DIR"/*.jsonl 2>/dev/null | head -1)"
    fi
fi

if [ -z "$TRANSCRIPT" ] || [ ! -f "$TRANSCRIPT" ]; then
    exit 0
fi

# 3. Tail последних ~400 строк jsonl — хватает на 5-10 ходов.
TAIL_CONTENT="$(tail -400 "$TRANSCRIPT" 2>/dev/null)"
if [ -z "$TAIL_CONTENT" ]; then
    exit 0
fi

# 4. Извлечь последние 8 пользовательских реплик (без tool_result, system reminders, slash-команд).
USER_TAIL="$(printf '%s' "$TAIL_CONTENT" | jq -r '
  select(.type=="user")
  | select(.message.content | type == "string")
  | select(.message.content | startswith("<") | not)
  | select(.message.content | test("^/[a-z]"; "i") | not)
  | (.timestamp // "?") + " | " + (.message.content | gsub("\\n"; " ") | .[0:280])
' 2>/dev/null | tail -8)"

# 5. Последняя текстовая реплика ассистента (целиком, до 4000 символов).
LAST_ASSISTANT="$(printf '%s' "$TAIL_CONTENT" | jq -s '
  [ .[] | select(.type=="assistant")
        | { ts: (.timestamp // ""),
            text: ([.message.content[]? | select(.type=="text") | .text] | join("\n")) }
  ]
  | map(select(.text != ""))
  | (last // {ts:"", text:""})
  | "\(.ts)\n\n\(.text)"
' 2>/dev/null | sed 's/^"//; s/"$//' | head -c 4000)"

# 6. Кратко: на каких файлах ассистент работал в этом ходу (последние Edit/Write/Read).
RECENT_FILES="$(printf '%s' "$TAIL_CONTENT" | jq -r '
  select(.type=="assistant")
  | .message.content[]?
  | select(.type=="tool_use" and (.name=="Edit" or .name=="Write" or .name=="Read"))
  | .name + " " + (.input.file_path // .input.path // "?")
' 2>/dev/null | tail -10)"

# 7. Записать LAST_SESSION.md.
{
    printf '# Last session — auto-checkpoint\n\n'
    printf '*Updated: %s*\n' "$TIMESTAMP"
    printf '*Transcript: `%s`*\n\n' "$TRANSCRIPT"
    printf '> Файл обновляется автоматически на каждом ходе ассистента.\n'
    printf '> Цель: при следующем `/start` агент сможет показать тебе хвост\n'
    printf '> прошлой сессии — не надо начинать с нуля, можно пролистать и продолжить.\n\n'

    printf '## Хвост последних пользовательских реплик\n\n'
    printf '```\n%s\n```\n\n' "$USER_TAIL"

    printf '## Файлы, тронутые в последнем ходу\n\n'
    if [ -n "$RECENT_FILES" ]; then
        printf '```\n%s\n```\n\n' "$RECENT_FILES"
    else
        printf '*(нет файловых операций в последнем ходу)*\n\n'
    fi

    printf '## Последний ответ ассистента (до 4 КБ)\n\n'
    printf '%s\n' "$LAST_ASSISTANT"
} > "$OUT.tmp" 2>/dev/null && mv "$OUT.tmp" "$OUT" 2>/dev/null

exit 0
