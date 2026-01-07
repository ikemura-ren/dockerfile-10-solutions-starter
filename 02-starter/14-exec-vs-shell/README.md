## Q14: exec形式では環境変数は展開されない

この問題では、CMDのexec形式（JSON形式）ではシェルが起動しないため、
`$MSG` のような環境変数が展開されません。`$MSG`を展開できる形でCMDを書きましょう。

---

## 要件

- ベースイメージ：Alpine Linux
- ENVで `MSG=Hello` を設定する
- 出力結果：hello

---

## 変更するファイル

- Dockerfile

---

## 正誤チェック方法

```bash
docker build -t q14 .
docker run --rm q14
bash check.sh
