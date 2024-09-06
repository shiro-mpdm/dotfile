""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  @shiroimon                                                ..dkQa,.      "
"                  `     `   `  `  `  `  `  `  `  ` ` .JHkqkqqqmHMN, `     "
"   `  `  `  `  `     `     `   `                   ` dqkkkkkqqkqqHMb   `  "
"                         ` .?""Wp      ` ` `     .qNY"MNHHNNHqqqqmHN      "
"  `    `   `  `  `  `  ``.%    .M. `..JWMMMN..` dg.."   .TMMMNqqqqmM_   ` "
"    `                   .F      dl.MWfVVVVfVWMN.MPW'       UMNqqqqqM!     "
"                `       d}    ` dNVVyVVyVVVVpppMMb.         UNmmqqM^      "
"       `  `  `     `  ` dm.    .#fVVVyVVVVVWppbbMMe.         ?NNY^        "
"  `     `  `     `   .,?!    ` J#fVVyVVVVfpppbbpbMMp   `      .Wp     `  `"
"     `  .?9?7N,` .,!           ,NVVVyVVVfpppbpbpbM%Ub           We        "
"       J)    ,N.C               WNVVVVVWppppbbpbWF  H|    `      M,       "
"  `    d]     ,"`          `  `  TNkVVWpppbppbWWMe. .Hx `    `   ,N       "
"       ,N          `  `  `  (p    .WNkbpbpbbkY!..(Mx .N.         `d]  `   "
"        Wp   `              `        _T11""=~...``. Tm.Jb `        (b     "
"    `    ?M,    `   `  ..,jAg,              `..JJzT6MN,N.         ,#    ` "
"         `J\   `JD` .?Nm#!   M,              ?!    ..?WM_     `  `.F`     "
"  `     ` M        .@   Hm,..J] `  `   `                          J\      "
"         .#        .M, .J'  .Y           `                        #       "
"     `   .N    `     TN-..?!`    `  `      `  `        `    `  ``,^     ` "
"  `      `M{                          `         `  `            .F        "
"          d[                  `   `     `  `    `    `  ` `  ` .P         "
"     `    ,N   `  `   `  `       `   `       `     9T9YTUwAgJJ/!    `  `  "
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
"       (Wa..   `  `..9N.       `   `  `         `          .`.`d:         "
"           _?""""9!   MP    `     `         `     `  `     `..-@    `  `  "
"""""""""""""""""""""""""""""""  cf. https://tool-taro.com/image_to_ascii/ "

" - [Vim](https://www.vim.org/)
"   - [help - Vim日本語ドキュメント](https://vim-jp.org/vimdoc-ja/)
"
" - [vim-jp](https://vim-jp.org/)
"   - https://github.com/vim-jp
"   - https://zenn.dev/p/vim_jp
"   - https://vim-jp.org/ekiden/
"
" - **cf.**
"   - [キーマップの哲学](https://zenn.dev/vim_jp/articles/2025-05-19-vim-keybind-philosophy)
"   - [ミニマリズムの哲学](https://zenn.dev/antyuntyun/articles/vim_custmoize)
"   - [.vimrc自動生成](https://original-game.com/convenient_tools/set-vimrc/)
"   - [monaqa](https://zenn.dev/monaqa)
"   - [Exploring Vim for Python Developers](https://medium.com/@SmoQ/exploring-vim-for-python-developers-508f2d3ccb06)
"   - [エンベーダー](https://envader.plus/)
"


" --------------------------------------------------
" Plugin
" --------------------------------------------------

if empty(glob('~/.vim/autoload/plug.vim'))
    " cf.https://github.com/junegunn/vim-plug
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) | PlugInstall --sync | source $MYVIMRC

call plug#begin('~/.vim/plugged')

    " File Tree
    Plug 'preservim/nerdtree'

    " Status-bar
    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " File Search (like IDE)
    " cf.https://akaimo.hatenablog.jp/entry/2022/02/02/211048
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " git差分（追加/削除/変更） 行の表示
    " cf. https://qiita.com/youichiro/items/b4750b3e96106d25c5bc#%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E6%A4%9C%E7%B4%A2%E3%81%99%E3%82%8B
    Plug 'airblade/vim-gitgutter'

    " Comment-out
    Plug 'tyru/caw.vim'

    " LSP
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'

    " auto-complete
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'

    " [Format] SQL in Vim
    "  cf.https://dancroak.com/format-sql-in-vim/
    Plug 'dense-analysis/ale'

    " Mulch Cursor
    Plug 'mg981/vim-visual-multi'

    " カーソル位置の単語をハイライト
    Plug 'osyo-manga/vim-brightest'

    " スクロールをヌルヌルさせる
    Plug 'yuttie/comfortable-motion.vim'

    Plug 'stsewd/fzf-checkout.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-fugitive'  "cf.https://github.com/tpope/vim-fugitive
    Plug 'mhinz/vim-signify'
    Plug 'jmcantrell/vim-virtualenv'
    " Plug 'tomtom/tcomment_vim'

call plug#end()


" --------------------------------------------------
" Settings
" --------------------------------------------------

" Encoding
" cf. https://zenn.dev/aikige/articles/how-vim-recognizes-encoding
" 内部処理の文字コード
set encoding=utf-8
" 空のファイルの文字コード
set fileencoding=&encoding
" 先頭付近にデフォルトの文字コードを入れ、その他ありそうな文字コーqを列挙
set fileencodings=ucs-bom,utf-8,iso-2022-jp,cp932,euc-jp,default,latin
" Ambiguous Width Characters(記号表記で崩れさせない)
set ambiwidth=double
" Menuの言語の設定
set langmenu=none
"set langmenu=ja_JP.utf-8 " 日本語のメニューにするなら

set fileformats=unix,dos,mac
set linespace=4                  " 文字間隔
set guifont=*                    " 半角文字
set guifontwide=*                " 全角文字
" set guifont=Menlo:h16            " 文字 eg. set guifont={NAME}:h{SIZE}
set printfont=Cica:h14           "

" Indentation settings
set expandtab                    " Use spaces instead of tabs
set shiftwidth=4                 " Number of spaces to use for indentation
set softtabstop=4                " Number of spaces for Tab key
set autoindent                   " Auto-indent new lines
set smartindent                  "

" Search settings
set incsearch                    " 検索：インクリメントサーチ
set ignorecase                   " 検索：サーチ時に大文字小文字を区別しない
set smartcase                    " 検索：小文字で検索すると大文字小文字を区別しない
set wrapscan                     " 検索：検索がファイルの終わりまで行ったら先頭に戻る
set hlsearch                     " 検索：検索結果をハイライト表示
set noic                         " Disable case-insensitive search

set number                       " 行番号表示
set cursorline                   " カーソールライン表示
" set termwinsize=14x0             " ターミナルのサイズを指定
set updatetime=250               " 反映時間短縮(デフォルト4,000ms)
set virtualedit=onemore          " 移動：行末の3文字先までカーソルを移動できるように
set autoread                     "　
set backspace=indent,eol,start   " backspaceでdeleteする
set list listchars=tab:\▸\-      " 不可視文字を可視化(タブが「▸-」と表示される)
set clipboard+=unnamed           " yank をクリップボードに貼付け
set history=5000                 " 履歴保存数
set nobackup                     " バックアップファイルを作らない
set noswapfile                   " スワップファイルを作らない
set showmatch                    " 対応する括弧を表示
set vb t_vb=                     " beepもビジュアルベルも無効
set wildmenu                     " 補完： tabでファイル名補完を有効
set nowrap                       " 行の折り返しなし
set ttimeoutlen=50               " モード変更遅延解消
set mouse=a                      " マウススクロール（トラックパッド使用可）
set confirm                      " :q 3回で抜ける


" --------------------------------------------------
" Color
" --------------------------------------------------
syntax enable
colorscheme iceberg
let g:iceberg_overrides = {
    \    'Todo': { 'guifg': '303030',
    \              'guibg': 'f0f000',
    \              'ctermfg': 'Black',
    \              'ctermbg': 'Yellow',
    \              'attr': 'bold' },
    \    'Comment': { 'guifg': 'ccc' },
    \}

" 空行のハイライト
augroup HighlightTrailingSpaces
    autocmd!
    autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
    autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" カーソルラインの色変更
highlight CursorLine ctermbg=238 guibg=#3c3836

" 背景透過
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none


" --------------------------------------------------
" File Tree
" --------------------------------------------------

" ファイルツリー
" cf.https://original-game.com/mini_howto/how-to-show-hidden-files-in-nerdtree/
"    ctrl+e  ツリー表示
"    shift+f 不可視ファイルの非表示
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" NERDTree プラグインで不可視ファイル（ドットファイル）を表示
let NERDTreeShowHidden = 1

" Vim を起動時に自動的に NERDTree を開く
" autocmd VimEnter * NERDTree | wincmd p

" ファイルが指定されていない場合にのみ NERDTree を開く
" autocmd VimEnter * if argc() == 0 | NERDTree | endif

" Vim起動時にNERDTreeが開かれない場合に備えて、NERDTreeの自動起動をスクリプトで管理
function! StartUpNERDTree()
    " ファイルが指定されていない場合のみNERDTreeを開く
    if argc() == 0
        NERDTree
        wincmd p
    endif
endfunction
autocmd VimEnter * call StartUpNERDTree()


" --------------------------------------------------
" Status Line
" --------------------------------------------------

" StatusLine
" [0] 表示しない [1]二つ以上ウィンドウがある時だけ表示 [2]常に表示
set laststatus=2

" ステータスラインをカスタマイズ.
" set statusline=%F    " ファイル名表示
" set statusline+=%m   " 変更チェック表示
" set statusline+=%r   " 読み込み専用かどうか表示
" set statusline+=%h   " ヘルプページなら[HELP]と表示
" set statusline+=%w   " プレビューウインドウなら[Preview]と表示

" ステータスライン右寄せ表示
" set statusline+=%=g
" set statusline+=[enc=%{&fileencoding}] " file encoding
" set statusline+=[row=%l/%L]            " 現在行数/全行数
" set statusline+=[col=%c]               " 現在列数

" ステータスラインに表示する項目を変更する.
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'y', 'z', 'error', 'warning' ]
    \ ]
let g:airline_section_c = '%t %M'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%5l:%-2v'

let g:airline#extensions#hunks#non_zero_only = 1 " 変更がなければdiff行数を非表示

" Airline settings
" cf. https://www.reddit.com/r/vim/comments/crs63u/best_airline_settings/
" let g:airline_powerline_fonts = 1
let g:airline_theme = 'papercolor' " テーマ指定
                                   " cf. https://github.com/vim-airline/vim-airline/wiki/Screenshots
" set t_Co=258                       " この設定がないと色が正しく表示されない場合がある
" let g:airline#extensions#hunks#enabled = 0
" let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1         " ファイルタブラインを表示（上部）
let g:airline#extensions#tabline#buffer_idx_mode = 1 " ファイルタブ番号表示（上部）

" Airline symbols
" cf. https://original-game.com/vim-airline/
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif


" --------------------------------------------------
" Git
" --------------------------------------------------

" g[  前の変更箇所へ移動する
" g]  次の変更箇所へ移動する
" gh  diffをハイライトする
" gp  カーソル行のdiffを表示する
nnoremap g[ :GitGutterPrevHunk<CR>
nnoremap g] :GitGutterNextHunk<CR>
nnoremap gh :GitGutterLineHighlightsToggle<CR>
nnoremap gp :GitGutterPreviewHunk<CR>

" Sort branches/tags by committer date. Minus sign to show in reverse order (recent first).
let g:fzf_checkout_git_options = '--sort=-committerdate'

" ctrl+f :fzf-checkout
" Define a diff action using fugitive. You can use it with :GBranches diff.
nnoremap <silent><C-f> :GBranches<CR>

" 記号の色を変更する
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=blue
highlight GitGutterDelete ctermfg=red


" --------------------------------------------------
" Programing / Language / Lint
" --------------------------------------------------

" Markdown

" Python

" SQL
" cf. https://github.com/joe-re/sql-language-server
" cf. https://marketplace.visualstudio.com/items?itemName=joe-re.sql-language-server#neovim
" let g:LanguageClient_serverCommands = {
"    \ 'sql': ['sql-language-server', 'up', '--method', 'stdio'],
"    \ }

""[Unicode symbols left]
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_left_alt_sep = ''

""[Unicode symbols right]
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.crypt = '🔒' " 暗号化されたファイル
" let g:airline_symbols.linenr = '¶' " 行
" let g:airline_symbols.maxlinenr = '㏑' " 最大行
" let g:airline_symbols.branch = '⎇' " gitブランチ
" let g:airline_symbols.paste = 'ρ' " ペーストモード
" let g:airline_symbols.spell = 'Ꞩ'
" let g:airline_symbols.notexists = '∄' " gitで管理されていない場合
" let g:airline_symbols.whitespace = 'Ξ' " 空白の警告(余分な空白など)


" --------------------------------------------------
" Search
" --------------------------------------------------

fun! FzfOmniFiles()
    let is_git = system('git status')
    if v:shell_error
        :Files
    else
        :GitFiles
    endif
endfun
nnoremap <C-p> :call FzfOmniFiles()<cr>

" fzf file search look like IDE
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

" ESCの4回押しでハイライト消去
nnoremap <ESC><ESC> :nohl<CR>


" --------------------------------------------------
" Display
" --------------------------------------------------

" shift+r: 再読み込み
nnoremap <S-r> :e!<CR>

" ctrl+shift+t :ターミナル表示
nnoremap <silent><C-S-t> :bo term<CR>

" crtl+s/crtl+v :画面分割
nnoremap <C-s><C-s> :split<CR>:set laststatus=4<CR>
nnoremap <C-s><C-v> :vsplit<CR><C-w>w:set laststatus=4<CR>

" tab/shift+tab :ウィンドウ切り替え
nnoremap <Tab> <C-w><C-w>
nnoremap <S-TaB> <C-w>W

" ファイルタブ(like Web-browser)
" ctrl + t       : 新規タブを開く
" ctrl + w       : タブを閉じる
" ctrl + tab     : 3つ右のタブを開く
" ctrl+shift+tab : 3つ左のタブを開く
nnoremap <C-t> :tabnew<cr>
nnoremap <C-w> :tabclose<cr>
nnoremap <C-tab> :tabnext<cr>
nnoremap <C-S-tab> :tabprevious<cr>

" ctrl+b/n : ファイルタブ移動（左右）
nmap <C-b> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" ctrl＋k :マルチカーソル
let g:VM_maps = {}
let g:VM_maps['Find Under'] = '<C-k>'
let g:VM_maps['Find Subword Under'] = '<C-k>'


" --------------------------------------------------
" Text Editor
" --------------------------------------------------

" [V]ctrl+↑/↓ :単一 複数行移動
nnoremap <C-Up> "zdd<Up>"zP
nnoremap <C-Down> "zdd"zp
vnoremap <C-Up> "zx<Up>"zP`[V`]
vnoremap <C-Down> "zx"zp`[V`]

" インデントを整える
nnoremap == mmggvG$=`m

" 自動インデント
inoremap {<Enter> {}<Left><CR><CR><BS><Up><Right>

" ctrl+/ :コメントアウト(ie. comand+/ のような)
nmap <C-/> <plug>(caw:hatpos:toggle)
vmap <C-/> <plug>(caw:hatpos:toggle)

" ctrl+v :Clipboardからペースト可
vmap <C-v> "+y

" ctrl+a :ファイル全選択(ie. comand+aのような)
nnoremap <C-a> ggvG

" shift+h /:行頭行末移動
nnoremap <S-h> 0
vnoremap <S-h> 0
nnoremap <S-l> $
vnoremap <S-l> $

" UnDo 取消永続化
if has('persistent_undo')
    let undo_path = expand('~/.vim/undo')
    exe 'set undodir=' .. undo_path
    " set undodir=~/.vim/undo
    set undofile
endif

" gaでEasy Align 起動
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Auto-fix
let b:ale_fixers = ['pgformatter']
let g:ale_fix_on_save = 2
let b:ale_sql_pgformatter_options = '--function-case 1 --keyword-case 0 --spaces 0 --no-extra-line'

