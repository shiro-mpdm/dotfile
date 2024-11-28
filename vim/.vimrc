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

    " Install `vim-plug` if not installed.
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

    " Auto install missing plugins.
    autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) | PlugInstall --sync | source $MYVIMRC

    call plug#begin('~/.vim/plugged')

        " Essential
        Plug 'preservim/nerdtree'             " File Tree
        Plug 'ryanoasis/vim-devicons'         " Icons for NERDTree
        Plug 'wakatime/vim-wakatime'          " Productivity metrics

        " FZF for searching
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'

        " Git integration
        Plug 'airblade/vim-gitgutter'         " Show git changes
        Plug 'tpope/vim-fugitive'             " Execute Git command in Vim
        Plug 'Xuyuanp/nerdtree-git-plugin'    " Viewing Git status in NerdTree

        " LSP and Autocomplete
        Plug 'prabirshrestha/vim-lsp'
        Plug 'mattn/vim-lsp-settings'
        Plug 'prabirshrestha/asyncomplete.vim'
        Plug 'prabirshrestha/asyncomplete-lsp.vim'

        " Linter / Syntax
        Plug 'dense-analysis/ale'             " ALE(Asynchronous Lint Engine)
        Plug 'hashivim/vim-terraform'         " Terraform Syntaxhighlight
        Plug 'jjo/vim-cue'                    " CUE Syntaxhighlight
        Plug 'chrisbra/csv.vim'               " CSV Viewer
        Plug 'yuucu/vimq.vim'                 " CSV Data Handling at SQL using `q`
        Plug 'Vimjas/vim-python-pep8-indent'  " Python for PEP8 compliant
        Plug 'jmcantrell/vim-virtualenv'      " Python virtual environments easily switching (virtualenv)
        Plug 'shirk/vim-gas'                  " GAS Syntaxhighlight

        " UI Enhancements
        Plug 'Yggdroot/indentLine'            " Show indent lines
        Plug 'tyru/caw.vim'                   " Comment toggle
        Plug 'osyo-manga/vim-brightest'       " Highlight cursor line
        Plug 'yuttie/comfortable-motion.vim'  " Smooth scrolling

        " Status Bar
        Plug 'bling/vim-airline'
        Plug 'vim-airline/vim-airline-themes'

        " Screen operation
        " Plug 'simeji/winresizer'              " Easy resizing windows
        " Plug 't9md/vim-textmanip'             " Move/Duplicate text intuitively

    call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"          https://vim-jp.org/vimdoc-ja/options.html
""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Encoding settings
    " cf. https://zenn.dev/aikige/articles/how-vim-recognizes-encoding
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
    set hlsearch                     " Highlight search results
    set ignorecase                   " Ignore case when searching
    set smartcase                    " Search insensitively in lowercase
    set wrapscan                     " When the end, go back to the beginning
    set noic                         " Disable case-insensitive search

    " UI/UX settings
    set number                       " 行番号表示
    set cursorline                   " カーソールライン表示
    set title                        " 編集中ファイル名表示
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

    " Folding settings
    set foldmethod=syntax            " 自動で構造に基づいたフォールディングを有効化
    set foldlevel=1                  " デフォルトで折り畳みを 1 段階に設定
    set foldenable                   " フォールディングを有効化

