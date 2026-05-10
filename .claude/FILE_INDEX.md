# FILE_INDEX.md — Полный каталог проекта

> **Назначение:** Самостоятельная навигация ИИ по 150+ файлам проекта без помощи пользователя.
> **Правило:** При создании нового файла — добавить его в этот индекс.
> **Обновлено:** 2026-04-18

---

## ЧАСТЬ 1: Каталог по категориям

### 🔧 ФРЕЙМВОРК / META (.claude/)

| Файл | Назначение |
|------|-----------|
| `.claude/SNAPSHOT.md` | Текущее состояние проекта: фаза, прогресс, блокеры. Читать при холодном старте |
| `.claude/BACKLOG.md` | Текущий спринт: задачи Q1-Q4, приоритеты. Читать при холодном старте |
| `.claude/WRITING_METHOD.md` | Методология написания: Conrad, что работает/не работает, стилевые ориентиры |
| `.claude/ARCHITECTURE.md` | Архитектура фреймворка |
| `.claude/ROADMAP.md` | Стратегический план фаз 1→3 |
| `.claude/IDEAS.md` | Идеи — спонтанные концепции и мозговой штурм |
| `.claude/FILE_INDEX.md` | Этот файл — полный каталог проекта |
| `CLAUDE.md` | Инструкции для ИИ, Cold Start Protocol |
| `manifest.md` | repo_access=private-solo, режим коммитов |
| `README.md` | Обзор проекта для людей |
| `CHANGELOG.md` | История версий проекта |
| `EPISODE_STRUCTURE.md` | **ВАЖНО** — структура эпизода: что обязательно в каждом эпизоде |
| `SCENE_STRUCTURE.md` | **ВАЖНО** — структура сцены: POV, давление, финальный образ |

---

### 🌌 КАНОН МИРА (1_universe/)

#### Главный источник
| Файл | Назначение |
|------|-----------|
| `1_universe/ludens_civilization/UNDERSTANDING.md` | **ПОЛНАЯ ОНТОЛОГИЯ** — 9 уровней реальности, 1173 строки. Читать только нужные секции |
| `1_universe/universe_questions.md` | 40+ критичных вопросов для проработки мира |
| `1_universe/ответы_universe_questions.md` | Рабочая копия для записи ответов на вопросы |

#### Фундаментальные концепции (7 файлов)
| Файл | Назначение |
|------|-----------|
| `1_universe/fundamental_concepts/chaos_order_philosophy.md` | Философия Хаос/Порядок — базовый конфликт вселенной |
| `1_universe/fundamental_concepts/ethics_code.md` | Этический Кодекс КД — почему нельзя стирать память, ограничения действий |
| `1_universe/fundamental_concepts/human_vs_ai.md` | Человек vs ИИ — ИИ не способен к инсайтам, это ключ к нарративному хакингу |
| `1_universe/fundamental_concepts/ludens_and_pre_ludens.md` | Люденс и пре-Люденс — кто есть кто, стадии пробуждения |
| `1_universe/fundamental_concepts/reality_protocols.md` | Протоколы реальности — как устроена физика мира |
| `1_universe/fundamental_concepts/recursion_wall.md` | Стена Рекурсии — что это, зачем нужна (Q3) |
| `1_universe/fundamental_concepts/smart_plots.md` | РС (Разумные Сюжеты) — мониторинг реальности, почему не видел атаку (Q4) |

#### Институты и прочее
| Файл | Назначение |
|------|-----------|
| `1_universe/institutions/committee_designers/overview.md` | КД — Комитет Дизайнеров: структура, полномочия |
| `1_universe/ludens_realm/README.md` | Царство Люденс |
| `1_universe/ontology/` | 8 файлов — исторические черновики онтологии. Читать только если UNDERSTANDING.md недостаточно |

---

### 🌍 СЕТТИНГ (2_settings/)

