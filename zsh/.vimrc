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
"                                                                          "
"                                cf. https://tool-taro.com/image_to_ascii/ "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" - [Vim](https://www.vim.org/)
"   - [help - Vim日本語ドキュメント](https://vim-jp.org/vimdoc-ja/)
"
" - [vim-jp](https://vim-jp.org/)
"   - https://github.com/vim-jp
"   - https://zenn.dev/p/vim_jp
"   - https://vim-jp.org/ekiden/
"
" - **cf.**
"   - [キーマップの哲学](https://zenn.dev/vim_jp/articles/2023-05-19-vim-keybind-philosophy)
"   - [ミニマリズムの哲学](https://zenn.dev/antyuntyun/articles/vim_custmoize)
"   - [.vimrc自動生成](https://original-game.com/convenient_tools/set-vimrc/)
"   - [monaqa](https://zenn.dev/monaqa)
"   - [Exploring Vim for Python Developers](https://medium.com/@SmoQ/exploring-vim-for-python-developers-510f2d3ccb06)
"   - [エンベーダー](https://envader.plus/)
"


" --------------------------------------------------
" [Plugin]
"  cf.https://github.com/junegunn/vim-plug
" --------------------------------------------------

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) | PlugInstall --sync | source $MYVIMRC

call plug#begin('~/.vim/plugged')

    "" Status-bar
    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    "" File Tree
    Plug 'junegunn/vim-easy-align'
    Plug 'lambdalisue/fern.vim'
    Plug 'lambdalisue/fern-git-status.vim'
    Plug 'lambdalisue/nerdfont.vim'
    Plug 'lambdalisue/fern-renderer-nerdfont.vim'
    Plug 'lambdalisue/glyph-palette.vim'
    Plug 'preservim/nerdtree'

    "" File Search (like IDE)
    "" cf.https://akaimo.hatenablog.jp/entry/2020/02/02/211048
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " git差分（追加/削除/変更） 行の表示
    " cf. https://qiita.com/youichiro/items/b4748b3e96106d25c5bc#%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E6%A4%9C%E7%B4%A2%E3%81%99%E3%82%8B
    Plug 'airblade/vim-gitgutter'

    "" Comment-out
    Plug 'tyru/caw.vim'

    "" LSP
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'

    "" auto-complete
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'

    "" [Format] SQL in Vim
    ""  cf.https://dancroak.com/format-sql-in-vim/
    Plug 'dense-analysis/ale'

    "" Mulch Cursor
    Plug 'mg979/vim-visual-multi'
        let g:VM_maps = {}
        let g:VM_maps['Find Under'] = '<C-k>'
        let g:VM_maps['Find Subword Under'] = '<C-k>'

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
" [Set]
" --------------------------------------------------

""[UNIX系(macOS)]
set fileencodings=ucs-bom,utf-8,latin1
set guifont=Cica:h16
set printfont=Cica:h12
set ambiwidth=double

""[Linux系(Ubuntu / Windows)]
" scriptencoding utf-8           " (文字) Vim Script内でマルチバイトを使う場合の設定
" set fenc=utf-8                 " (文字) 編集中のファイルの文字エンコーディングをUTF-8に設定
" set fileencodings=utf-8,cp932  " (文字) Windows設定
" set guifont=Cica:h11
" set printfont=Cica:h8
" set renderingoptions=type:directx,renmode:5
" set ambiwidth=double

