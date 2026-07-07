#!/bin/bash
# push-digest.sh — 将日报推送到 GitHub
# 用法：~/daily-digest/push-digest.sh
# 前提：需要 GitHub token 或 SSH key 已配置

set -euo pipefail

cd ~/daily-digest

# 检查是否有未提交的文件
if ! git status --porcelain | grep -q .; then
    echo "No changes to push."
    exit 0
fi

git add -A
git commit -m "daily digest $(date +%Y-%m-%d)"
git push origin main

echo "Pushed to GitHub: $(date +%Y-%m-%d)"
