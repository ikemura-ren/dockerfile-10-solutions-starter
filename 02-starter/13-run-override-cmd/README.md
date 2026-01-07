## Q13: docker run でCMD相当の値を上書きしてみよう

この問題では、コンテナ実行時に引数を渡すことで、
CMD（デフォルト引数）を上書きできることを体験します。

ENTRYPOINTが echo の場合、`docker run` で渡した値は echo の引数になります。

---

## 要件

- ベースイメージ：Alpine Linux
- ENTRYPOINTで echo を固定する
- 実行時に `Override` が出力されること

---

## 変更するファイル

- Dockerfile

---

## 正誤チェック方法

```bash
docker build -t q13 .
docker run --rm q13 〇〇
bash check.sh
