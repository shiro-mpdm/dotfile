# License : MIT
# cf. http://mollifier.mit-license.org/

# Reference
# cf. https://ktksq.hatenablog.com/entry/mac-customize#BeforeAfter
# cf. https://rapicro.com/customize_zsh_prompt/#google_vignette



########################################
# 環境変数
export LANG=ja_JP.UTF-8
 
# 色を使用出来るようにする
autoload -Uz colors
colors
 
# emacs 風キーバインドにする
bindkey -e
 
# ヒストリの設定
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt extended_history
alias history='history -t "%F %T"'

# プロンプト（コンソール表示）
# 1行表示
# PROMPT="%~ %# "
PROMPT="%{${fg[blue]}%}🐻‍❄️(%n)@%m%{${reset_color}%} %c/ %# " #EDIT

# 複数行表示
# PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
# %# " 

# 出力の後に改行を入れる
function add_line {
  if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}
PROMPT_COMMAND='add_line'
 
# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified



########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac



########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit
 
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
 
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
 
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'



########################################
# オプション
setopt print_eight_bit      #日本語ファイル名を表示可能にする
setopt no_beep              #beep音を無効にする
setopt no_flow_control      #フローコントロールを無効にする
setopt ignore_eof           #Ctrl+Dでzshを終了しない
setopt interactive_comments #'#' 以降をコメントとして扱う
setopt auto_cd              #ディレクトリ名だけでcdする
setopt auto_pushd           #cd したら自動的にpushdする
                            #「/{dir1}/{dir2}/{dir3} $pushd cd/」 現在ディレクトリをスタックしてくれる。
setopt pushd_ignore_dups    #「pushd」でスタックする場所の、重複したディレクトリを追加しない
setopt share_history        #同時に起動したzshの間でヒストリを共有する
# setopt hist_ignore_dups     #直前と同じコマンドは履歴に追加しない
setopt hist_ignore_all_dups #同じコマンドをヒストリに残さない
setopt hist_ignore_space    #スペースから始まるコマンド行はヒストリに残さない
setopt hist_reduce_blanks   #ヒストリに保存するときに余分なスペースを削除する
setopt inc_append_history   #即座に履歴を保存する
setopt extended_glob        #高機能なワイルドカード展開を使用する 



########################################
# キーバインド
# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward
 


########################################
# エイリアス
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias sudo='sudo ' #sudo の後のコマンドでエイリアスを有効にする
 
# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'
 
# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi



########################################
# VCS 
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
 
zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'
 
function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

# GitHub 複数アカウント運用の場合
# function gitmain() {
#     git config --global user.name "[メインのGitHubアカウント名]"
#     git config --global user.email "[メインのGitHubのメールアドレス]"
# }
# function gitsub() {
#     git config --global user.name "[メインのGitHubアカウント名]"
#     git config --global user.email "[メインのGitHubのメールアドレス]"
# }

# GitHub GPG （署名付コミット）
export GPG_TTY=$(tty)



########################################
# Programming - softwear
# Python関連
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# PostgreSQLパス
# export PATH=$PATH:/Library/PostgreSQL/12/bin



########################################
# ZSH プラグイン
#=============================
# source zsh-syntax-highlighting
#=============================
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; 
	then source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

#=============================
# source zsh-autosuggestions
#=============================
if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; 
	then source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

#=============================
# source zsh-completions
#=============================
if [ -f ~/.zsh/zsh-completions/zsh-completions.zsh ]; 
	then source ~/.zsh/zsh-completions/zsh-completions.zsh
fi

#=============================
# source zsh-history-substring-search
#=============================
if [ -f ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ]; 
	then source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
fi

#=============================
# source spaceship-prompt
#=============================
if [ -f ~/.zsh/spaceship-prompt/spaceship-prompt.zsh ]; 
	then source ~/.zsh/spaceship-prompt/spaceship-prompt.zsh
fi

#=============================
# Google Cloud SDK 
#=============================
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/{アカウント名}/google-cloud-sdk/path.zsh.inc' ]; 
	then . '/Users/{アカウント名}/google-cloud-sdk/path.zsh.inc'; 
fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/{アカウント名}/google-cloud-sdk/completion.zsh.inc' ]; 
	then . '/Users/{アカウント名}/google-cloud-sdk/completion.zsh.inc'; 
fi


# vim:set ft=zsh:
