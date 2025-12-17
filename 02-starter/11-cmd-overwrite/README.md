## Q11: CMDは1つだけ有効

この問題では、DockerfileにCMDを複数書いたときの挙動を確認します。

今回はDockerfileにすでに内容が書かれています。
上手く修正して、コンテナ起動時にsecondと表示させてください。

---

## 要件

- ベースイメージ：Alpine Linux
- CMDの行を減らさずに、実行結果を以下の出力結果にしてみよう
- 実行時の出力結果：second
- build時にWarningが出ますが、今回はお気になさらず実行してください

---

## 変更するファイル

- Dockerfile

---

## 正誤チェック方法

```bash
docker build -t q11 .
docker run --rm q11
bash check.sh
