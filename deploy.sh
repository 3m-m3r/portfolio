#!/bin/bash

# وقف التنفيذ عند أي خطأ
set -e

# طباعة العملية الجارية
echo "📂 Switching to project directory..."
cd "$(dirname "$0")"

# التحقق من وجود تغييرات
if [[ -n $(git status --porcelain) ]]; then
    echo "🚀 Committing changes..."
    git add .
    git commit -m "Auto-deploy: $(date)"
    git push origin main
else
    echo "✅ No changes to commit."
fi

# نشر التحديثات على Vercel
echo "🌍 Deploying to Vercel..."
vercel --prod

echo "✅ Deployment complete!"