| Файл | Назначение |
|------|-----------|
| `2_settings/earth/earth_game/README.md` | Земля как игровой мир: правила, особенности |
| `2_settings/earth/organizations/earth_list_org.md` | Список всех земных организаций в истории |
| `2_settings/earth/organizations/fema_earth.md` | FEMA Region IX — роль в Санта-Крузе, полномочия, ограничения |

---

### 📖 КАНОН ИСТОРИИ (3_stories/santa_cruz_incident/)

#### Обзор инцидента
| Файл | Назначение |
|------|-----------|
| `3_stories/santa_cruz_incident/_overview/timeline.md` | **АВТОРИТЕТНЫЙ ТАЙМЛАЙН** — день за днём с часами. Читать перед любым эпизодом |
| `3_stories/santa_cruz_incident/_overview/attackers.md` | **КАНОН** — кто атаковал: Хакер + Заказчик, нарративный хакинг, почему РС не видел |

#### Персонажи КД
| Файл | Назначение |
|------|-----------|
| `3_stories/santa_cruz_incident/characters/committee_team/README.md` | Обзор команды КД |
| `3_stories/santa_cruz_incident/characters/committee_team/senior_officer.md` | Старший — прагматик, следует букве Кодекса, видит землян как "умных детей" |
| `3_stories/santa_cruz_incident/characters/committee_team/specialist.md` | Специалист — хочет поделиться красотой протоколов, не может из-за Кодекса |
| `3_stories/santa_cruz_incident/characters/committee_team/informal_operative.md` | Раздолбай — недавно завершил Квест, глубокая эмпатия к землянам, мост КД↔земляне |

#### Персонажи земной команды
| Файл | Назначение |
|------|-----------|
| `3_stories/santa_cruz_incident/characters/earth_team/README.md` | Земная команда: состав, роли, когда появляются (не раньше Days 3-7!) |

#### Объекты
| Файл | Назначение |
|------|-----------|
| `3_stories/santa_cruz_incident/objects/protective_field.md` | **КАНОН** — физика поля: купол 2км, что пропускает/блокирует, цвет, исчезновение |
| `3_stories/santa_cruz_incident/objects/hurricane.md` | **КАНОН** — ураган как оружие: Cat 5, невозможная траектория, побочный эффект Хакера |
| `3_stories/santa_cruz_incident/objects/artifacts_investigation.md` | 16000→79→50 артефактов: 4 категории, ход расследования |
| `3_stories/santa_cruz_incident/objects/suspects_investigation.md` | Подозреваемые: кого проверяли, результаты |

#### Организации
| Файл | Назначение |
|------|-----------|
| `3_stories/santa_cruz_incident/organizations/earth_investigation_team.md` | Земная следственная группа — формируется Days 3-7, НЕ раньше |

#### Нарративная структура
| Файл | Назначение |
|------|-----------|
| `3_stories/santa_cruz_incident/narrative_structure/README.md` | Обзор: Часть 1 (Земля) + Часть 2 (КД) — общая структура |
| `3_stories/santa_cruz_incident/narrative_structure/part1_earth/README.md` | Часть 1 — Земля: три акта, эпизоды, принципы |
| `3_stories/santa_cruz_incident/narrative_structure/part1_earth/act1_anomaly/README.md` | Акт 1 — 7 сцен: шторм, цунами, поле, первые наблюдения, инфо-взрыв, власти, эвакуация |
| `3_stories/santa_cruz_incident/narrative_structure/part1_earth/act2_investigation/README.md` | Акт 2 — Расследование |
| `3_stories/santa_cruz_incident/narrative_structure/part1_earth/act3_contact/README.md` | Акт 3 — Контакт |
| `3_stories/santa_cruz_incident/narrative_structure/part2_admin/README.md` | Часть 2 — КД: административный слой |
| `3_stories/santa_cruz_incident/narrative_structure/part2_admin/act1_incident/README.md` | Часть 2, Акт 1 — административный слой (КД) |

---

### 📋 ПЛАНИРОВАНИЕ (meta/)

