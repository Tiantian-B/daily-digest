#!/bin/bash
# push-digest.sh — 将日报推送到 GitHub
# 用法：~/daily-digest/push-digest.sh
# 依赖：git credential helper 已配置（首次手动跑过后自动保存）

set -euo pipefail

cd ~/daily-digest

# 拉最新远程变更（避免冲突）
git pull --rebase origin main 2>/dev/null || true

# 检查是否有未提交的文件
if ! git status --porcelain | grep -q .; then
    echo "No changes to push."
    exit 0
fi

NOW=$(date '+%Y-%m-%d')
git add -A
git commit -m "daily digest $NOW"
git push origin main

echo "Pushed: $NOW"
