# """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# "  @shiro                                                ..dkQa,.          "
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
# "                                                                          "
# "                                cf. https://tool-taro.com/image_to_ascii/ "
# """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

# vim:set ft=zsh:
: << \COMMENT
------------------------------------------------
$ man zsh 
  Welcome to Zsh
      https://www.zsh.org/
  ZSH Documentation
      https://zsh.sourceforge.io/Doc/

------------------------------------------------
Reference 
  zshを使いこなそう！ - エンベーダー
      https://envader.plus/course/7/scenario/1034
  Mac: ターミナルとプロンプトをカスタマイズする(zsh) - HatenaBLog
      https://ktksq.hatenablog.com/entry/mac-customize
  Macで最低限のzshの設定を行う - Qiita
      https://qiita.com/knao124/items/04e3625eb12237de5743
  【zsh/iTerm2】プロンプトのカスタマイズ【色付けなど】
      https://rapicro.com/customize_zsh_prompt/#google_vignette
  最低限の.zshrc - Hatena Blog
      https://babababand.hatenablog.com/entry/2020/07/06/181946

------------------------------------------------
COMMENT



#------------------------------------------------
# BASICLY ENVIROMENTAL 
#------------------------------------------------

export LANG=ja_JP.UTF-8
# export KCODE=u  # KCODEにUTF-8を設定

# 色の使用有効
autoload -Uz colors
colors

# 補完機能有効
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

# 補完入力の有効化
autoload -U compinit
compinit -u

autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'           # 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' ignore-parents parent pwd ..           # ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*:processes' command 'ps x -o pid,s,args' # ps コマンドのプロセス名補完 
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                              /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

## ヒストリー
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

## 表記（時間）
setopt extended_history
alias history='history -t "%F %T"' 


# キーバインド (割当)
bindkey '^R' history-incremental-pattern-search-backward # [*] ワイルドカード使用出来るようにする
# キーバインドをVi化
bindkey -v
# emacs風 キーバインドにする
# bindkey -e

# cf. https://kojinjigyou.org/20342/
# export LSCOLORS=exfxcxdxbxegedabagacad # Blue
# export LSCOLORS=cxfxcxdxbxegedabagacad # Green
export LSCOLORS=gxfxcxdxbxegedabagacad # Siann 
alias ls='ls -GF'
#alias la='ls -a'
#alias ll='ls -l'
alias lse='eza --icons --git --time-style relative -al' #cf.https://shoalwave.net/develop/2023100406414/



#------------------------------------------------
# PROMPT 
#------------------------------------------------
# cf. 
#   zshプロンプトのカスタマイズ - Qiita
#   https://qiita.com/yamagen0915/items/77fb78d9c73369c784da
#------------------------------------------------

autoload -Uz vcs_info     # vcs_infoをロード
autoload -Uz add-zsh-hook # add-zsh-hookをロード
add-zsh-hook precmd _update_vcs_info_msg
autoload -Uz select-word-style
select-word-style default # 単語の区切り文字指定

setopt prompt_subst    # PROMPT変数内で変数参照する
 
# ここで指定した文字は単語区切りとみなされる [/]も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:*' unstagedstr "*"

# zstyle ':vcs_info:*' formats '(%b%c%u)'
# zstyle ':vcs_info:*' actionformats '(%b(%a)%c%u)'
zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function precmd() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
} 

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}

PROMPT="🐻‍❄️%{${fg[blue]}%}(%S%F{255}%n%s%f%{${fg[blue]}%})%{${reset_color}%}@%{${fg[blue]}%}%m%{${reset_color}%} %c/ %# "



#------------------------------------------------
# OPTION 
#------------------------------------------------

setopt print_eight_bit      # 日本語ファイル名を表示可能にする
setopt no_beep              # beep音を無効にする
setopt no_flow_control      # フローコントロールを無効にする
setopt ignore_eof           # Ctrl+Dでzshを終了しない
setopt interactive_comments # '#' 以降をコメントとして扱う
setopt auto_cd              # ディレクトリ名だけでcdする
setopt auto_pushd           # cd したら自動的にpushdする
                            # 「/{dir1}/{dir2}/{dir3} $pushd cd/」 現在ディレクトリをスタックしてくれる。
setopt pushd_ignore_dups    # 「pushd」でスタックする場所の、重複したディレクトリを追加しない
setopt share_history        # 同時に起動したzshの間でヒストリを共有する
setopt hist_ignore_dups     # 直前と同じコマンドは履歴に追加しない
setopt hist_ignore_all_dups # 同じコマンドをヒストリに残さない
setopt hist_ignore_space    # スペースから始まるコマンド行はヒストリに残さない
setopt hist_reduce_blanks   # ヒストリに保存するときに余分なスペースを削除する
setopt inc_append_history   # 即座に履歴を保存する
setopt extended_glob        # 高機能なワイルドカード展開を使用する 