""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Color and UI Customization
""""""""""""""""""""""""""""""""""""""""""""""""""""

    syntax enable
    colorscheme iceberg

    " Customize colors
    let g:iceberg_overrides = {
        \ 'Todo': { 'guifg': '303030',
        \           'guibg': 'f0f000',
        \           'ctermfg': 'Black',
        \           'ctermbg': 'Yellow',
        \           'attr': 'bold' },
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
    let g:NERDTreeWinSize=50

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

    " FZF `$ git checkout`
    let g:fzf_checkout_git_options = '--sort=-committerdate'
    " nnoremap <silent><C-f> :GBranches<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linters Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""

    " ALE linters configuration
    let g:ale_linters = {
        \ 'python': ['flake8', 'mypy', 'pylint'],
        \ 'javascript': ['eslint'],
    \}

    " Auto-fix configuration for multiple file types
    let g:ale_fixers = {
        \ 'python': ['black', 'isort'],
        \ 'sql': ['pgformatter'],
    \}

    " Fix on save (2 means fix only when supported by file type)
    let g:ale_fix_on_save = 2

    " SQL
    " eg. CTEs の前後にマーキング（"-- {{{ CTE start -- }}} CTE end"）
    "     - Close with zc (all with zM)
    "     - Open  with zo (all with zR)
    autocmd FileType sql setlocal foldmethod=marker
    " cf. httpqs://github.com/joe-re/sql-language-server
    let g:LanguageClient_serverCommands = {
        \ 'sql': ['sql-language-server', 'up', '--method', 'stdio'],
    \}
    " pgformatter options for SQL formatting
    let g:ale_sql_pgformatter_options = '--function-case 1 --keyword-case 0 --spaces 0 --no-extra-line'

    " Python
    autocmd FileType python setlocal foldmethod=indent " Folding
    " autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab

    " JavaScript
    autocmd FileType javascript setlocal foldmethod=indent

    " Terroform
    let g:terraform_fmt_on_save=1

    " CSV
    " let g:csv_no_conceal=1         " デリミタ表示
    " let g:csv_highlight_column='y' " カーソルが列をハイライト
    let b:csv_headerline=1         " ヘッダハイライトキャンセル行

    " Markdown


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""

    " FZF with ctrl+p
    fun! FzfOmniFiles()
        let is_git = system('git status')
        if v:shell_error
            :Files
        else
            :GitFiles
        endif
    endfun
    nnoremap <C-p> :call FzfOmniFiles()<cr>

    " FZF file search look like IDE with ctrl+g
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

    " バッファの中で1つ前に開いたファイルを開く
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

    " Commentout with ctrl+/
    nmap <C-/> <plug>(caw:hatpos:toggle)
    vmap <C-/> <plug>(caw:hatpos:toggle)

    " Select all into the fail with ctrl+a
    nnoremap <C-a> ggvG

    " UnDo 取消永続化
    if has('persistent_undo')
        let undo_path = expand('~/.vim/undo')
        exe 'set undodir=' .. undo_path
        set undofile
    endif

    " Paste from clipboard with ctrl+v
    vmap <C-v> "+y

    " Reroad with shift+r
    nnoremap <S-r> :e!<CR>

    " バルス (全てを無に返す...) with qqq
    nnoremap qqq <Cmd>qa!<CR>

    " Open terminal with tm
    nnoremap tm :belowright :terminal<CR>

    " Split Screen settings
    " with ctrl+s-> s (sideways)
    "           └-> v (vertical)
    nnoremap <C-s><C-s> :split<CR>:set laststatus=2<CR>
    nnoremap <C-s><C-v> :vsplit<CR><C-w>w:set laststatus=2<CR>
    " Switch Screen with tab/shift+tab
    nnoremap <Tab> <C-w><C-w>
    nnoremap <S-TaB> <C-w>W

    " New open&close Tab with ctrl+t/w
    nnoremap <C-t> :tabnew<cr>
    nnoremap <C-w> :tabclose<cr>
    " 右/左のタブへ with ctrl+n
    nnoremap <C-n> :tabnext<CR>
    " nnoremap <C-p> :tabprevious<cr>

    " Cursor settings
    " ie. Cursor shape changes depending on the mode
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"
    " マルチカーソル with ctrl＋k
    let g:VM_maps = {}
    let g:VM_maps['Find Under'] = '<C-k>'
    let g:VM_maps['Find Subword Under'] = '<C-k>'
    " カーソル行頭/末移動 with shift+h/l
    nnoremap <S-h> 0
    vnoremap <S-h> 0
    nnoremap <S-l> $
    vnoremap <S-l> $

    " Indentline settings
    let g:indentLine_char = '┆'   " インデントラインを縦線で表示
    let g:indentLine_enabled = 1  " プラグインを有効にする
    let g:indentLine_faster = 1   " パフォーマンス向上の設定
    " インデントを整える
    nnoremap == mmggvG$=`m
    " 自動インデント
    inoremap {<Enter> {}<Left><CR><CR><BS><Up><Right>
    "（矩形選択）複数行Tabインデント
    " nnoremap <C-v> <S-i><tab><esc>

    " Move current line up / down
    " cf. https://qiita.com/itmammoth/items/312246b4b7688875d023
    nnoremap <A-Up> "zdd<Up>"zP
    nnoremap <A-Down> "zdd"zp
    vnoremap <A-Up> "zx<Up>"zP`[V`]
    vnoremap <A-Down> "zx"zp`[V`]

    " Duplicate the row with ctrl+d
    " cf. https://qiita.com/HyunwookPark/items/2bd5393fcadac82a88d1
    nnoremap <C-d> yyp


""""""""""""""""""""""""""""""""""""""""""""""""""""

