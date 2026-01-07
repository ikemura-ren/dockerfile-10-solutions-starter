## Q15: WORKDIRなしで書いてみよう

この問題では、WORKDIRを使わない場合に、
ファイル操作をすべて絶対パスで書く必要があることを体験します。

---

## 要件

- ベースイメージ：Alpine Linux
- `/app/message.txt` を作成し、中身を `Hello` にする
- コンテナ実行時に `/app/message.txt` を表示する
- 出力結果：Hello

---

## 変更するファイル

- Dockerfile

---

## 正誤チェック方法

```bash
docker build -t q15 .
docker run --rm q15
bash check.sh
