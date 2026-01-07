#! /usr/bin/env bash
set -euo pipefail
TAG="q17"
EXPECTED="OK"

cd "$(dirname "$0")"

# === ① ローカルに secret.txt が存在するかチェック ===
if [ ! -f "secret.txt" ]; then
  echo "... 不正解です！"
  echo "secret.txt が見つかりません。"
  echo "hint: secret.txt は削除せず、特定のファイルで除外してください。"
  exit 1
fi

echo "== build $TAG =="
docker build -q -t "$TAG" .

echo "== run $TAG =="
OUT="$(docker run --rm "$TAG" || true)"

if [ "$OUT" != "$EXPECTED" ]; then
  echo "... 不正解です！"
  echo "expected: [$EXPECTED]"
  echo "actual  : [$OUT]"
  echo "hint    : 特定のファイルにsecret.txt を書いて除外してください"
  exit 1
fi

echo "... 正解です!次の問題に進みましょう！"
