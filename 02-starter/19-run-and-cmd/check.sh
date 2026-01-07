#! /usr/bin/env bash
set -euo pipefail
TAG="q19"
EXPECTED="Hello from build"

cd "$(dirname "$0")"

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
