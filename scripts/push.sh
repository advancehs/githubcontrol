#!/usr/bin/env bash
# ============================================================
# push.sh — 一键提交并推送（场景1：提交/推送自动化）
# ============================================================
# 用法:
#   bash scripts/push.sh "你的 commit message"
#   bash scripts/push.sh                 # 不带参数 → 用时间戳作 message
#
# 行为:
#   1. 自动切到 git 仓库根目录
#   2. 若无变更则直接退出，不产生空提交
#   3. 显示待提交的文件清单（便于自查敏感内容）
#   4. git add -A → commit → push origin HEAD
#
# 安全:
#   - 依赖仓库根的 .gitignore 排除 .env / *token* / *.key 等凭证
#   - 提交前请肉眼检查 "待提交的变更" 列表
# ============================================================
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

if [ -z "$(git status --porcelain)" ]; then
  echo "ℹ️  没有变更，无需提交。"
  exit 0
fi

MSG="${1:-chore: auto-sync $(date +%Y-%m-%dT%H:%M:%S%z)}"

echo "=== 待提交的变更（提交前请确认无敏感内容）==="
git status --short
echo ""

git add -A
git commit -m "$MSG"
git push origin HEAD

echo ""
echo "✅ 已推送: $MSG"
