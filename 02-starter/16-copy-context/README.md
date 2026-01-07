## Q16: COPYできるのはビルドコンテキスト内だけ

この問題では、COPYの「左側」が参照できる範囲は
`docker build .` の `.`（ビルドコンテキスト）配下だけであることを確認します。

今回は、同じディレクトリのファイルではなく、**サブディレクトリ `data/` を丸ごとCOPY**します。

---

## ディレクトリ構成

次のような構成を想定しています。

```
16-copy-context/
├── Dockerfile
├── check.sh
├── README.md
└── data/
  └── message.txt
```

---

## 要件

- ベースイメージ：Alpine Linux
- `data/` ディレクトリをコンテナ内 `/data/` にCOPYする
- コンテナ実行時に `/data/message.txt` の中身を表示する（message.txtは初期段階ではありません）
- 出力結果：Hello from context

---

## 変更するファイル

- Dockerfile
- message.txt

---

## 正誤チェック方法

```bash
docker build -t q16 .
docker run --rm q16
bash check.sh