| Файл | Назначение |
|------|-----------|
| `meta/scene_ideas.md` | **КРИТИЧНО ДЛЯ ЭПИЗОДОВ** — идеи сцен из development.md. Читать перед каждым эпизодом |
| `meta/plans/part1_outline.md` | 8 канонических событий Части 1, дуги персонажей (Следователь, Военный, Учёный) |
| `meta/plans/part2_outline.md` | Структура Части 2, варианты раскрытия правды (3 опции) |
| `meta/notes/ontology_to_story.md` | Маппинг уровней онтологии на элементы сюжета (65k свидетелей = Люденс в Квесте) |
| `meta/notes/questions.md` | 6 ключевых проблем (PR1-PR6): РС vs нарративный хакинг, серые ветки |
| `meta/WORLD_STRUCTURE.md` | Кратко 9 уровней + стандарты письма (русский, 3-е лицо, прошедшее время, глоссарий) |
| `meta/PROCESS.md` | Описание процесса работы |
| `meta/PROJECT_SNAPSHOT.md` | Снапшот проекта (устаревший?) |
| `meta/PROJECT_INTAKE.md` | Первичное описание проекта |
| `meta/BACKLOG.md` | Бэклог (метаслой, отдельный от .claude/BACKLOG.md) |
| `meta/VERSIONING_GUIDE.md` | Руководство по версионированию |

---

### 🔬 ИССЛЕДОВАНИЯ (research/)

| Файл | Назначение |
|------|-----------|
| `research/episode-mapping/BIBLE.md` | **КРИТИЧНО ДЛЯ ЭПИЗОДОВ** — Conrad-маппинг эп.001-003, цепь полномочий FEMA→DHS→USNORTHCOM→JCS→NSC, ошибки в черновиках |
| `research/steven-conrad/METHOD.md` | **ПОЛНЫЙ МЕТОД КОНРАДА v1.4** — 627 строк, реконструкция из 9 часов транскриптов. Want/Need/Deserve, ставки=здоровье персонажа, структура, диалог, субверсия жанра |
| `research/steven-conrad/analysis/deep_analysis.md` | Глубокий анализ метода Конрада — расширенный разбор паттернов из всего корпуса |
| `research/steven-conrad/README.md` | Обзор папки Conrad research: что где лежит |
| `research/steven-conrad/raw/text/` | 4 исходных текста интервью Конрада (Chicago Mag, AV Club, Collider, цитаты) |
| `research/steven-conrad/transcripts/max_tony_show_ep8.txt` | Транскрипт подкаста Max & Tony Show ep.8 — ежедневная практика Конрада |
| `research/steven-conrad/metodologiya_iz_intervyu_stsenarista.md` | Руководство по извлечению методологии из интервью (мета-документ) |
| `_personal/research/tsunami.md` | Исследование цунами — физика, статистика (личный архив, большой файл) |
| `_personal/research/amelie_screenplay.md` | Сценарий "Амели" — стилевой ориентир для нарратора (личный архив) |
| `_personal/research/battleship_2012_transcript.md` | Транскрипт "Морского боя 2012" (личный архив) |
| `_personal/research/Robocop and The Terminator.md` | Анализ Робокопа и Терминатора (личный архив) |
| `_personal/research/choudary/INDEX.md` | Индекс серии Чоудари — 30+ файлов (личный архив) |
| `_personal/research/war_of_the_worlds_2005_final_shooting_screenplay.md` | Сценарий «Войны миров» 2005 — Кёп/Спилберг, источник приёмов (личный архив) |

---

### 🎨 СТИЛЕВЫЕ ОРИЕНТИРЫ (projects/)

| Файл | Назначение |
|------|-----------|
| `projects/skazochnitsa/КОЛОБОК.md` | **ГЛАВНЫЙ СТИЛЕВОЙ ОРИЕНТИР** — плоская подача абсурда, пауза=абзац, без восклицательных |
| `projects/skazochnitsa/Тайна последней сказки.md` | Сказочный стиль — оригинал |
| `projects/skazochnitsa/Тайна последней сказки — версия Конрада.md` | То же через призму метода Конрада |
| `projects/skazochnitsa/BIBLE.md` | Библия проекта Сказочница |

