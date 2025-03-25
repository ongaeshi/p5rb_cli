# p5.rb CLI

p5.rb CLIは、Rubyを使ってp5.jsのようなクリエイティブコーディングを手軽に始められるコマンドラインツールです。インタラクティブなアニメーションやビジュアルアートを、Rubyのシンプルな文法で作成できます。

## インストール

```bash
gem install p5rb_cli
```

## 使い方

インストール後、以下のコマンドが使用できます：

### 新しいスケッチの作成

```bash
p5rb new <NAME>
```

このコマンドは指定したディレクトリに新しいp5.rbスケッチを生成します。生成されるスケッチには、基本的なセットアップとサンプルコードが含まれています。

### スケッチの実行

```bash
p5rb run <SCRIPT_FILE>
```

このコマンドは指定したスケッチをローカルサーバーで実行し、ブラウザで表示します。変更を加えると自動的にブラウザが更新されます。

### その他のコマンド

詳細な使い方を確認するには：

```bash
p5rb help
```

## サンプルコード

```ruby
def setup
  createCanvas(400, 400)
  background(220)
end

def draw
  fill(255, 0, 0)
  circle(mouseX, mouseY, 50)
end
```

## 開発に参加する

バグ報告やプルリクエストは大歓迎です。GitHubの[p5rb_cliリポジトリ](https://github.com/ongaeshi/p5rb_cli)でお願いします。

## ライセンス

このプロジェクトは[MITライセンス](https://opensource.org/licenses/MIT)の下でオープンソースとして公開されています。
