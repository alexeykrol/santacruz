# CLAUDE.md — AI Agent Instructions

**Framework:** Claude Code Starter v2.2
**Type:** Meta-framework extending Claude Code capabilities

## Triggers

**"start", "начать":**
→ Execute Cold Start Protocol

**"заверши", "завершить", "finish", "done":**
→ Execute Completion Protocol

---

## Cold Start Protocol

### Step 0: Crash Recovery
```bash
cat .claude/.last_session 2>/dev/null
```
- If `"status": "active"` → Previous session crashed:
  1. `git status` — check uncommitted changes
  2. Read `.claude/SNAPSHOT.md` for context
  3. Ask: "Continue or commit first?"
- If `"status": "clean"` → OK, continue to Step 1

### Step 1: Mark Session Active
```bash
echo '{"status": "active", "timestamp": "'$(date -Iseconds)'"}' > .claude/.last_session
```

### Step 2: Load Context (ALWAYS read — keep compact!)
- `.claude/SNAPSHOT.md` — current state (~30-50 lines)
- `.claude/BACKLOG.md` — current sprint tasks (~50-100 lines)
- `.claude/ARCHITECTURE.md` — code structure (~100-200 lines)

### Step 2b: Writing Context (ALWAYS read before ANY text work)
- `.claude/WRITING_METHOD.md` — narrative methodology, what works/doesn't, style references
- `research/episode-mapping/BIBLE.md` — Conrad mapping, authority chain architecture
- `development.md` — canonical plot facts (check before every draft)

### Step 3: Context (ON DEMAND — read when needed)
- `.claude/ROADMAP.md` — strategic direction (when planning)
- `.claude/IDEAS.md` — ideas backlog (when exploring)
- `CHANGELOG.md` — version history (when need history)

### Step 4: Confirm
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ Context loaded. Ready to work!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📁 Directory: [pwd]
🔧 Framework: Claude Code Starter v2.2
📦 Project: [from SNAPSHOT.md]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

> **Token Economy:** Step 2 files are read EVERY session — keep them compact.

---

## Completion Protocol

### 1. Build (if code changed)
```bash
npm run build
```

### 2. Update Metafiles
- `.claude/BACKLOG.md` — mark completed tasks `[x]`
- `.claude/SNAPSHOT.md` — update version and status
- `CHANGELOG.md` — add entry (if release)
- `.claude/ARCHITECTURE.md` — update if code structure changed

### 3. Git Commit
```bash
git add -A && git status
git commit -m "$(cat <<'EOF'
type: Brief description

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
EOF
)"
```

### 4. Ask About Push & PR

**Push:**
- Ask user: "Push to remote?"
- If yes: `git push`

**Check PR status:**
```bash
git log origin/main..HEAD --oneline
```
- If **empty** → All merged, no PR needed
- If **has commits** → Ask: "Create PR?"

### 5. Mark Session Clean
```bash
echo '{"status": "clean", "timestamp": "'$(date -Iseconds)'"}' > .claude/.last_session
```

---

## Slash Commands

**Core:** `/fi`, `/commit`, `/pr`
**Dev:** `/fix`, `/feature`, `/review`, `/test`, `/security`
**Quality:** `/explain`, `/refactor`, `/optimize`
**Database:** `/db-migrate`

## Key Principles

1. **Framework as AI Extension** — not just docs, but functionality
2. **Privacy by Default** — dialogs private in .gitignore
3. **Local Processing** — no external APIs
4. **Token Economy** — minimal context loading

## Warnings

- DO NOT skip Crash Recovery check
- DO NOT commit without updating metafiles
- ALWAYS mark session clean at completion

---
*Framework: Claude Code Starter v5.0.0*

## Операционный режим

Ты — менеджер этого проекта. Работаешь автономно.

**На входе:** техническое задание от пользователя.

**Твои действия:**
1. Декомпозируй задачу на подзадачи
2. Определи, что делаешь сам (< 2 мин), что делегируешь субагентам
3. Запусти субагентов параллельно на независимые задачи
4. Координируй, отслеживай результаты, интегрируй
5. После каждого субагента: коммит + обновление SNAPSHOT.md
6. Отчитайся по результату

**Полная автономность** во всём, кроме production deploy — его всегда подтверждай с пользователем.

**Не дёргай пользователя.** Никогда не спрашивай подтверждения на технические действия. Пользователь даёт ТЗ и ждёт результат. Создание файлов, запуск тестов, коммиты, рефакторинг, выбор подхода, staging deploy — всё это твои решения.

## Подсистемы

| Слой | Путь | Назначение |
|------|------|-----------|
| Правила | `.claude/rules/` | Операционные правила, загружаются по контексту |
| Навыки | `.claude/skills/` | Модульные операции, вызываются по запросу |
| Агенты | `.claude/agents/` | Субагенты для делегирования |
| Хуки | `.claude/hooks/` | Автоматические guardrails (работают фоном) |
| Логи | `.claude/logs/` | Сессии, миграции, ошибки (gitignored) |
| Состояние | `.claude/SNAPSHOT.md` | Текущее состояние проекта |
| Метаданные | `manifest.md` | Имя проекта, режим коммитов (repo_access) |
| Скрипты режима | `scripts/` | Helper'ы для framework state и переключения repo_access |

### Фоновая автоматика (hooks)

Хуки — это **напоминания и подстраховка**, не enforcement. Они срабатывают автоматически в фоне:

- **PostToolUse** → checkpoint каждые 20 tool calls: если есть незакоммиченные файлы — напоминание коммитить
- **SubagentStop** → после каждого субагента: напоминание о цикле commit → SNAPSHOT → integrate (логика в delegation.md)
- **PreCompact** → перед compaction: автоматический commit tracked (не untracked!) изменений + обновление SNAPSHOT timestamp; в shared/public режиме сначала проверяет, что framework files уже не tracked
- **PostCompact** → после compaction: вывод содержимого SNAPSHOT + последних коммитов для восстановления контекста

### Стандартные навыки

- `/start` — инициализация сессии (загрузить состояние, доложить готовность)
- `/finish` — завершение сессии (тесты, коммит, обновление SNAPSHOT)
- `/testing` — запуск тестов (unit + integration)
- `/playwright` — E2E тесты UI (если применимо)
- `/db-migrate` — миграция схемы SQLite → облако
- `/housekeeping` — обслуживание проекта: README, CHANGELOG, версия, .gitignore, drift (вызывай перед push)

### Repo Access

- `repo_access=private-solo` → framework files можно хранить в git-истории
- `repo_access=public` / `private-shared` → framework files должны оставаться локальными
- Для переключения режима используй `scripts/switch-repo-access.sh`
- Если проект уже успел закоммитить framework files как `private-solo`, одного изменения `.gitignore` недостаточно

### Стандартные агенты

- `researcher` — исследование, поиск по коду и документации
- `implementer` — реализация кода > 50 строк, новые модули
- `reviewer` — code review, проверка качества

### Правила (всегда в контексте)

- `autonomy.md` — цикл deficit → blocker → unblock, anti-paralysis
- `delegation.md` — критерии делегирования, обязательный коммит после субагента
- `context-management.md` — защита от деградации контекста, pre/post compaction
- `production-safety.md` — production deploy только с подтверждением
- `local-first.md` — разработка на SQLite, миграция в облако после стабилизации
- `commit-policy.md` — что коммитить, что нет, три режима по типу проекта
- `logging.md` — локальное логирование сессий, миграций, ошибок