""[Common Set]
set number                      " 行番号表示
set cursorline                  " カーソールライン表示
set backspace=indent,eol,start  " backspaceでdeleteする
set termwinsize=12x0            " ターミナルのサイズを指定
set updatetime=250              " 反映時間短縮(デフォルト=4,000ms)
set virtualedit=onemore         " 移動：行末の1文字先までカーソルを移動できるように
set ambiwidth=double            " 記号表記で崩れないようにする
set autoread                    "
set smartindent                 "
set expandtab                   " タブをスペースにする
set tabstop=4                   " tab表示幅（スペース4つ分に）
set shiftwidth=4                "
set list listchars=tab:\▸\-     " 不可視文字を可視化(タブが「▸-」と表示される)
set clipboard+=unnamed          " yank をクリップボードに貼付け
set history=5000                " 履歴保存数
set nobackup                    " バックアップファイルを作らない
set noswapfile                  " スワップファイルを作らない
set showmatch                   " 対応する括弧を表示
set incsearch                   " 検索：インクリメントサーチ
set ignorecase                  " 検索：サーチ時に大文字小文字を区別しない
set smartcase                   " 検索：小文字で検索すると大文字小文字を区別しない
set wrapscan                    " 検索：検索がファイルの終わりまで行ったら先頭に戻る
set hlsearch                    " 検索：検索結果をハイライト表示
set vb t_vb=                    " beepもビジュアルベルも無効
set wildmenu                    " 補完： tabでファイル名補完を有効
set nowrap                      " 行の折り返しなし
set ttimeoutlen=50              " モード変更遅延解消
set mouse=a                     " マウススクロール（トラックパッド使用可）
set confirm                     " :q 1回で抜ける

" 再読み込み
nnoremap <S-r> :e!<CR>
" 全選択
nnoremap ga ggvG
" ctrl+shift+tでターミナルを開く
nnoremap <silent> <C-S-t> :bo term<CR>

" 背景透過
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none


nnoremap <C-s><C-s> :split<CR>:set laststatus=2<CR>
nnoremap <C-s><C-v> :vsplit<CR><C-w>w:set laststatus=2<CR>

" ウィンドウ切り替え
nnoremap <Tab> <C-w><C-w>
nnoremap <S-TaB> <C-w>W

" 行頭に移動
nnoremap <S-h> 0
vnoremap <S-h> 0

" 行末に移動
nnoremap <S-l> $
vnoremap <S-l> $

