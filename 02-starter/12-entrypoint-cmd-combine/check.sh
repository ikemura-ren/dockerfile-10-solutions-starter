#! /usr/bin/env bash
set -euo pipefail

TAG="q12"
PROOF_CONTAINER="q12-proof"
EXPECTED="Hello from Docker!"

cd "$(dirname "$0")"

EXPECTED_DOCKERFILE_SHA256="dc3fa61bd247a46ad04c374207ba0b940e09a2376146d9f694a9c75c73ff81c1"

calc_sha256() {
  if command -v sha256sum >/dev/null 2>&1; then
    sha256sum Dockerfile | awk '{print $1}'
  else
    shasum -a 256 Dockerfile | awk '{print $1}'
  fi
}

ACTUAL_DOCKERFILE_SHA256="$(calc_sha256)"
if [ "$ACTUAL_DOCKERFILE_SHA256" != "$EXPECTED_DOCKERFILE_SHA256" ]; then
  echo "... 不正解です！"
  echo "Dockerfile が変更されています（この問題では Dockerfile の編集は禁止です）"
  exit 1
fi

echo "== build $TAG =="
docker build -q -t "$TAG" .

echo "== check proof container exists =="
if ! docker inspect "$PROOF_CONTAINER" >/dev/null 2>&1; then
  echo "... 不正解です！"
  echo "先に次を実行してください:"
  echo "docker run --name $PROOF_CONTAINER $TAG Docker!"
  exit 1
fi

echo "== check output =="
OUT="$(docker logs "$PROOF_CONTAINER" 2>/dev/null | tail -n 1 || true)"

if [ "$OUT" != "$EXPECTED" ]; then
  echo "... 不正解です！"
  echo "expected: [$EXPECTED]"
  echo "actual  : [$OUT]"
  echo
  echo "ヒント:"
  echo "- docker run の引数に Docker! を渡してください"
  echo "- 例: docker run --name $PROOF_CONTAINER $TAG Docker!"
  exit 1
fi

echo "== cleanup proof container =="
docker rm -f "$PROOF_CONTAINER" >/dev/null 2>&1 || true

echo "... 正解です!次の問題に進みましょう！"
