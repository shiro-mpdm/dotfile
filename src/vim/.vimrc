""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  @shiro                                                ..dkQa,.          " ❄ EXPLAIN & MEMORIZE
"                  `     `   `  `  `  `  `  `  `  ` ` .JHkqkqqqmHMN, `     "   Vim (Official): https://www.vim.org/
"   `  `  `  `  `     `     `   `                   ` dqkkkkkqqkqqHMb   `  "   vim-jp        : https://vim-jp.org/
"                         ` .?""Wp      ` ` `     .qNY"MNHHNNHqqqqmHN      "                 : https://github.com/vim-jp
"  `    `   `  `  `  `  ``.%    .M. `..JWMMMN..` dg.."   .TMMMNqqqqmM_   ` "                 : https://zenn.dev/p/vim_jp
"    `                   .F      dl.MWfVVVVfVWMN.MPW'       UMNqqqqqM!     "                 : https://vim-jp.org/ekiden/
"                `       d}    ` dNVVyVVyVVVVpppMMb.         UNmmqqM^      "   エンベーダー  : https://envader.plus/
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

" - Reference
"   キーマップの哲学　cf.　https://zenn.dev/vim_jp/articles/2023-05-19-vim-keybind-philosophy
"   ミニマリズムの哲学cf.https://zenn.dev/antyuntyun/articles/vim_custmoize
"   .vimrc自動生成　　cf.https://original-game.com/convenient_tools/set-vimrc/
"   https://zenn.dev/monaqa
"   https://minerva.mamansoft.net/Notes/%F0%9F%93%9CVim%E3%81%AE%E3%83%97%E3%83%A9%E3%82%B0%E3%82%A4%E3%83%B3%E3%83%9E%E3%83%8D%E3%83%BC%E3%82%B8%E3%83%A3%E3%83%BC%E3%82%92Vundle%E3%81%8B%E3%82%89vim-plug%E3%81%B8%E7%A7%BB%E8%A1%8C%E3%81%99%E3%82%8B
"   https://medium.com/@SmoQ/exploring-vim-for-python-developers-510f2d3ccb06



"""""""""""""""""""""""""""
" ❄︎ VIM DISPLAY FRAME
"""""""""""""""""""""""""""
set encoding=utf-8             " 読み込み時の文字コードの設定
scriptencoding utf-8           " Vim Script内でマルチバイトを使う場合の設定
" set fenc=utf-8               "
set fileencodings=utf-8,cp932  "

set number                     " 行番号表示
set cursorline                 " カーソールライン表示
set backspace=indent,eol,start " バックスペースを有効にする
" set termwinsize=12x0           " ターミナルのサイズを指定
set updatetime=250             " 反映時間短縮(デフォルト=4,000ms)
set virtualedit=onemore        " 行末の1文字先までカーソルを移動できるように
set ambiwidth=double           " 記号表記で崩れないようにする
set autoread                   " オートインデント
set smartindent                " オートインデント
set expandtab                  " タブをスペースにする
set tabstop=4                  " 行頭以外のtab表示幅（タブスペース　4つ分に）
set shiftwidth=4               " 行頭で　のtab表示幅（シフトスペース4つ分に）
set list listchars=tab:\▸\-    " 不可視文字を可視化(タブが「▸-」と表示される)
set clipboard+=unnamed         " yank をクリップボードに貼付け
set history=5000               "
set nobackup                   " バックアップファイルを作らない
set noswapfile                 " スワップファイルを作らない
set showmatch                  " 対応する括弧を表示
set incsearch                  " (検索)インクリメントサーチ
set ignorecase                 " (検索)サーチ時に大文字小文字を区別しない
set smartcase                  " (検索)小文字で検索すると大文字小文字を区別しない
set wrapscan                   " (検索)検索がファイルの終わりまで行ったら先頭に戻る
set hlsearch                   " (検索)検索結果をハイライト表示
set vb t_vb=                   " beepもビジュアルベルも無効
set wildmenu                   " (補完)コマンドライン
set nowrap                     " 行の折り返しなし
set ttimeoutlen=50             " モード変更遅延解消

"" UnDo : 取消（永続化）
if has('persistent_undo')
    let undo_path = expand('~/.vim/undo')
    exe 'set undodir=' .. undo_path
    " set undodir=~/.vim/undo
    set undofile
endif


"" Color：ソースコードに色付け
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

"" Font
"" e.g.)
""     set guifont={NAME}:h{SIZE}
""     set guifont=Cica:h14, Mono:h13
set guifont=*     " 半角文字
set guifontwide=* " 全角文字


"" Pligin
"" cf.) https://github.com/junegunn/vim-plug
""      install vim-plug if not exists.
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" Auto install plugin.
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) | PlugInstall --sync | source $MYVIMRC

