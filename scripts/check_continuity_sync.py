#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
check_continuity_sync.py — детектор рассинхрона континуити.

Принцип Крола: проза (суждение) — у автора и модели; учёт (синхрон реестра
посадок с текстами эпизодов) — у кода. Скрипт НЕ читает смысл и НЕ правит текст.
Он отвечает на один вопрос: не уехал ли seeded_artifacts.md от реальных эпизодов.

Запуск:
    python3 scripts/check_continuity_sync.py

Выход:
    OK   — реестр синхронен с текущими версиями эпизодов.
    WARN — реестр отстал; печатает, что именно пересмотреть, и завершается с кодом 1
           (чтобы это можно было повесить как гейт перед /pr или коммитом).
"""

import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
REGISTRY = ROOT / "3_stories" / "santa_cruz_incident" / "seeded_artifacts.md"
DRAFTS = ROOT / "drafts"

EP_FILE_RE = re.compile(r"episode0*(\d+)-v(\d+(?:\.\d+)*)\.md$", re.IGNORECASE)
# "Источник: ep001 v8.1 + ep002 v8 + ep003 v2"
SRC_RE = re.compile(r"ep0*(\d+)\s*v(\d+(?:\.\d+)*)", re.IGNORECASE)


def vtuple(v: str):
    return tuple(int(x) for x in v.split("."))


def git_last_date(path: Path):
    try:
        out = subprocess.run(
            ["git", "log", "-1", "--format=%ci", "--", str(path)],
            cwd=ROOT, capture_output=True, text=True, check=True,
        ).stdout.strip()
        return out or None
    except Exception:
        return None


def is_dirty(path: Path):
    """Есть ли несохранённые (незакоммиченные) изменения файла."""
    try:
        out = subprocess.run(
            ["git", "status", "--porcelain", "--", str(path)],
            cwd=ROOT, capture_output=True, text=True, check=True,
        ).stdout.strip()
        return bool(out)
    except Exception:
        return False


def effective_date(path: Path):
    """Дата последнего реального изменения: если файл правлен, но не закоммичен —
    его mtime (правка «сейчас»); иначе — дата последнего git-коммита."""
    if is_dirty(path):
        from datetime import datetime
        return datetime.fromtimestamp(path.stat().st_mtime).strftime(
            "%Y-%m-%d %H:%M:%S +0000")
    return git_last_date(path)


def current_episode_versions():
    """Для каждого номера эпизода — самый свежий файл-версия в drafts/."""
    latest = {}  # ep_num -> (vtuple, version_str, Path)
    for f in DRAFTS.rglob("episode*-v*.md"):
        m = EP_FILE_RE.search(f.name)
        if not m:
            continue
        ep = int(m.group(1))
        ver = m.group(2)
        vt = vtuple(ver)
        if ep not in latest or vt > latest[ep][0]:
            latest[ep] = (vt, ver, f)
    return latest


def declared_versions(text: str):
    """Версии эпизодов, заявленные в шапке реестра."""
    head = text[:600]  # источник всегда в первых строках
    return {int(ep): ver for ep, ver in SRC_RE.findall(head)}


def main():
    if not REGISTRY.exists():
        print(f"FAIL: не найден реестр {REGISTRY}")
        return 2

    text = REGISTRY.read_text(encoding="utf-8")
    declared = declared_versions(text)
    actual = current_episode_versions()
    reg_date = effective_date(REGISTRY)

    problems = []

    # 1. Версия эпизода в реестре старше, чем самый свежий файл эпизода.
    for ep, (vt, ver, path) in sorted(actual.items()):
        dv = declared.get(ep)
        if dv is None:
            problems.append(
                f"ep{ep:03d}: эпизод есть ({path.name}), но в шапке реестра не указан."
            )
        elif vtuple(dv) < vt:
            problems.append(
                f"ep{ep:03d}: реестр ссылается на v{dv}, а текущая версия — v{ver} "
                f"({path.name}). Реестр отстал на этом эпизоде."
            )

    # 2. Эпизод был изменён в git позже, чем реестр.
    if reg_date:
        for ep, (vt, ver, path) in sorted(actual.items()):
            ep_date = effective_date(path)
            if ep_date and ep_date > reg_date:
                problems.append(
                    f"ep{ep:03d}: правился {ep_date[:10]} — позже реестра "
                    f"({reg_date[:10]}). Проверь, не задеты ли посаженные детали."
                )

    print("=" * 60)
    print("ДЕТЕКТОР РАССИНХРОНА КОНТИНУИТИ")
    print("=" * 60)
    print(f"Реестр:  {REGISTRY.relative_to(ROOT)}")
    print(f"         последнее изменение в git: {reg_date or 'неизвестно'}")
    print(f"Заявлено в реестре: " + ", ".join(
        f"ep{e:03d} v{v}" for e, v in sorted(declared.items())) or "—")
    print(f"Фактически в drafts: " + ", ".join(
        f"ep{e:03d} v{a[1]}" for e, a in sorted(actual.items())) or "—")
    print("-" * 60)

    if not problems:
        print("OK: реестр посадок синхронен с текущими эпизодами.")
        return 0

    print("WARN: реестр отстал от текстов. Пересмотри перед письмом/PR:\n")
    for p in problems:
        print(f"  • {p}")
    print("\nЧто сделать: пройти по seeded_artifacts.md и привести его в")
    print("соответствие с текущими версиями эпизодов, затем обновить строку")
    print("«Источник: ...» в шапке. После этого скрипт даст OK.")
    return 1


if __name__ == "__main__":
    sys.exit(main())
