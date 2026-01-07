#! /usr/bin/env bash
set -euo pipefail
TAG="q16"
EXPECTED="Hello from context"

cd "$(dirname "$0")"

# 事前チェック：data/message.txt が存在するか
if [ ! -f "data/message.txt" ]; then
  echo "... 不正解です！"
  echo "data/message.txt が見つかりません。"
  echo "hint: data/ ディレクトリの中に message.txt を作成してください。"
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
  exit 1
fi

echo "... 正解です!次の問題に進みましょう！"
