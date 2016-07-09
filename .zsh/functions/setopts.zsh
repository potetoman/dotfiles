# PCRE 互換の正規表現を使う
setopt re_match_pcre

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# 補完候補を一覧で表示する(d)
setopt auto_list

# 補完キー連打で補完候補を順に表示する(d)
setopt auto_menu

# 入力しているコマンド名が間違っている場合にもしかして：を出す。
setopt correct

## ^Dでログアウトしない。
setopt ignoreeof

## バックグラウンドジョブが終了したらすぐに知らせる。
setopt no_tify