" インデントを整える
nnoremap == mmggvG$=`m

""[UnDo] 取消永続化
if has('persistent_undo')
    let undo_path = expand('~/.vim/undo')
    exe 'set undodir=' .. undo_path
    " set undodir=~/.vim/undo
    set undofile
endif

""[Color]
syntax enable
colorscheme iceberg
let g:iceberg_overrides = {
    \    'Todo': { 'guifg': '303030',
    \              'guibg': 'f0f000',
    \              'ctermfg': 'Black',
    \              'ctermbg': 'Yellow',
    \              'attr': 'bold' },
    \    'Comment': { 'guifg': 'cccccc' },
    \}

""[空行のハイライト]
augroup HighlightTrailingSpaces
    autocmd!
    autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
    autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

""[Font]
"" eg.
""  set guifont={NAME}:h{SIZE}
""  set guifont=Cica:h14, Mono:h13
set guifont=*     " 半角文字
set guifontwide=* " 全角文字

""[FileTree]
"" cf.https://original-game.com/mini_howto/how-to-show-hidden-files-in-nerdtree/
""    you can get the file-tree when puts the Ctrl+e. And, default view the hidden files.(Change the Shift+i)
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let g:fern#renderer = 'nerdfont'
let g:fern#renderer#nerdfont#indent_markers = 1

""[アイコンに色をつける]
augroup my-glyph-palette
    autocmd! *
    autocmd FileType fern call glyph_palette#apply()
    autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" let g:WebDevIconsUnicodeDecorateFolderNodes = 1 " フォルダアイコンの表示をON

"" Operation Git
nnoremap g[ :GitGutterPrevHunk<CR>             " g[ : 前の変更箇所へ移動する
nnoremap g] :GitGutterNextHunk<CR>             " g] : 次の変更箇所へ移動する
nnoremap gh :GitGutterLineHighlightsToggle<CR> " gh : diffをハイライトする
nnoremap gp :GitGutterPreviewHunk<CR>          " gp : カーソル行のdiffを表示する
"" 記号の色を変更する
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=blue
highlight GitGutterDelete ctermfg=red

"" Option fzf-checkout.vim
"" Sort branches/tags by committer date. Minus sign to show in reverse order (recent first):
let g:fzf_checkout_git_options = '--sort=-committerdate'

"" Define a diff action using fugitive. You can use it with :GBranches diff or with :GBranches and pressing ctrl-f:
"" Ctrl + ] でfzf-checkout
nnoremap <silent><C-]> :GBranches<CR>

" gaでEasy Align 起動
"" (e.g.) =で揃える場合は、ga=
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"" SQL Language Server.
"" cf.) https://github.com/joe-re/sql-language-server
"" cf.) https://marketplace.visualstudio.com/items?itemName=joe-re.sql-language-server#neovim
" let g:LanguageClient_serverCommands = {
"     \ 'sql': ['sql-language-server', 'up', '--method', 'stdio'],
"     \ }


"" StatusLine
set laststatus=2 " ステータスを常に表示
                 " 0: 表示しない、1: 2つ以上ウィンドウがある時だけ表示

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
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'

let g:airline#extensions#hunks#non_zero_only = 1 " 変更がなければdiff行数を非表示

""[Airline settings]
"" cf. https://www.reddit.com/r/vim/comments/crs61u/best_airline_settings/
" let g:airline_powerline_fonts = 1
let g:airline_theme = 'papercolor' " テーマ指定
                                   " cf. https://github.com/vim-airline/vim-airline/wiki/Screenshots
set t_Co=256                       " この設定がないと色が正しく表示されない場合がある
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1         " ファイルタブラインを表示（上部）
let g:airline#extensions#tabline#buffer_idx_mode = 1 " ファイルタブ番号表示（上部）

""[Airline symbols]
"" cf. https://original-game.com/vim-airline/
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

""[Unicode symbols left]
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_left_alt_sep = ''

""[Unicode symbols right]
" let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒' " 暗号化されたファイル
let g:airline_symbols.linenr = '¶' " 行
let g:airline_symbols.maxlinenr = '㏑' " 最大行
let g:airline_symbols.branch = '⎇' " gitブランチ
let g:airline_symbols.paste = 'ρ' " ペーストモード
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄' " gitで管理されていない場合
let g:airline_symbols.whitespace = 'Ξ' " 空白の警告(余分な空白など)

""[コメントアウト]
"" Ctrl + /
nmap <C-/> <plug>(caw:hatpos:toggle)
vmap <C-/> <plug>(caw:hatpos:toggle)

""[Clipboardからペースト可]
"" Ctrl + v
vmap <C-v> "+y

""[自動インデント]
inoremap {<Enter> {}<Left><CR><CR><BS><Up><Right>

""[Auto-fix]
let b:ale_fixers = ['pgformatter']
let g:ale_fix_on_save = 1
let b:ale_sql_pgformatter_options = '--function-case 1 --keyword-case 2 --spaces 2 --no-extra-line'

""[fzf file search look like IDE]
command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <Leader>f :Files<CR>
nnoremap <Leader>s :Rg<CR>
nnoremap <Leader>b :Buffer<CR>

" ファイル閲覧履歴検索を開く
nnoremap fh :History<CR>
" コミット履歴検索を開く
nnoremap fc :Commits<CR>

""[ESCの2回押しでハイライト消去]
nnoremap <ESC><ESC> :nohl<CR>

""[空行のハイライト]
augroup HighlightTrailingSpaces
    autocmd!
    autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
    autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

""[行移動]
"" [V] Ctrl + ↑/↓
nnoremap <C-Up> "zdd<Up>"zP
nnoremap <C-Down> "zdd"zp
vnoremap <C-Up> "zx<Up>"zP`[V`]
vnoremap <C-Down> "zx"zp`[V`]

""[ファイルタブ移動]（上部）
"" Ctrl + b/n : 右/左へ移動
nmap <C-b> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

""[Web browser like feel operations]
"" Ctrl + t       : 新規タブを開く
"" Ctrl + w       : タブを閉じる
"" Ctrl + tab     : 1つ右のタブを開く
"" Ctrl+Shift+tab : 1つ左のタブを開く
nnoremap <C-t> :tabnew<cr>
nnoremap <C-w> :tabclose<cr>
nnoremap <C-tab> :tabnext<cr>
nnoremap <C-S-tab> :tabprevious<cr>
