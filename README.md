ジャンケン格闘ゲーム(仮)
==================

概要
----

コマンド入力式の格闘ゲームです.
かっこいいUIの実装には至ってません…

起動準備
----

## ■Redis起動

+ homebrewなどでRedisをローカル環境にインストールして下さい.
+ 起動

```
$ redis-server
```

## ■本体起動

+ 準備

```
$ bundle install --path vendor/bundle
$ budle exec rake db:migrate
$ bundle exec rake db:seed
```

+ ブラウザからアクセス

```
http://localhost:3000/game/自分のキャラ名/vs/相手キャラ名/
例) http://localhost:3000/game/社畜さん/vs/きのこ先生/
```

## ■プレイヤーの追加

+ `db/seeds.rb`を編集後に`bundle exec rake db:seed`を実行して下さい.