---

### 💬 РАЗГОВОРЫ С АВТОРОМ (talks/)

*Содержат авторские решения, принятые в диалоге. Читать при неясности о конкретном элементе мира.*

| Файл | Назначение |
|------|-----------|
| `talks/07-02-26.md` | **КЛЮЧЕВОЙ** — механика нарративного хакинга: два потока, принцип брутфорса реальности |
| `talks/04-04-26.md` | Последний разговор (апрель 2026) |
| `talks/21-03-26.md` | Март 2026 |
| `talks/21-02-26.md` | Февраль 2026 |
| `talks/24-01-26.md` | Январь 2026 |
| `talks/17-01-26.md` | Январь 2026 |
| `talks/31-01-26.md` | Январь 2026 |
| `talks/01-10-2026.md` | Октябрь 2026 (!) |
| `talks/13-12-25.md` | Декабрь 2025 |
| `talks/19-12-25.md` | Декабрь 2025 |
| `talks/21-12-25.md` | Декабрь 2025 |
| `talks/chatgptcomment.md` | Комментарий ChatGPT о проекте |
| `talks/geminicomment.md` | Комментарий Gemini о проекте |
| `talks/grokcomment.md` | Комментарий Grok о проекте |
| `talks/hawking-radiation-analogy.md` | Аналогия с излучением Хокинга — физическое обоснование утечки через поле |
| `talks/short.md` | Краткое резюме |

---

### 🤖 AI-РАЗГОВОРЫ (ai-talks/)

| Файл | Назначение |
|------|-----------|
| `ai-talks/README.md` | Обзор папки |
| `ai-talks/talk14-12-25.md` | ИИ-разговор декабрь 2025 |
| `ai-talks/deck_001.md` | Дека 001 |
| `ai-talks/money.md` | Тема: деньги/монетизация |
| `ai-talks/scale.md` | Тема: масштаб |
| `ai-talks/explor_001.md` | Исследование 001 |
| `ai-talks/gemini.md` | ИИ-разговор с Gemini — стороннее мнение о проекте |

---

### 📰 СТАТЬИ (articles/)

| Файл | Назначение |
|------|-----------|
| `articles/nicbostrom.md` | Статья Ника Бострома — симуляционный аргумент (теоретическая база мира)

---

### 📝 ЧЕРНОВИКИ (drafts/)

| Файл | Назначение |
|------|-----------|
| `drafts/episode001/episode001-v8.1.md` | **ФИНАЛЬНАЯ ВЕРСИЯ эп.001** (v8.1) — смержена в main |
| `drafts/episode001/README.md` | Метаданные эпизода 001 |
| `drafts/episode002/episode002-v9.md` | **ТЕКУЩАЯ ВЕРСИЯ эп.002** (v9) — PR #20 правки + Highway 17 reframe |
| `drafts/episode002/README.md` | Метаданные эпизода 002: Want/Need/Deserve, структура, связь с ep001 |
| `drafts/episode003/` | Пустая — ждёт принятой версии. Промежуточные черновики и канва v3 — в `_personal/drafts/episode003/` |
| `drafts/master/README.md` | Книжная версия (пуста) |
| `_personal/drafts/episode001/` | Архив всех промежуточных версий эп.001 (v1–v8, v7.x, ранние сцены — личное) |
| `_personal/drafts/episode002/` | Архив v1–v7 эп.002 (личное) |
| `_personal/drafts/episode003/` | Все рабочие материалы эп.003: canvas-v3.md, episode003-v1.md, episode003-v2.md (личное) |

---

### 📏 ШАБЛОНЫ (templates/)

| Файл | Назначение |
|------|-----------|
| `templates/scene_template.md` | Шаблон сцены |
| `templates/character_template.md` | Шаблон персонажа |
| `templates/location_template.md` | Шаблон локации |
| `templates/episode_readme_template.md` | Шаблон README эпизода |

---

