## Q12: ENTRYPOINTとCMDを組み合わせつつ、引数を渡してみよう

この問題では、ENTRYPOINT と CMD を組み合わせたときの挙動を学びます。

- ENTRYPOINT：実行コマンド本体（固定）
- CMD：ENTRYPOINTに渡す引数（デフォルト値）

---

## 要件

- ベースイメージ：Alpine Linux
- ENTRYPOINTには"echo", "Hello", "from"の三つが固定されている
- CMDには"Q12"という文字列がデフォルトで設定されている
- そのまま実行すると"Hello from Q12"と表示される
- このDockerfileの内容を変更せずに、出力結果を"Hello from Docker!"にする

---

## 変更するファイル

- なし

---

## 正誤チェック方法

```bash
docker build -t q12 .
docker run --name q12-proof q12 "引数"
bash check.sh
