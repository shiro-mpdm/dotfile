## Why

## What
### how2use
1. `$ brew update && brew install direnv`
1. `$ echo eval "$(direnv hook zsh)" > .zshrc`
1. `$ cd target_dir`
1. `$ echo export FOO=foo > .envrc`
    - 確認
        ```sh
        $ echo $FO0
        foo
        ```

## Ref.
- [ディレクトリごとに環境変数を切り替えるシェルの拡張機能direnv](https://zenn.dev/web_chima/articles/06edf842b0da39) Zenn