### 📚 КРУПНЫЕ БАЗОВЫЕ ФАЙЛЫ (только по запросу)

| Файл | Размер | Назначение |
|------|--------|-----------|
| `development.md` | ~91k символов | Канонические факты сюжета — первоисточник. ТОЛЬКО по запросу или для проверки конкретного факта |
| `Exegesis.md` | Большой | Философские тексты Ф.К.Дика — вдохновение для симуляционной тематики |
| `_personal/research/tsunami.md` | Большой | Физика цунами — детальные данные (личный архив) |
| `1_universe/ludens_civilization/UNDERSTANDING.md` | 1173 строки | Полная онтология — только нужные секции |

---

## ЧАСТЬ 2: Списки чтения по задаче

### Перед написанием эпизода

```
ОБЯЗАТЕЛЬНО:
1. research/episode-mapping/BIBLE.md — Conrad-маппинг, цепь полномочий, ошибки
2. 3_stories/santa_cruz_incident/_overview/timeline.md — что именно происходит в это время
3. meta/scene_ideas.md — идеи сцен для этого эпизода
4. .claude/WRITING_METHOD.md — методология (Want/Need, давление, singable phrase)

ПО ЭПИЗОДУ:
5. drafts/episode001/episode001-v8.1.md — если продолжаем, нужен тон предыдущего
6. meta/plans/part1_outline.md — какую роль эпизод играет в общей дуге

ДЛЯ ФИЗИКИ МИРА:
7. 3_stories/santa_cruz_incident/objects/protective_field.md — поле (если появляется)
8. 3_stories/santa_cruz_incident/objects/hurricane.md — ураган (если упоминается)
```

### Перед созданием персонажа

```
1. templates/character_template.md — шаблон
2. meta/WORLD_STRUCTURE.md — стандарты (русский язык, глоссарий!)
3. meta/notes/ontology_to_story.md — уровень пробуждения персонажа
4. 3_stories/santa_cruz_incident/characters/ — существующие персонажи (не дублировать)
5. 1_universe/fundamental_concepts/ethics_code.md — ограничения для Люденс
```

### Перед проверкой консистентности мира

```
1. meta/WORLD_STRUCTURE.md — стандарты письма, глоссарий (Люденс, не Люденсы; КД, не Комитет Дизайна)
2. 3_stories/santa_cruz_incident/_overview/timeline.md — хронология
3. 3_stories/santa_cruz_incident/_overview/attackers.md — канон атаки
4. meta/notes/questions.md — известные противоречия (PR1-PR6)
5. 1_universe/fundamental_concepts/human_vs_ai.md — РС не может предсказать инсайты
```

### Перед написанием сцены с землянами/властями

```
1. research/episode-mapping/BIBLE.md — цепь полномочий FEMA→DHS→USNORTHCOM→JCS→NSC
2. 2_settings/earth/organizations/fema_earth.md — FEMA: что может, что не может
3. 2_settings/earth/organizations/earth_list_org.md — какие org существуют
4. 3_stories/santa_cruz_incident/organizations/earth_investigation_team.md — НЕ появляется до Days 3-7
5. `_personal/research/battleship_2012_transcript.md` — образец военного диалога (опционально, личный архив)
```

### Перед написанием сцены с КД

```
1. 3_stories/santa_cruz_incident/characters/committee_team/ — все три профиля
2. 1_universe/fundamental_concepts/ethics_code.md — что КД может/не может делать
3. 1_universe/institutions/committee_designers/overview.md — структура КД
4. meta/notes/ontology_to_story.md — как КД видит землян
```

### Перед ответом на вопрос о нарративном хакинге / атаке

```
1. 3_stories/santa_cruz_incident/_overview/attackers.md — КАНОН (исчерпывающий)
2. talks/07-02-26.md — детали механики (два потока, брутфорс)
3. 1_universe/fundamental_concepts/human_vs_ai.md — почему РС не видел (ИИ ≠ инсайт)
```

---

## ЧАСТЬ 3: Быстрые ответы

