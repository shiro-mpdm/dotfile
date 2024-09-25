""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  @shiroimon                                            ..dkQa,.          "
"                  `     `   `  `  `  `  `  `  `  ` ` .JHkqkqqqmHMN, `     "
"   `  `  `  `  `     `     `   `                   ` dqkkkkkqqkqqHMb   `  "
"                         ` .?""Wp      ` ` `     .qNY"MNHHNNHqqqqmHN      "
"  `    `   `  `  `  `  ``.%    .M. `..JWMMMN..` dg.."   .TMMMNqqqqmM_   ` "
"    `                   .F      dl.MWfVVVVfVWMN.MPW'       UMNqqqqqM!     "
"                `       d}    ` dNVVyVVyVVVVpppMMb.         UNmmqqM^      "
"       `  `  `     `  ` dm.    .#fVVVyVVVVVWppbbMMe.         ?NNY^        "
"  `     `  `     `   .,?!    ` J#fVVyVVVVfpppbbpbMMp   `      .Wp     `  `"
"     `  .?7?7N,` .,!           ,NVVVyVVVfpppbpbpbM%Ub           We        "
"       J)    ,N.C               WNVVVVVWppppbbpbWF  H|    `      M,       "
"  `    d]     ,"`          `  `  TNkVVWpppbppbWWMe. .Hx `    `   ,N       "
"       ,N          `  `  `  (p    .WNkbpbpbbkY!..(Mx .N.         `d]  `   "
"        Wp   `              `        _T9""=~...``. Tm.Jb `        (b      "
"    `    ?M,    `   `  ..,jAg,              `..JJzT4MN,N.         ,#    ` "
"         `J\   `JD` .?Nm#!   M,              ?!    ..?WM_     `  `.F`     "
"  `     ` M        .@   Hm,..J] `  `   `                          J\      "
"         .#        .M, .J'  .Y           `                        #       "
"     `   .N    `     TN-..?!`    `  `      `  `        `    `  ``,^     ` "
"  `      `M{                          `         `  `            .F        "
"          d[                  `   `     `  `    `    `  ` `  ` .P         "
"     `    ,N   `  `   `  `       `   `       `     7T9YTUwAgJJ/!    `  `  "
"      ` ...dn..             `            `          .........-N           "
"  ``..XHfffffWMN,  `          `   `   `     `        ..``.``..M-          "
"  .HffHHVVVVVffWM[   `  `  `    `         `    `   `   ...`..`d] `        "
" .NVVWNVVyVVVVVVWM.                `   `        `        .....,@    `  `  "
" ,NffM#fVVVVVVVfpM[      `   `       `     `  `            .`.-N          "
"  MkpWMNppfpppppbM%  `         `  `     `         `       `..` M.         "
"  JNpbbppppppppbW#      `  `                `       `   ` ..`..M{  `    ` "
"   WNbbpbbbpppbpM^            `    `  `  `     `      `    .`.`d]         "
"   .MMNkWbbWkKY=.   `           `               `  `       ....JF    `    "
"    N. _??!`.         `  `  `       `  `  `  `             ..`.(F         "
"   `Jb                        `   `               `  `     ...`(F       ` "
"    `(Ma.       `  ` .,    `            `  `  `         `  .`..J%  `      "
"       (Wa..   `  `..7N.       `   `  `         `          .`.`d:         "
"           _?""""7!   MP    `     `         `     `  `     `..-@    `  `  "
"""""""""""""""""""""""""""""""" cf. https://tool-taro.com/image_to_ascii/ "

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Install 'vim-plug' if not installed.
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

    " Auto Install missing plugins.
    autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) | PlugInstall --sync | source $MYVIMRC

    call plug#begin('~/.vim/plugged')

        " Essential Plugins
        Plug 'preservim/nerdtree'      " File Tree
        Plug 'ryanoasis/vim-devicons'  " Icons for NERDTree

        " FZF for searching
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'

        " Git integration
        Plug 'airblade/vim-gitgutter'       " Show git changes
        Plug 'tpope/vim-fugitive'           " Execute Git command in Vim
        Plug 'Xuyuanp/nerdtree-git-plugin'  " Viewing Git status in NerdTree

        " LSP and Autocomplete
        Plug 'prabirshrestha/vim-lsp'
        Plug 'mattn/vim-lsp-settings'
        Plug 'prabirshrestha/asyncomplete.vim'
        Plug 'prabirshrestha/asyncomplete-lsp.vim'

        " Linter
        Plug 'dense-analysis/ale'
        Plug 'hashivim/vim-terraform'  " Terraform Syntaxhighlight
        Plug 'jjo/vim-cue'             " CUE Syntaxhighlight

        " UI Enhancements
        Plug 'Yggdroot/indentLine'            " Show indent lines
        Plug 'tyru/caw.vim'                   " Comment toggle
        Plug 'mg981/vim-visual-multi'         " Multi-cursor
        Plug 'osyo-manga/vim-brightest'       " Highlight cursor line
        Plug 'yuttie/comfortable-motion.vim'  " Smooth scrolling

        " Status Bar
        Plug 'bling/vim-airline'
        Plug 'vim-airline/vim-airline-themes'

        " Screen operation
        " Plug 'simeji/winresizer'    " Easy resizing windows
        " Plug '/t9md/vim-textmanip'  " Move/Duplicate text intuitively

    call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Encoding settings / cf. https://zenn.dev/aikige/articles/how-vim-recognizes-encoding
    set encoding=utf-8
    set fileencoding=&encoding
    set fileencodings=utf-8,ucs-bom,iso-2022-jp,cp932,euc-jp,default,latin
    set ambiwidth=single
    set langmenu=none
    set fileformats=unix,dos,mac
    " set linespace=4
    " set guifont=Cica:h14
    " set guifont=HackGen\ Console:h12
    set guifont=Fira\ Code\ Nerd\ Font:h12

    " Indentation settings
    set expandtab                    " Use spaces instead of tabs
    set shiftwidth=4                 " Number of spaces to use for indentation
    set softtabstop=4                " Number of spaces for Tab key
    set autoindent smartindent       " Auto-indent new lines
    set list listchars=tab:¦\ ,eol:↲,trail:_,extends:»,precedes:«,nbsp:%

    " Search settings
    set incsearch                    " Incsearch option in the command mode [:]
    set ignorecase                   " Ignore case when searching
    set smartcase                    " Search insensitively in lowercase
    set wrapscan                     " When the end, go back to the beginning
    set hlsearch                     " Highlight search results
    set noic                         " Disable case-insensitive search

    " UI/UX settings
    set number                       " 行番号表示
    set cursorline                   " カーソールライン表示
    " set title                        " 編集中ファイル名表示
    set belloff=all                  " ベル音停止
    set vb t_vb=                     " beepもビジュアルベルも無効
    set nowrap                       " 行の折り返しなし
    " set termwinsize=14x0             " ターミナルのサイズを指定
    set updatetime=250               " 反映時間短縮(デフォルト4,000ms)
    set virtualedit=onemore          " 行末の一文字後ろに、カーソルを移動できる
    set autoread                     " 
    set backspace=indent,eol,start   " backspaceでdeleteする
    set clipboard+=unnamed           " yank をクリップボードに貼付け
    set history=5000                 " 履歴保存数
    set nobackup                     " バックアップファイルを作らない
    set noswapfile                   " スワップファイルを作らない
    set showmatch                    " 対応する括弧を表示
    set wildmenu                     " 補完： tabでファイル名補完を有効
    set ttimeoutlen=50               " モード変更遅延解消
    set mouse=a                      " マウススクロール（トラックパッド使用可）
    set whichwrap=b,s,h,l,<,>,[,],~  " 行頭行末で、前後の行へのカーソル移動を可能にする
    set autochdir                    " 

    " Status-line settings
    " [0] hiden
    " [1] Only if there are multiple windows
    " [2] Always visible
    set laststatus=2
    set statusline=%F%m%r%h%w\ [%{&fileencoding}]\ [row=%l/%L]

""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Color and UI Customization
""""""""""""""""""""""""""""""""""""""""""""""""""""

    syntax enable
    colorscheme iceberg

    " Customize colors
    let g:iceberg_overrides = {
        \ 'Todo': { 'guifg': '303030', 'guibg': 'f0f000', 'ctermfg': 'Black', 'ctermbg': 'Yellow', 'attr': 'bold' },
        \  'Comment': { 'guifg': 'ccc' },
    \}

    " Highlight trailing spaces
    augroup HighlightTrailingSpaces
        autocmd!
        autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
        autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
    augroup END

    " Cursor line color
    highlight CursorLine ctermbg=238 guibg=#3c3836

    " Transparent background
    highlight Normal ctermbg=none
    highlight NonText ctermbg=none
    highlight LineNr ctermbg=none
    highlight Folded ctermbg=none
    highlight EndOfBuffer ctermbg=none

""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Tree Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Toggle NERDTree with ctrl+e
    nnoremap <silent><C-e> :NERDTreeToggle<CR>

    " Show hidden files in NERDTree with shift+f
    let NERDTreeShowHidden = 1

    " NerdTree を起動時に自動的に開く設定
    autocmd vimenter * NERDTree

    " NERDTree のウィンドウサイズ
    let g:NERDTreeWinSize=30

    " Git 状態をアイコンで表示（オプション）
    let g:NERDTreeGitStatusUseNerdFonts = 1
        " Modified  : ファイルが変更された場合の表示
        " Staged    : ファイルがステージに追加された場合の表示
        " Untracked : 未追跡ファイルの表示
        " Renamed   : ファイルがリネームされた場合の表示
        " Unmerged  : マージ競合が発生した場合の表示
        " Deleted   : 削除されたファイルの表示
        " Dirty     : 変更が加えられたファイルの表示
        " Ignored   : 無視されているファイルの表示
        " Clean     : クリーンなファイルの表示
        " Unknown   : 不明な状態のファイルの表示
    let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'+',
                \ 'Untracked' :'U',
                \ 'Renamed'   :'R',
                \ 'Unmerged'  :'!',
                \ 'Deleted'   :'X',
                \ 'Dirty'     :'#',
                \ 'Ignored'   :'_',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

    " ファイルが指定されていない場合にのみ NERDTree を開く
    " autocmd VimEnter * if argc() == 0 | NERDTree | endif

    " Vim起動時にNERDTreeが開かれない場合に備えて、NERDTreeの自動起動をスクリプトで管理
    " function! StartUpNERDTree()
    "     " ファイルが指定されていない場合のみNERDTreeを開く
    "     if argc() == 0
    "         NERDTree
    "         wincmd p
    "     endif
    " endfunction
    " autocmd VimEnter * call StartUpNERDTree()

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""

    " GitGutter navigation
    nnoremap g[ :GitGutterPrevHunk<CR>
    nnoremap g] :GitGutterNextHunk<CR>
    nnoremap gh :GitGutterLineHighlightsToggle<CR>
    nnoremap gp :GitGutterPreviewHunk<CR>

    " Change gitgutter symbol colors
    highlight GitGutterAdd ctermfg=green
    highlight GitGutterChange ctermfg=blue
    highlight GitGutterDelete ctermfg=red

    " FZF git checkout
    let g:fzf_checkout_git_options = '--sort=-committerdate'
    nnoremap <silent><C-f> :GBranches<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linters Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""

    " ALE linters configuration
    let g:ale_linters = {
        \ 'python': ['flake8', 'mypy'],
        \ 'javascript': ['eslint'],
    \}

    " Auto-fix
    let b:ale_fixers = ['pgformatter']
    let g:ale_fix_on_save = 2
    let b:ale_sql_pgformatter_options = '--function-case 1 --keyword-case 0 --spaces 0 --no-extra-line'

    " SQL
    " cf. httpqs://github.com/joe-re/sql-language-server
    let g:LanguageClient_serverCommands = {
        \ 'sql': ['sql-language-server', 'up', '--method', 'stdio'],
    \}

    " Terroform
    let g:terraform_fmt_on_save=1

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""

    " fzf with ctrl+p
    fun! FzfOmniFiles()
        let is_git = system('git status')
        if v:shell_error
            :Files
        else
            :GitFiles
        endif
    endfun
    nnoremap <C-p> :call FzfOmniFiles()<cr>

    " fzf file search look like IDE with ctrl+g
    command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
        \   <bang>0 ? fzf#vim#with_preview('up:60%')
        \           : fzf#vim#with_preview('right:52%:hidden', '?'),
        \   <bang>0)
    nnoremap <C-g> :Rg<CR>

    command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

    nnoremap <Leader>f :Files<CR>
    nnoremap <Leader>s :Rg<CR>
    nnoremap <Leader>b :Buffer<CR>

    " Auto-Fix
    let b:ale_fixers = ['pgformatter']
    let g:ale_fix_on_save = 1
    let b:ale_sql_pgformatter_options = '--function-case 1 --keyword-case 2 --spaces 2 --no-extra-line'

    " バッファ検索を開く
    nnoremap fb :Buffers<CR>

    " fpでバッファの中で1つ前に開いたファイルを開く
    nnoremap fp :Buffers<CR><CR>

    " 開いているファイルの文字列検索を開く
    nnoremap fl :BLines<CR>

    " マーク検索を開く
    nnoremap fm :Marks<CR>

    " ファイル閲覧履歴検索を開く
    nnoremap fh :History<CR>

    " コミット履歴検索を開く
    nnoremap fc :Commits<CR>

    " カーソル位置の単語をファイル検索する
    nnoremap fr vawy:Rg <C-R>"<CR>

    " 選択した単語をファイル検索する
    xnoremap fr y:Rg <C-R>"<CR>

    " ESC 2回押しでハイライト消去
    nnoremap <ESC><ESC> :nohl<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display
""""""""""""""""""""""""""""""""""""""""""""""""""""

    " ctrl+/ コメントアウト
    nmap <C-/> <plug>(caw:hatpos:toggle)
    vmap <C-/> <plug>(caw:hatpos:toggle)

    " ctrl+a ファイル内全選択
    nnoremap <C-a> ggvG

    " UnDo 取消永続化
    if has('persistent_undo')
        let undo_path = expand('~/.vim/undo')
        exe 'set undodir=' .. undo_path
        set undofile
    endif

    " Clipboardからペースト可 with ctrl+v
    vmap <C-v> "+y

    " 再読み込み with shift+r
    nnoremap <S-r> :e!<CR>

    " バルス (全てを無に返す...) with qq
    nnoremap qqq <Cmd>qa!<CR>

    " tm ターミナル起動
    nnoremap tm :belowright :terminal<CR>

    "　Split Screen settings
    " (縦)画面分割  ctrl+s→s
    " (横)画面分割       └→v
    nnoremap <C-s><C-s> :split<CR>:set laststatus=2<CR>
    nnoremap <C-s><C-v> :vsplit<CR><C-w>w:set laststatus=2<CR>
    " 新規タブを開く/閉じる with ctrl+t/w
    nnoremap <C-t> :tabnew<cr>
    nnoremap <C-w> :tabclose<cr>
    " ウィンドウ切り替え tab/shift+tab
    nnoremap <Tab> <C-w><C-w>
    nnoremap <S-TaB> <C-w>W
    " 右/左のタブへ with ctrl+n/+shift+p
    " nnoremap <C-n> :tabnext<cr>
    " nnoremap <C-p> :tabprevious<cr>

    " Cursor settings
    " ie. Cursor shape changes depending on the mode
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"
    " [Plug] マルチカーソル with ctrl＋k
    let g:VM_maps = {}
    let g:VM_maps['Find Under'] = '<C-k>'
    let g:VM_maps['Find Subword Under'] = '<C-k>'
    " カーソル行頭/末移動 with shift+h/l
    nnoremap <S-h> 0
    vnoremap <S-h> 0
    nnoremap <S-l> $
    vnoremap <S-l> $

    " Indentline settings
    let g:indentLine_char = '┆'  " インデントラインを縦線で表示
    let g:indentLine_enabled = 1  " プラグインを有効にする
    let g:indentLine_faster = 1   " パフォーマンス向上の設定
    " インデントを整える
    nnoremap == mmggvG$=`m
    " 自動インデント
    inoremap {<Enter> {}<Left><CR><CR><BS><Up><Right>
    "（矩形選択）複数行Tabインデント
    " nnoremap <C-v><tab> S-i tab esc

    " Line-movement settings
    " 単一/複数行移動 with ctrl+shift+↑/↓
    nnoremap <C-S-Up> "zdd<Up>"zP
    nnoremap <C-S-Down> "zdd"zp
    vnoremap <C-S-Up> "zx<Up>"zP`[V`]
    vnoremap <C-S-Down> "zx"zp`[V`]

    " 該当行の複製 with ctrl+shift+D
    " https://qiita.com/HyunwookPark/items/2bd5393fcadac82a88d1

""""""""""""""""""""""""""""""""""""""""""""""""""""