"" The range below is plugins.
call plug#begin('~/.vim/plugged')

    Plug 'airblade/vim-gitgutter'                 " git差分（追加/削除/変更） 行の表示

    "" Statusbar.
    Plug 'bling/vim-airline'                      "
    Plug 'vim-airline/vim-airline'                "
    Plug 'vim-airline/vim-airline-themes'         "

    "" File Tree
    Plug 'junegunn/vim-easy-align'
    Plug 'lambdalisue/fern.vim'                   "（ファイルツリー）
    Plug 'lambdalisue/fern-git-status.vim'        "  ┗ ファイルツリーに、gitの差分が表示
    Plug 'lambdalisue/nerdfont.vim'               "  ┗ ファイルツリーに、ファイルのアイコンを表示
    Plug 'lambdalisue/fern-renderer-nerdfont.vim' "  ┗ ファイルツリーに、ファイルのアイコンを表示
    Plug 'lambdalisue/glyph-palette.vim'          "  ┗ ファイルツリーの、アイコンに色をつける

    "" File Serch
    "" (cf.) https://qiita.com/youichiro/items/b4748b3e96106d25c5bc#%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E6%A4%9C%E7%B4%A2%E3%81%99%E3%82%8B
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'                       "（検索）ファイルの曖昧検索
    Plug 'stsewd/fzf-checkout.vim'                "
    Plug 'preservim/nerdtree'                     "
    Plug 'sheerun/vim-polyglot'                   "
    Plug 'tpope/vim-fugitive'                     " (cf.) https://github.com/tpope/vim-fugitive
    Plug 'mhinz/vim-signify'                      "
    Plug 'ctrlpvim/ctrlp.vim'                     "（検索）Ctrl+p でファイル・バッファを曖昧検索
    Plug 'jmcantrell/vim-virtualenv'
    " Plug 'tomtom/tcomment_vim'
    Plug 'tyru/caw.vim'                           " comment-out

    "" LSP
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'

    "" auto-complete
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'

    "" Format SQL in Vim
    "" cf.) https://dancroak.com/format-sql-in-vim/
    Plug 'dense-analysis/ale'

    "" Mulch Cursor
    Plug 'mg979/vim-visual-multi'
    let g:VM_maps = {}
    let g:VM_maps['Find Under'] = '<C-k>'
    let g:VM_maps['Find Subword Under'] = '<C-k>'

call plug#end()


"" FileTree
"" cf.) https://original-game.com/mini_howto/how-to-show-hidden-files-in-nerdtree/
""      you can get the file-tree when puts the Ctrl+e.
""      And, default view the hidden files.(Change the Shift+i)
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let g:fern#renderer = 'nerdfont'  " ファイルツリーにファイルアイコンを表示: 有効化
let g:fern#renderer#nerdfont#indent_markers = 1

"" アイコンに色をつける
augroup my-glyph-palette
    autocmd! *
    autocmd FileType fern call glyph_palette#apply()
    autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

"" Mac
set guifont=Cica:h16
set printfont=Cica:h12
set ambiwidth=double

"" Windows
" set guifont=Cica:h11
" set printfont=Cica:h8
" set renderingoptions=type:directx,renmode:5
" set ambiwidth=double

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


"""""""""""""""""""""""""""
" ❄︎ VIM DISPLAY CONTENT
"""""""""""""""""""""""""""

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

"" Airline settings.
"" cf.) https://www.reddit.com/r/vim/comments/crs61u/best_airline_settings/
" let g:airline_powerline_fonts = 1
let g:airline_theme = 'papercolor' " テーマ指定
                                   " cf. https://github.com/vim-airline/vim-airline/wiki/Screenshots
set t_Co=256                       " この設定がないと色が正しく表示されない場合がある
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1         " タブラインを表示
let g:airline#extensions#tabline#buffer_idx_mode = 1 " タブ番号表示

"" Airline symbols.
"" cf.) https://original-game.com/vim-airline/
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"" Unicode symbols left.
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_left_alt_sep = ''

"" Unicode symbols right.
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

"" WebBrowser like operation feel.
nnoremap <C-t> :tabnew<cr>          "Ctrl + t  : 新規タブを開く
nnoremap <C-w> :tabclose<cr>        "Ctrl + w  : タブを閉じる
nnoremap <C-tab> :tabnext<cr>       "Ctrl + tab: 1つ右のタブを開く
nnoremap <C-S-tab> :tabprevious<cr> "Ctrl+Shift+tab : 1つ左のタブを開く

""" タブ移動
nmap <C-b> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

"" コメントアウト
nmap <C-/> <plug>(caw:hatpos:toggle)
vmap <C-/> <plug>(caw:hatpos:toggle)

"" Clipboardからペースト可能
vmap <C-v> "+y

" gaでEasy Align 起動

"" 自動インデント
inoremap {<Enter> {}<Left><CR><CR><BS><Up><Right>

"" fzf
"   :Commands  コマンド一覧
"   :Files     カレントディレクトリ以下のファイルの曖昧検索
"   :GFiles    gitファイル曖昧検索
"   :History   過去開いたファイルの曖昧検索
"   :History:  過去実行したvimコマンドの曖昧検索
"   :Commits   commit log 確認(require fugitive.vim)

"" ファイル検索
fun! FzfOmniFiles()
    let is_git = system('git status')
    if v:shell_error
        :Files
    else
        :GitFiles
    endif
endfun
nnoremap <C-p> :call FzfOmniFiles()<CR>

"" To use fzf in Vim, add the following line.
" set rtp+=/usr/local/opt/fzf

"" 文字列検索を開く
"" <S-?>でプレビューを表示/非表示する
command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
    \ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 3..'}, 'up:60%')
    \ : fzf#vim#with_preview({'options': '--exact --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
    \ <bang>0)

nnoremap <C-g> :Rg<CR>

"" カーソル位置の単語をファイル検索する
nnoremap fr vawy:Rg <C-R>"<CR>
"" 選択した単語をファイル検索する
xnoremap fr y:Rg <C-R>"<CR>

"" Auto-Fix
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

" ESCの2回押しでハイライト消去
nnoremap <ESC><ESC> :nohl<CR>

" 空行のハイライト
augroup HighlightTrailingSpaces
    autocmd!
    autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
    autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" 行を移動
nnoremap <C-Up> "zdd<Up>"zP
nnoremap <C-Down> "zdd"zp
" 複数行を移動
vnoremap <C-Up> "zx<Up>"zP`[V`]
vnoremap <C-Down> "zx"zp`[V`]


