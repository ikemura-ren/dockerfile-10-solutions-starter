## Q19: 復習問題

この問題では、今まで書いてきたDockerfileの復習問題になります。

---

## この問題で学ぶこと

- RUN は「イメージを作るとき」に実行される
- RUN で作成したファイルは、イメージの中に保存される
- CMD は「コンテナを起動したとき」に実行される

---

## 要件

- ベースイメージ：Alpine Linux
- WORKDIR を `/app` に設定する
- RUN で `message.txt` を作成し、中身を `Hello from build` にする
- コンテナ実行時に `message.txt` の中身を表示する
- 出力結果：Hello from build

---

## 変更するファイル

- Dockerfile

---

## 正誤チェック方法

```bash
docker build -t q19 .
docker run --rm q19
bash check.sh
