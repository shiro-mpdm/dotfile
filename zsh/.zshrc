# """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# "  @shiroimon                                            ..dkQa,.          "
# "                  `     `   `  `  `  `  `  `  `  ` ` .JHkqkqqqmHMN, `     "
# "   `  `  `  `  `     `     `   `                   ` dqkkkkkqqkqqHMb   `  "
# "                         ` .?""Wp      ` ` `     .qNY"MNHHNNHqqqqmHN      "
# "  `    `   `  `  `  `  ``.%    .M. `..JWMMMN..` dg.."   .TMMMNqqqqmM_   ` "
# "    `                   .F      dl.MWfVVVVfVWMN.MPW'       UMNqqqqqM!     "
# "                `       d}    ` dNVVyVVyVVVVpppMMb.         UNmmqqM^      "
# "       `  `  `     `  ` dm.    .#fVVVyVVVVVWppbbMMe.         ?NNY^        "
# "  `     `  `     `   .,?!    ` J#fVVyVVVVfpppbbpbMMp   `      .Wp     `  `"
# "     `  .?7?7N,` .,!           ,NVVVyVVVfpppbpbpbM%Ub           We        "
# "       J)    ,N.C               WNVVVVVWppppbbpbWF  H|    `      M,       "
# "  `    d]     ,"`          `  `  TNkVVWpppbppbWWMe. .Hx `    `   ,N       "
# "       ,N          `  `  `  (p    .WNkbpbpbbkY!..(Mx .N.         `d]  `   "
# "        Wp   `              `        _T9""=~...``. Tm.Jb `        (b      "
# "    `    ?M,    `   `  ..,jAg,              `..JJzT4MN,N.         ,#    ` "
# "         `J\   `JD` .?Nm#!   M,              ?!    ..?WM_     `  `.F`     "
# "  `     ` M        .@   Hm,..J] `  `   `                          J\      "
# "         .#        .M, .J'  .Y           `                        #       "
# "     `   .N    `     TN-..?!`    `  `      `  `        `    `  ``,^     ` "
# "  `      `M{                          `         `  `            .F        "
# "          d[                  `   `     `  `    `    `  ` `  ` .P         "
# "     `    ,N   `  `   `  `       `   `       `     7T9YTUwAgJJ/!    `  `  "
# "      ` ...dn..             `            `          .........-N           "
# "  ``..XHfffffWMN,  `          `   `   `     `        ..``.``..M-          "
# "  .HffHHVVVVVffWM[   `  `  `    `         `    `   `   ...`..`d] `        "
# " .NVVWNVVyVVVVVVWM.                `   `        `        .....,@    `  `  "
# " ,NffM#fVVVVVVVfpM[      `   `       `     `  `            .`.-N          "
# "  MkpWMNppfpppppbM%  `         `  `     `         `       `..` M.         "
# "  JNpbbppppppppbW#      `  `                `       `   ` ..`..M{  `    ` "
# "   WNbbpbbbpppbpM^            `    `  `  `     `      `    .`.`d]         "
# "   .MMNkWbbWkKY=.   `           `               `  `       ....JF    `    "
# "    N. _??!`.         `  `  `       `  `  `  `             ..`.(F         "
# "   `Jb                        `   `               `  `     ...`(F       ` "
# "    `(Ma.       `  ` .,    `            `  `  `         `  .`..J%  `      "
# "       (Wa..   `  `..7N.       `   `  `         `          .`.`d:         "
# "           _?""""7!   MP    `     `         `     `  `     `..-@    `  `  "
# """""""""""""""""""""""""""""""" cf. https://tool-taro.com/image_to_ascii/ "

: << \COMMENT
------------------------------------------------------------------------------
$ man zsh
・Welcome to Zsh    https://www.zsh.org/
・ZSH Documentation https://zsh.sourceforge.io/Doc/
                    https://zsh.sourceforge.io/Doc/Release/zsh_toc.html --Manuel
------------------------------------------------------------------------------
COMMENT

