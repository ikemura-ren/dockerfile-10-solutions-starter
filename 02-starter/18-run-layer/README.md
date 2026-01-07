## Q18: RUNをまとめてみよう

この問題では、RUNをコマンド連結でまとめて書く練習をします。

RUNを複数回書いても動きますが、実務では可読性やレイヤーの観点で
まとめることがよくあります。

---

## 要件

- ベースイメージ：Alpine Linux
- WORKDIR /app を設定する
- RUNを1つにまとめて2つのファイルを作成する
  - a.txt の中身：Hello
  - b.txt の中身：Docker
- コンテナ実行時に a.txt を表示する
- 出力結果：Hello

---

## 変更するファイル

- Dockerfile

---

## 正誤チェック方法

```bash
docker build -t q18 .
docker run --rm q18
bash check.sh
