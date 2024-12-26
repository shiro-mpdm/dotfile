:<< \COMMENT
------------------------------------------------------------------------------
% man zsh
・Welcome to Zsh    https://www.zsh.org/
・ZSH Documentation https://zsh.sourceforge.io/Doc/
                    https://zsh.sourceforge.io/Doc/Release/zsh_toc.html
------------------------------------------------------------------------------
COMMENT

# [0] プラグイン

export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# Load theme file
# i.e. FMT
#      zplug "repository", (options) use:file_name, from:file_sorce, as:file_kind
# zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "mafredri/zsh-async"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
zplug "mrowa44/emojify", as:command

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
if ! zplug load; then
    echo "Failed to load plugins." >&2
fi


# [1] 基本設定
export LANG=ja_JP.UTF-8
autoload -Uz colors compinit vcs_info select-word-style
colors
compinit
select-word-style default

# --- 補完設定
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# --- 履歴設定 ---
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

# エラー終了したコマンドは履歴に追加しない
zshaddhistory() {
    if [[ $? -ne 0 ]]; then
        return 1
    fi
    return 0
}

# --- 打鍵設定 ---
# bindkey '^R' history-incremental-pattern-search-backward
# bindkey '^S' history-incremental-pattern-search-forward
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey -v

# --- 拡張設定 ---
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    # └> Ctrl+ R 履歴をﾌｧｼﾞｰ検索実行
    # └> Alt + C ｶﾚﾝﾄﾃﾞｨﾚｸﾄﾘ配下を検索移動


# [2] オプション設定
# --- 基本動作 ---
setopt prompt_subst           # PROMPT変数内で変数参照を許可
setopt no_beep                # 無効な操作時のビープ音を無効化
setopt no_flow_control        # フロー制御（Ctrl+S, Ctrl+Q）を無効化
setopt ignore_eof             # Ctrl+Dでのシェル終了を無効化
setopt interactive_comments   # コマンド行内の「#」以降をコメントと認識

# --- 履歴関連 ---
setopt extended_history       # 履歴にコマンド実行時間も記録
setopt inc_append_history     # コマンド実行後即座に履歴に保存
setopt hist_ignore_dups       # 直前と同じコマンドを履歴に追加しない
setopt hist_ignore_all_dups   # 重複したコマンドを全て履歴から排除
setopt hist_ignore_space      # 先頭がスペースのコマンドは履歴に残さない
setopt hist_reduce_blanks     # 履歴保存時に余分なスペースを削除
setopt share_history          # シェル間で履歴を共有

# --- ディレクトリ操作 ---
setopt auto_cd                # ディレクトリ名だけでcdコマンドとして扱う
setopt auto_pushd             # cd時にディレクトリスタックに自動追加
setopt pushd_ignore_dups      # 重複するディレクトリをスタックに追加しない

# --- 拡張設定 ---
setopt extended_glob          # 拡張グロブ（正規表現のようなパターン）を有効化


# [3] プロンプト
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '%F{green}[%s:%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}[%s:%b|%a]%f'

function precmd() {
    vcs_info
    if [[ -n "$PIPENV_ACTIVE" ]]; then
        VENV_NAME=$(basename "$(pipenv --venv 2>/dev/null)")
    elif [[ -n "$VIRTUAL_ENV" ]]; then
        VENV_NAME=$(basename "$VIRTUAL_ENV")
    else
        VENV_NAME=""
    fi
    PROMPT="
🐻‍❄️ \
%{${fg[blue]}%}@ \
%{${fg[blue]}%}${VENV_NAME:+[env:$VENV_NAME]}\
%{${fg[cyan]}%}[%~]\
%{${fg[green]}%}${vcs_info_msg_0_}
%{${fg[cyan]}%} └ \
%{${fg[magenta]}%}%#\
%{${reset_color}%} "
}
precmd_functions+=( precmd )


# [4] エイリアス
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias history='history -t "%F %T"'

export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -GF'
alias ll='ls -alGF'
alias lse='eza --icons --git --time-style relative -al'

alias -g L='| less'
alias -g G='| grep'
alias -g W='| wc -l'
alias -g P='| pbcopy'

alias cleanup_git='git branch --merged | egrep -v "(^\*|main|master|develop|staging)" | xargs -p git branch -d'


# [5] 環境設定
# e.g.
#   # Python
#   export PATH="$PYENV_ROOT/bin:$PATH" -> [a]へ
#   export PYENV_ROOT="$HOME/.pyenv"    -> [c]へ
#   eval "$(pyenv init -)"              -> [d]へ

# --- [a] PATHの設定 ---
paths=(
    "/opt/homebrew/bin"             #
    "$PYENV_ROOT/bin"               # Python関連
    "$HOME/.nodebrew/current/bin"   # Node.js関連
    "/Library/PostgreSQL/14/bin"    # PostgreSQL関連
    # "/usr/local/opt/kubectx/bin"  # K8s関連
)
for p in "${paths[@]}"; do
    [[ -d "$p" ]] && PATH="$p:$PATH"
done
export PATH

# --- [b] 環境変数：システム関連 ---
export GPG_TTY=$(tty)                   # Git用GPG署名
export USE_GKE_GCLOUD_AUTH_PLUGIN=True  # K8s用Google認証

# --- [c] 環境変数：アプリケーション関連 ---
export PYENV_ROOT="$HOME/.pyenv"
export BAT_CONFIG_PATH="$HOME/.config/bat.conf"
# export OPENAI_API_KEY="YOUR_API_KEY"

# --- [d] CLI補完スクリプト ---
cli_scripts=(
    "$(gh completion -s zsh)"    # GitHub CLI
    "$(pyenv init -)"            # Pyenv
    "$(direnv hook zsh)"         # Direnv
)
for script in "${cli_scripts[@]}"; do
    [[ -n "$script" ]] && eval "$script"
done

gcloud_scripts=(
    "$HOME/google-cloud-sdk/path.zsh.inc"
    "$HOME/google-cloud-sdk/completion.zsh.inc"
    "$(gcloud info --format="value(config.paths.sdk_root)")/path.zsh.inc"
)
for script in "${gcloud_scripts[@]}"; do
    [[ -f "$script" ]] && source "$script"
done