| Вопрос | Файл | Ключевой факт |
|--------|------|--------------|
| Кто атаковал Санта-Круз? | `_overview/attackers.md` | Хакер (автономный Люденс) + Заказчик (теневая фракция) |
| Почему РС не видел? | `_overview/attackers.md` + `human_vs_ai.md` | Атака шла через нарративный слой (уровни 4-2↓), РС мониторит 4-3; РС = ИИ, не способен предсказать творческий инсайт |
| Как выглядит поле? | `objects/protective_field.md` | Днём: тонкая переливающаяся плёнка. Ночью: слабое синее свечение (на фото невидимо). Высота ~2км |
| Когда формируется земная следственная группа? | `organizations/earth_investigation_team.md` | Days 3-7, не раньше |
| Что такое КД? | `institutions/committee_designers/overview.md` | Комитет Дизайнеров — Люденс, завершившие полный путь Квеста |
| Правильно: Люденс или Люденсы? | `meta/WORLD_STRUCTURE.md` | "Люденс" (не склоняется во множественном) |
| Правильно: КД или Комитет Дизайна? | `meta/WORLD_STRUCTURE.md` | "Комитет Дизайнеров (КД)" |
| Кто из КД в эп.001? | `BIBLE.md` + `committee_team/` | Старший, Специалист, Раздолбай |
| Что происходит в Day 2? | `_overview/timeline.md` | Вертолёты из Моффет/Сан-Хосе/Салинас, спутники подтверждают купол, решение об эвакуации |
| Где эп.002 в таймлайне? | `_overview/timeline.md` + `meta/scene_ideas.md` | Вечер Day 1 → Day 3: поле как объект, вертолёты, эвакуация 65k, город-призрак |
| Что такое нарративный хакинг? | `_overview/attackers.md` | Нарративы как промпты к реальности. Поиск корреляций "нарратив → физический отклик". Шторм = побочный эффект |
| Каков масштаб проекта MVP? | `.claude/SNAPSHOT.md` | ~100,000 слов, Часть 1 (Земля) |
| Какой стиль у КОЛОБОК? | `projects/skazochnitsa/КОЛОБОК.md` | Плоская подача абсурда, пауза = отдельный абзац, без восклицательных знаков |

---

## ПРАВИЛО ОБНОВЛЕНИЯ

**При создании нового файла:**
1. Добавь строку в соответствующую таблицу Части 1
2. Если файл влияет на ответ на вопрос — добавь строку в Часть 3
3. Если файл нужен перед конкретным типом задач — добавь в Часть 2

**При обновлении существующего файла:**
- Если изменился статус (черновик → канон) — обнови пометку в Части 1
- Если изменился ключевой факт — обнови Часть 3

---

## ПРАВИЛО ДЛЯ ВЕТОК

**Проблема:** проект развивался на нескольких git-ветках. Файлы создавались на одной ветке и не переносились в рабочую.

**Правило при обнаружении нового файла:**
- Если файл не появляется через Glob/Grep — проверь другие ветки: `git branch -a`
- Чтобы увидеть файлы ветки: `git ls-tree -r --name-only <branch>`
- Чтобы скопировать файл из другой ветки: `git show <branch>:<path> > <path>`
- После копирования — добавить в FILE_INDEX.md и закоммитить

**Ветки проекта (статус на 2026-04-18):**
- `feat/episode001-v8` — **рабочая ветка**, всё сюда
- `main` — отстаёт от рабочей ветки (PR ещё не слит)
- `research/steven-conrad` — ключевые файлы перенесены ✅
- `docs/add-analysis-documents` — ключевые файлы перенесены ✅
- `docs/add-khupovoi-questions` — ключевые файлы перенесены ✅
- `feature/q2.1-attackers` — слит в main ✅
- `Volodymyr-writer` — устаревшая структура, не нужна

---

*Индекс построен: 2026-04-18*
*Последнее обновление: 2026-04-18*
*Файлов в проекте: 165+ (tracked в git)*
*Ключевых файлов для понимания мира: ~25*
