#! /usr/bin/env bash
set -euo pipefail
TAG="q20"
EXPECTED=$'Hello from file\nHello Docker Advanced'

cd "$(dirname "$0")"

# 事前チェック：ローカル message.txt があるか
if [ ! -f "message.txt" ]; then
  echo "... 不正解です！"
  echo "message.txt が見つかりません。"
  exit 1
fi

echo "== build $TAG =="
docker build -q -t "$TAG" .

echo "== run $TAG =="
OUT="$(docker run --rm "$TAG" || true)"

if [ "$OUT" != "$EXPECTED" ]; then
  echo "... 不正解です！"
  echo "expected:"
  printf '%s\n' "$EXPECTED"
  echo "actual:"
  printf '%s\n' "$OUT"
  exit 1
fi

echo "... 正解です!starter問題お疲れ様でした！"