#################################################
# PLUGIN
#################################################

    if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    fi

    if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
        source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    fi

    if [ -f ~/.zsh/zsh-completions/zsh-completions.zsh ]; then
        source ~/.zsh/zsh-completions/zsh-completions.zsh
    fi

    if [ -f ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
        source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
    fi

    if [ -f ~/.zsh/spaceship-prompt/spaceship-prompt.zsh ]; then
        source ~/.zsh/spaceship-prompt/spaceship-prompt.zsh
    fi

    if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
        . "$HOME/google-cloud-sdk/path.zsh.inc";
    fi

    if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
        . "$HOME/google-cloud-sdk/completion.zsh.inc";
    fi

#################################################
# BASICLY
#################################################

    export LANG=ja_JP.UTF-8

    # 色の使用有効
    autoload -Uz colors
    colors

    # 補完機能有効
    if [ -e /usr/local/share/zsh-completions ]; then
        fpath=(/usr/local/share/zsh-completions $fpath)
    fi

    # 補完入力の有効化
    autoload -Uz compinit
    compinit

    # 補完で小文字でも大文字にマッチさせる
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
    # ../ の後は今いるディレクトリを補完しない
    zstyle ':completion:*' ignore-parents parent pwd ..
    # ps コマンドのプロセス名補完
    zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
    # sudo の後ろでコマンド名を補完する
    zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

    # 履歴
    export HISTFILE=~/.zsh_history
    export HISTSIZE=1000000
    export SAVEHIST=1000000

    # 表記（時間）
    setopt extended_history
    alias history='history -t "%F %T"'

    # キーバインド
    bindkey '^R' history-incremental-pattern-search-backward
    bindkey -v

#################################################
# ALIAS
#################################################

    # common
    alias rm='rm -i'
    alias cp='cp -i'
    alias mv='mv -i'
    alias mkdir='mkdir -p'
    export LSCOLORS=gxfxcxdxbxegedabagacad # cyan
    alias ls='ls -GF'
    alias ll='ls -alGF'
    alias lse='eza --icons --git --time-style relative -al'

    alias -g L='| less'
    alias -g G='| grep'
    alias delete_merged_branches='git branch --merged | egrep -v \"(^\*|main|master|develop|staging)\" | xargs git branch -d' 

#################################################
# SETING OPTION
#################################################

    setopt prompt_subst           # PROMPT変数内で変数参照する
    setopt print_eight_bit        # 日本語ファイル名を表示可能にする
    setopt no_beep                # beep音を無効
    setopt no_flow_control        # フローコントロールを無効にする
    setopt ignore_eof             # ctrl+Dでzshを終了しない
    setopt interactive_comments   # [#] 以降をコメントとして扱う
    setopt auto_cd                # ディレクトリ名だけで$cd する
    setopt auto_pushd             # $cd したら自動的に $pushd する
    setopt pushd_ignore_dups      # $pushd でスタックした場所の重複ディレクトリを追加しない
    setopt share_history          # 同時に起動したzsh間でヒストリを共有
    setopt hist_ignore_dups       # 直前と同じコマンドは履歴に追加しない
    setopt hist_ignore_all_dups   # 同じコマンドをヒストリに残さない
    setopt hist_ignore_space      # スペースから始まるコマンド行はヒストリに残さない
    setopt hist_reduce_blanks     # ヒストリに保存するときに余分なスペースを削除する
    setopt inc_append_history     # 即座に履歴を保存する
    setopt extended_glob          # 高機能なワイルドカード展開を使用する

#################################################
# PATH (環境変数)
#################################################

    # [Git/GitHub]
    # GitHub 複数アカウント運用の場合
    # function gitmain() {
    #     git config --global user.name "[メインのGitHubアカウント名]"
    #     git config --global user.email "[メインのGitHubのメールアドレス]"
    # }
    # function gitsub() {
    #     git config --global user.name "[その他のGitHubアカウント名]"
    #     git config --global user.email "[その他のGitHubのメールアドレス]"
    # }
    export GPG_TTY=$(tty)           # GitHub GPG（署名付コミット）
    eval "$(gh completion -s zsh)"  # GitHub CLI（コマンド補完）

    # [Python]
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    # [Node.js]
    export PATH=$HOME/.nodebrew/current/bin:$PATH

    # [PostgreSQL]
    export PATH=$PATH:/Library/PostgreSQL/14/bin

    # [ChatGPT]
    #  cf. https://namileriblog.com/python/chatgpt-api/
    # export OPENAI_API_KEY="YOUR_API_KEY"

    # [ZshCodex] https://github.com/tom-doerr/zsh_codex
    # # in your/custom/path you need to have a "plugins" folder and in there you clone the repository as zsh_codex
    source "$HOME/.zsh_codex/zsh_codex.plugin.zsh"
    bindkey '^X' create_completion

    # [direnv] https://github.com/direnv/direnv
    #  cf. https://zenn.dev/web_chima/articles/06edf842b0da39
    eval "$(direnv hook zsh)"

    # [bat] https://github.com/sharkdp/bat
    #  cf. https://zenn.dev/ito_shigeru/articles/bf8a8417683683
    export BAT_CONFIG_PATH=".config/bat.conf"


#################################################
# PROMPT
#  cf. https://qiita.com/yamagen0915/items/77fb78d9c73369c784da
#################################################

    autoload -Uz vcs_info
    autoload -Uz select-word-style
    select-word-style default

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' formats '%F{green}[%s:%b]%f'
    zstyle ':vcs_info:*' actionformats '%F{red}[%s:%b|%a]%f'

    function precmd() {
        LANG=en_US.UTF-8 vcs_info

        # 仮想環境名を取得アクティブなら表示
        if [[ -n "$PIPENV_ACTIVE" ]]; then
            # pipenv
            VENV_NAME=$(basename "$(pipenv --venv 2>/dev/null)")
        elif [[ -n "$VIRTUAL_ENV" ]]; then
            # venv / virtualenv
            VENV_NAME=$(basename "$VIRTUAL_ENV")
        else
            VENV_NAME=""
        fi

        if [[ -n "$VENV_NAME" ]]; then
            VENV_PROMPT="[env:${VENV_NAME}]"
        else
            VENV_PROMPT=""
        fi

        PROMPT="
🐻‍❄️ \
%{${fg[blue]}%}@\
%{${fg[blue]}%}${VENV_PROMPT}\
%{${fg[cyan]}%} [%~] \
%{${fg[green]}%}${vcs_info_msg_0_}
%{${fg[cyan]}%} └ \
%{${fg[magenta]}%}%#\
%{${reset_color}%} "
    }

    # autoload -Uz vcs_info
    # zstyle ':vcs_info:git:*' formats '%b'
    precmd_functions+=( precmd )

    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

