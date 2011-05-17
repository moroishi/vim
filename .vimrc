"---------------------------------------------------------------------------
" DropBox対策
"---------------------------------------------------------------------------
" ファイル操作に関する設定:
" swapファイルをまとめて置く場所
set swapfile
set directory=~/.vimswap

" backupファイルをまとめて置く場所
set backup
set backupdir=~/.vimbackup

highlight zenkakuda cterm=underline ctermfg=black guibg=black
if has('win32') && !has('gui_running')
	" win32のコンソールvimはsjisで設定ファイルを読むので、
	" sjisの全角スペースの文字コードを指定してやる
	match zenkakuda /\%u8140/
else
	match zenkakuda /　/ "←全角スペース
endif

"---------------------------------------------------------------------------
" OS毎に.vimの読み込み先を変える{{{
"---------------------------------------------------------------------------
if has('win32')
	:let $VIMFILE_DIR = 'vimfiles'
else
	:let $VIMFILE_DIR = 'vim'
endif
" ～ こっから先、~/.vimを参照する場合、代わりに、~/.$VIMFILE_DIR と書くこと!
"}}}

"---------------------------------------------------------------------------
" DropBox対策終わり
"---------------------------------------------------------------------------

"---------------------------------------------------------------------------
" プラグインの読み込み
if glob("~/." . $VIMFILE_DIR . "/*.vim") != ""
	source ~/.$VIMFILE_DIR/*.vim
endif
"---------------------------------------------------------------------------

"---------------------------------------------------------------------------
"ファイルタイプ別の設定
:filetype indent on
:filetype plugin on
"---------------------------------------------------------------------------

"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
" 検索ハイライト
set hlsearch
" インクリメンタルサーチ
set incsearch

"---------------------------------------------------------------------------
" 編集に関する設定:
"
" タブの画面上での幅
set tabstop=4
" タブをスペースに展開しない (expandtab:展開する)
set noexpandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=2
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" 日本語整形スクリプト(by. 西岡拓洋さん)用の設定
let format_allow_over_tw = 1	" ぶら下り可能幅

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set list
" どの文字でタブや改行を表示するかを設定
set listchars=tab:>_,extends:<,trail:-,eol:$
" 長い行を折り返して表示 (nowrap:折り返さない)
set nowrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
"colorscheme evening " (Windows用gvim使用時はgvimrcを編集すること)

"--------------------------------------------------------------------------

"---------------------------------------------------------------------------
" プラグインに関する設定:
let g:neocomplcache_enable_at_startup = 1
" 数字で候補を指定
let g:neocomplcache_enable_quick_match = 1
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

"ユーザ定義の辞書を指定
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'scala' : $HOME . '/.vim/dict/scala.dict',
  \ }
"---------------------------------------------------------------------------

