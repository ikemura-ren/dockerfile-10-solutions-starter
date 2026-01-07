## Q17: 特定のファイルを除外してみよう

この問題では、ビルドコンテキストから特定ファイルを除外する方法を学びます。

今回は `COPY . /app` を行いますが、`secret.txt` はイメージに入れたくありません。

---

## 要件

- ベースイメージ：Alpine Linux
- `COPY . /app` を行う
- COPY時にsecret.txt` を除外する
- コンテナ実行時の出力結果：OK
- secret.txtを削除してはいけません

---

## 変更するファイル

- 除外をしてくれるファイルを作成してみよう

---

## 正誤チェック方法

```bash
docker build -t q17 .
docker run --rm q17
bash check.sh
