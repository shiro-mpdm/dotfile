# ===================================
# Zsh Configuration
# ===================================

:<< \COMMENT
------------------------------------------------------------------------------
% man zsh
・Welcome to Zsh    https://www.zsh.org/
・ZSH Documentation https://zsh.sourceforge.io/Doc/
                    https://zsh.sourceforge.io/Doc/Release/zsh_toc.html
------------------------------------------------------------------------------
COMMENT

# [0] Plugins
export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
# └> i.e. zplug "repository", (options) use:file_name, from:file_sorce, as:file_kind
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "mafredri/zsh-async"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
zplug "mrowa44/emojify", as:command

# Install plugins if not installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
if ! zplug load; then
    echo "Failed to load plugins." >&2
fi

# zplug load || echo "Failed to load plugins."

# [1] Basic Settings
export LANG=ja_JP.UTF-8
autoload -Uz colors compinit vcs_info select-word-style edit-command-line
colors
compinit -d "$XDG_CACHE_HOME/zsh/compdump" # Use XDG-compliant cache path
select-word-style default

# Completion settings (補完)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin


# [2] History Management (履歴)
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=10000

HISTORY_IGNORE="(vz|sz|cz|ls|cd|pwd|exit|cd ..|last_command=*|grep -vxF*|sed '$d' $HISTFILE*)"

# コマンドが失敗した場合に履歴を即時更新し、最後のコマンドを削除
precmd() {
    if [[ $? -ne 0 ]]; then
        # Immediately write to $HISTFILE
        fc -W

        # Safely modify the history file
        # ∵ $HISTFILE を直接操作せずに
        #   テンポラリファイルを経由することでエラー時の安全性を確保
        temp_histfile=$(mktemp)
        if sed '$d' "$HISTFILE" > "$temp_histfile"; then
            mv "$temp_histfile" "$HISTFILE"
        else
            echo "Error: Failed to update $HISTFILE" >&2
            rm -f "$temp_histfile"
        fi
    fi
}

# 履歴を選択してコマンドラインに反映
select_history() {
    # Reload history to ensure the latest changes
    fc -R "$HISTFILE"

    # Use `awk` to create unique commands list
    BUFFER=$(awk '!seen[$0]++ { for (i=2; i<=NF; i++) printf "%s ", $i; printf "\n" }' "$HISTFILE" | fzf --query="$BUFFER")

    # Move cursor to the end of the command line
    CURSOR=${#BUFFER}
}
# Assign with: Ctrl + R
zle -N select_history
bindkey '^r' select_history

# --- 履歴検索 ---
# bindkey '^R' history-incremental-pattern-search-backward  # 履歴を逆順検索
bindkey '^P' history-beginning-search-backward            # 履歴開始部分から逆順検索
bindkey '^N' history-beginning-search-forward             # 履歴開始部分から順方向検索

# --- モード切替 ---
bindkey -v  # Viモードを使用する場合は有効化

# --- コマンドライン編集 ---
zle -N edit-command-line
bindkey '^[v' edit-command-line  # 長いコマンドの編集に便利 (esc+v)

# --- 拡張設定 ---
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# └> Ctrl+ R 履歴をﾌｧｼﾞｰ検索実行
# └> Alt + C ｶﾚﾝﾄﾃﾞｨﾚｸﾄﾘ配下を検索移動


# [3] オプション設定
# --- 基本動作 ---
setopt prompt_subst            # PROMPT変数内で変数参照を許可
setopt no_beep                 # 無効な操作時のビープ音を無効化
setopt no_flow_control         # フロー制御（Ctrl+S, Ctrl+Q）を無効化
setopt ignore_eof              # Ctrl+Dでのシェル終了を無効化
setopt interactive_comments    # コマンド行内の「#」以降をコメントと認識

# --- 履歴関連 ---
setopt hist_expire_dups_first  # 重複した履歴を古いものから削除
setopt extended_history        # 実行時間も記録
setopt inc_append_history      # 実行後即座に保存
setopt hist_ignore_dups        # 直前と同じコマンドを履歴に追加しない
# setopt hist_ignore_all_dups   # 重複したコマンドを全て履歴から排除
# └> NOT set this flag in order to keep past successful commands (and can be searched).
setopt hist_ignore_space       # 先頭がスペースのコマンドは履歴に残さない
setopt hist_reduce_blanks      # 履歴保存時に余分なスペースを削除
setopt share_history           # シェル間で履歴を共有
setopt hist_find_no_dups       # 履歴検索時に重複するエントリをスキップ
setopt hist_save_no_dups       # 履歴保存時に重複するエントリをスキップ
setopt hist_no_store           # 特定のコマンド（主にプライベート用途）を履歴に保存しない
setopt no_flow_control

# --- ディレクトリ操作 ---
setopt auto_cd                 # ディレクトリ名だけでcdコマンドとして扱う
setopt auto_pushd              # cd時にディレクトリスタックに自動追加
setopt pushd_ignore_dups       # 重複するディレクトリをスタックに追加しない

# --- 拡張設定 ---
setopt extended_glob           # 拡張グロブ（正規表現のようなパターン）を有効化


# [4] プロンプト
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '%F{green}[%s:%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}[%s:%b|%a]%f'

function precmd() {
    vcs_info
    # if [[ -n "$PIPENV_ACTIVE" ]]; then
    #     VENV_NAME=$(basename "$(pipenv --venv 2>/dev/null)")
    # elif [[ -n "$VIRTUAL_ENV" ]]; then
    #     VENV_NAME=$(basename "$VIRTUAL_ENV")
    # else
    #     VENV_NAME=""
    # fi
    VENV_NAME="${PIPENV_ACTIVE:+[env:$(basename "$(pipenv --venv 2>/dev/null)")]${VIRTUAL_ENV:+[env:$(basename "$VIRTUAL_ENV")]}}"
    PROMPT="
🐻‍❄️ \
%{${fg[blue]}%}@ \
%{${fg[blue]}%}${VENV_NAME}\
%{${fg[cyan]}%}[%~]\
%{${fg[green]}%}${vcs_info_msg_0_}
%{${fg[cyan]}%} └ \
%{${fg[magenta]}%}%#\
%{${reset_color}%} "
}
precmd_functions+=( precmd )


# [5] エイリアス
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias history='history -t "%F %T"'
alias -g j='ja=en'

export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -GF'
alias ll='ls -alGF'
alias lse='eza --icons --git --time-style relative -al'

alias -g L='| less'
alias -g G='| grep'
alias -g W='| wc -l'
alias -g P='| pbcopy'


# [6] 環境設定
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
