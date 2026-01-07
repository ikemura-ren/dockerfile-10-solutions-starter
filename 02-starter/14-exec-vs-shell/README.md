## Q14: exec形式では環境変数は展開されない

この問題では、CMDのexec形式（JSON形式）ではシェルが起動しないため、
`$MSG` のような環境変数が展開されないことを確認します。

---

## 要件

- ベースイメージ：Alpine Linux
- ENVで `MSG=Hello` を設定する
- CMDはexec形式で書く
- 出力結果：$MSG

---

## 変更するファイル

- Dockerfile

---

## 正誤チェック方法

```bash
docker build -t q14 .
docker run --rm q14
bash check.sh
