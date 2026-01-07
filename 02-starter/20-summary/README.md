## Q20: 総合問題（ここまでの内容を全部使う）

この問題は総合問題です。
ここまで学んだ内容をまとめて使い、実務っぽいDockerfileを書けるようにします。

使う要素：
- WORKDIR
- ENV
- COPY
- RUN
- CMD（exec形式）

---

## 要件

- ベースイメージ：Alpine Linux
- WORKDIR を `/app` に設定する
- 環境変数 `MSG` を `Hello Docker Advanced` に設定する
- `message.txt` をコンテナ内にコピーする
- ビルド時に `message.txt` の末尾に `MSG` の値を追記する（上書きではない）
- コンテナ実行時に `message.txt` を表示する
- 出力結果は以下の二行になること：
```
Hello from file
Hello Docker Advanced
```
---

## 変更するファイル

- Dockerfile

---

## 正誤チェック方法

```bash
docker build -t q20 .
docker run --rm q20
bash check.sh
