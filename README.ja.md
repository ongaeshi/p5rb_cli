# p5.rb CLI

p5.rb CLI は、Ruby を使用して p5.js のようなスケッチを作成するためのコマンドラインツールです。

## インストール

```bash
gem install p5rb_cli
```

## 使用方法

gem をインストールした後、以下のコマンドを使用できます:

- **新しい p5.rb スケッチを作成**:
    ```bash
    p5rb new <sketch_name>
    ```
    指定したディレクトリに新しい p5.rb スケッチを生成します。

- **p5.rb スケッチを実行**:
    ```bash
    p5rb run <sketch_name>
    ```
    指定したスケッチを実行します。

詳細な使用方法については、以下を実行してください:
```bash
p5rb help
```

## コントリビュート

バグ報告やプルリクエストは、[p5rb_cli リポジトリ](https://github.com/ongaeshi/p5rb_cli) で歓迎します。

## ライセンス

このプロジェクトは [MIT ライセンス](https://opensource.org/licenses/MIT) の条件の下でオープンソースとして利用可能です。