#------------------------------------------------
# ALIAS COMMON 
#------------------------------------------------

alias -g L='| less'
alias -g G='| grep'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
# alias sudo='sudo ' #sudo の後のコマンドでエイリアスを有効にする

# Cで標準出力をクリップボードにコピー
# cf. 
#   Mac でも Linux でも一発でクリップボードにコピーする zsh の alias　- Hatena Blog
#   http://mollifier.hatenablog.com/entry/20100317/p1
# if which pbcopy >/dev/null 2>&1 ; then
#     # Mac
#     alias -g C='| pbcopy'
# elif which xsel >/dev/null 2>&1 ; then
#     # Linux
#     alias -g C='| xsel --input --clipboard'
# elif which putclip >/dev/null 2>&1 ; then
#     # Cygwin
#     alias -g C='| putclip'
# fi

# Git Command Alias (基本コマンドは、「.gitconfiu」に)
# cf. 
#   Gitブランチの一括削除! 煩雑な作業を一行で解決する方法
#   https://qiita.com/itinerant_programmer/items/dbf7cdba08a5403234ea ) 
alias delete_merged_branches='git branch --merged | egrep -v \"(^\*|main|master|develop)\" | xargs git branch -d'



#------------------------------------------------
# PATH SOFT/MIDLE WEAR 
#------------------------------------------------

# Git
# GitHub 複数アカウント運用の場合
# function gitmain() {
#     git config --global user.name "[メインのGitHubアカウント名]"
#     git config --global user.email "[メインのGitHubのメールアドレス]"
# }
# function gitsub() {
#     git config --global user.name "[その他のGitHubアカウント名]"
#     git config --global user.email "[その他のGitHubのメールアドレス]"
# }
export GPG_TTY=$(tty)          # GitHub GPG（署名付コミット）
eval "$(gh completion -s zsh)" # GitHub CLI（コマンド補完）

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# PostgreSQL
export PATH=$PATH:/Library/PostgreSQL/14/bin

# ChatGPT
# cf.【Python】ChatGPT APIを使ってターミナルで会話する(gpt-3.5-turbo)
#     https://namileriblog.com/python/chatgpt-api/
# cf. APIキーの取得先
#     https://platform.openai.com/account/api-keys
# export OPENAI_API_KEY="{YOUR_API_KEY}"

# direnv
# 開発環境毎に環境変数を管理することができるツール。
# cf. GitHub
#     https://github.com/direnv/direnv
# cf. ディレクトリごとに環境変数を切り替えるシェルの拡張機能direnv - Zenn
#     https://zenn.dev/web_chima/articles/06edf842b0da39
eval "$(direnv hook zsh)"

# bat 
# [cat]コマンドをよりいい感じにしてくれる。
# cf. GitHub
#     https://github.com/sharkdp/bat
# cf. batコマンドのデフォルトハイライトテーマを変更する - Zenn
#     https://zenn.dev/ito_shigeru/articles/bf8a8417683683
export BAT_CONFIG_PATH=".config/bat.conf"



#------------------------------------------------
# PLUGIN
#------------------------------------------------
# cf.
#   高速で設定しやすいZsh/BashプラグインマネージャーSheldonの紹介 - Zenn
#   https://zenn.dev/ganta/articles/e1e0746136ce67
#------------------------------------------------

# source zsh-syntax-highlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; 
	then source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# source zsh-autosuggestions
if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; 
	then source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# source zsh-completions
if [ -f ~/.zsh/zsh-completions/zsh-completions.zsh ]; 
	then source ~/.zsh/zsh-completions/zsh-completions.zsh
fi

# source zsh-history-substring-search
if [ -f ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ]; 
	then source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
fi

# source spaceship-prompt
if [ -f ~/.zsh/spaceship-prompt/spaceship-prompt.zsh ]; 
	then source ~/.zsh/spaceship-prompt/spaceship-prompt.zsh
fi

# Google Cloud SDK 
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cont-t-hirukawa/google-cloud-sdk/path.zsh.inc' ]; 
	then . '/Users/cont-t-hirukawa/google-cloud-sdk/path.zsh.inc'; 
fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/cont-t-hirukawa/google-cloud-sdk/completion.zsh.inc' ]; 
	then . '/Users/cont-t-hirukawa/google-cloud-sdk/completion.zsh.inc'; 
fi


