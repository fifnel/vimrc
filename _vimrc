set nocompatible

"///////////////////////////////////////////////////////////////////////////////
" vundleの読み込み設定
"///////////////////////////////////////////////////////////////////////////////

filetype off

if has('win32') || has('win64')
  set rtp+=~/My\ Documents/Dropbox/Settings/vim/vundle/vundle.git/
  set noshellslash
  call vundle#rc('~/My Documents/Dropbox/Settings/vim/vundle/plugins')
elseif has('mac')
  set rtp+=~/Dropbox/Settings/vim/vundle/vundle.git/
  call vundle#rc('~/Dropbox/Settings/vim/vundle/plugins')
elseif has('unix') && match(system('uname'),'Darwin')!=-1
  set rtp+=~/Dropbox/Settings/vim/vundle/vundle.git/
  call vundle#rc('~/Dropbox/Settings/vim/vundle/plugins')
else
  set rtp+=/mnt/hgfs/share/Settings/vim/vundle/vundle.git/
  call vundle#rc('/mnt/hgfs/share/Settings/vim/vundle/plugins')
endif

Bundle 'L9'
Bundle 'cake.vim'
Bundle 'Align'
Bundle 'cecutil'
Bundle 'fugitive.vim'
Bundle 'grep.vim'
Bundle 'incbufswitch.vim'
Bundle 'jcommenter.vim'
Bundle 'monday'
Bundle 'project.tar.gz'
Bundle 'QuickBuf'
Bundle 'snipMate'
Bundle 'surround.vim'
Bundle 'ZenCoding.vim'

Bundle 'taskpaper.vim'

Bundle 'rbgrouleff/bclose.vim'

Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler'
"Bundle 'Shougo/vimproc'
"Bundle 'Shougo/vimshell'

"Bundle 'ujihisa/vimshell-ssh'

"Bundle 'fuenor/qfixhowm'
Bundle 'qfixhowm2'

Bundle 'commentout.vim'

filetype plugin indent on


"///////////////////////////////////////////////////////////////////////////////
" カラーリングの設定
"///////////////////////////////////////////////////////////////////////////////

colorscheme desert " カラースキーム
highlight CursorLine ctermbg=black guibg=gray10   " カーソル行の色



"///////////////////////////////////////////////////////////////////////////////
" ステータスラインの表示
"///////////////////////////////////////////////////////////////////////////////

set statusline=%<    " 行が長すぎるときに切り詰める位置
set statusline+=[%n] " バッファ番号
set statusline+=%m   " %m 修正フラグ
set statusline+=%r   " %r 読み込み専用フラグ
set statusline+=%h   " %h ヘルプバッファフラグ
set statusline+=%w   " %w プレビューウィンドウフラグ
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}  " fencとffを表示
set statusline+=%y   " バッファ内のファイルのタイプ
set statusline+=\    " 空白スペース
if winwidth(0) >= 40
set statusline+=%F   " バッファ内のファイルのフルパス
else
set statusline+=%t   " ファイル名のみ
endif
set statusline+=%=   " 左寄せ項目と右寄せ項目の区切り
set statusline+=%{fugitive#statusline()}  " Gitのブランチ名を表示
set statusline+=\ \  " 空白スペース2個
set statusline+=%1l  " 何行目にカーソルがあるか
set statusline+=/
set statusline+=%L   " バッファ内の総行数
set statusline+=,
set statusline+=%3c  " 何列目にカーソルがあるか
set statusline+=%V   " 画面上の何列目にカーソルがあるか
set statusline+=\ \  " 空白スペース2個
set statusline+=%03P " ファイル内の何％の位置にあるか



"///////////////////////////////////////////////////////////////////////////////
" 基本設定
"///////////////////////////////////////////////////////////////////////////////

set scrolloff=10               " スクロール時の余白確保
set textwidth=0                " 一行に長い文章を書いていても自動折り返しをしない
set nobackup                   " バックアップ取らない
set autoread                   " 他で書き換えられたら自動で読み直す
set noswapfile                 " スワップファイル作らない
set hidden                     " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start " バックスペースでなんでも消せるように
set formatoptions=lmoq         " テキスト整形オプション，マルチバイト系を追加
set novisualbell               " ビープをならさない
set browsedir=buffer           " Exploreの初期ディレクトリ
set whichwrap=b,s,h,l,<,>,[,]  " カーソルを行頭、行末で止まらないようにする
set showmatch                  " 括弧の対応をハイライト
set modeline                   " モードラインを有効にする
set modelines=5                " モードラインの検索行数を設定

" インデント
set autoindent
set smartindent
set cindent
set tabstop=4 shiftwidth=4 softtabstop=0 " softtabstopはTabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
set noexpandtab " タブをスペースに展開しない

" 補完・履歴
set wildmenu               " コマンド補完を強化
set wildchar=<tab>         " コマンド補完を開始するキー
set wildmode=list:longest  " リスト表示
set history=1000           " コマンド・検索パターンの履歴数
set complete=.,w,b,u,t,i,k " 補完設定

" とりあえずファイルタイプと同名の辞書を設定しておく
autocmd FileType *  execute printf("setlocal dict+=~/.vim/dict/%s.dict", &filetype)


"-----------------------------------------
" 検索設定
set wrapscan   " 最後まで検索したら先頭へ戻る
set ignorecase " 大文字小文字無視
set smartcase  " 大文字ではじめたら大文字小文字無視しない
set incsearch  " インクリメンタルサーチ
set hlsearch   " 検索文字をハイライト

"選択した文字列を検索
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

"選択した文字列を置換
vnoremap /r "xy:%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>

"全体から置換
nmap rs :%s///gc<Left><Left><Left><Left>



"///////////////////////////////////////////////////////////////////////////////
" 見た目設定(CUI/GUI共通)
"///////////////////////////////////////////////////////////////////////////////

set number           " 行番号表示

set showcmd          " コマンドをステータス行に表示
set cmdheight=1      " コマンドラインの高さ

set laststatus=2     " 常にステータスラインを表示

set previewheight=20 " プレビューウィンドウの高さ
set splitbelow       " 横分割したら新しいウィンドウは下に
set splitright       " 縦分割したら新しいウィンドウは右に

set list             " 不可視文字表示
set listchars=tab:>.,trail:_,extends:>,precedes:< " 不可視文字の表示形式
set display=uhex     " 印字不可能文字を16進数で表示

" 全角スペースをハイライト
if has("syntax")
    syntax on
    function! ActivateInvisibleIndicator()
        syntax match InvisibleJISX0208Space "　" display containedin=ALL
        highlight InvisibleJISX0208Space term=underline ctermbg=Gray guibg=Gray
    endf
    augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
    augroup END
endif

" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END



"///////////////////////////////////////////////////////////////////////////////
" 基本キーマップ設定
"///////////////////////////////////////////////////////////////////////////////

let mapleader = ","            " キーマップリーダー

" 行単位で移動(1行が長い場合に便利)
nnoremap <silent> j gj
nnoremap <silent> k gk

" CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" 検索などで飛んだらそこを真ん中に
nmap <silent> n nzz
nmap <silent> N Nzz
nmap <silent> * *zz
nmap <silent> # #zz
nmap <silent> g* g*zz
nmap <silent> g# g#zz
nmap <silent> G Gzz

" usキーボードで使いやすく
nnoremap ; :
nnoremap : ;

" insert中のカーソル移動＆C-hが死ぬので変わりをマップ
"inoremap <silent> <C-h> <left>
"inoremap <silent> <C-j> <down>
"inoremap <silent> <C-k> <up>
"inoremap <silent> <C-l> <right>
inoremap <silent> <C-d> <delete>

"Escの2回押しでハイライト消去
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

" 縦に連番入力
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor



"///////////////////////////////////////////////////////////////////////////////
" エンコーディング関連
"///////////////////////////////////////////////////////////////////////////////

" 改行文字
set ffs=unix,dos,mac

" デフォルトエンコーディング
set   encoding=utf-8

if has('win32') && has('kaoriya')
  set   ambiwidth=auto
else
  set   ambiwidth=double
endif

if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'

  if iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213,euc-jp'
    let s:enc_jis = 'iso-2022-jp-3'
  endif

  set   fileencodings&
  let &fileencodings = &fileencodings.','.s:enc_jis.',cp932,'.s:enc_euc

  unlet s:enc_euc
  unlet s:enc_jis
endif

if has('win32unix')
  set   termencoding=cp932
endif



"///////////////////////////////////////////////////////////////////////////////
" プラグインごとの設定
"///////////////////////////////////////////////////////////////////////////////

" --------------------------------------------
" migemo.vim
if has('migemo')
  set migemo
  set migemodict=/opt/local/share/migemo/utf-8/migemo-dict " TODO パスを再検討
endif

" --------------------------------------------
" grep.vim
" :Gb <args> でGrepBufferする
command! -nargs=1 Gb :GrepBuffer <args>
" カーソル下の単語をGrepBufferする
nnoremap <C-g><C-b> :<C-u>GrepBuffer<Space><C-r><C-w><Enter>

" --------------------------------------------
" neocomplcache.vim
let g:neocomplcache_enable_at_startup = 1
let g:NeoComplCache_SmartCase = 1
let g:NeoComplCache_EnableCamelCaseCompletion = 1
let g:NeoComplCache_EnableUnderbarCompletion = 1
let g:NeoComplCache_MinSyntaxLength = 4
let g:NeoComplCache_SkipInputTime = '0.1'
let g:NeoComplCache_ManualCompletionStartLength = 3
let g:NeoComplCache_DisableAutoComplete = 0
let g:NeoComplCache_EnableSkipCompletion = 1
let g:NeoComplCache_SkipCompletionTime = '0.2'
inoremap <expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
inoremap <expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
inoremap <expr><CR> pumvisible() ? "\<C-y>\<CR>X\<BS>" : "\<CR>X\<BS>"
noremap <silent> <C-e> :NeoComplCacheToggle<CR>

" --------------------------------------------
" unite.vim
nnoremap <silent> <Leader>ub :<C-u>UniteWithBufferDir -buffer-name=files -prompt=%\ buffer file_mru bookmark file<CR>
nnoremap <silent> <Leader>ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Leader>uo :<C-u>Unite outline<CR>
nnoremap <silent> <Leader>um :<C-u>Unite file_mru<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
" Overwrite settings.

nmap <buffer> <ESC> <Plug>(unite_exit)
imap <buffer> jj <Plug>(unite_insert_leave)
imap <buffer> <C-w> <Plug>(unite_delete_backward_path)

" <C-l>: manual neocomplcache completion.
inoremap <buffer> <C-l> <C-x><C-u><C-p><Down>

" Start insert.
"let g:unite_enable_start_insert = 1
endfunction"}}}

let g:unite_source_file_mru_limit = 200
let g:unite_cursor_line_highlight = 'TabLineSel'
let g:unite_abbr_highlight = 'TabLine'

" For optimize.
let g:unite_source_file_mru_filename_format = ''

" --------------------------------------------
" vimfiler.vim
nnoremap <silent> <Leader>. :VimFiler<CR>
let g:vimfiler_sort_type = 'T'

" WriteRoomの書き込み先
if has('win32') || has('win64')
nnoremap <silent> fw :VimFiler ~/My\ Documents//Dropbox/Documents/PlainText/<CR>
else
nnoremap <silent> fw :VimFiler ~/Dropbox/Documents/PlainText/<CR>
endif



" --------------------------------------------
" qfixhowm.vim
let QFixHowm_Key                        = ','
if has('win32') || has('win64')
  let g:howm_dir                        = '~/My Documents/howm'
  let g:howm_keywordfile                  = '~/My Documents/howm/.howm-keys'
  let g:mygrepprg                         = 'c:/gnuwin32/bin/grep'
elseif has('mac')
  let g:howm_dir                        = '~/Documents/howm-vim/'
  let g:howm_keywordfile                  = '~/Documents/howm-vim/.howm-keys'
  let g:mygrepprg                         = '/usr/bin/grep'
elseif has('unix') && match(system('uname'),'Darwin')!=-1
  let g:howm_dir                        = '~/Documents/howm-vim/'
  let g:howm_keywordfile                  = '~/Documents/howm-vim/.howm-keys'
  let g:mygrepprg                         = '/usr/bin/grep'
else
  let g:howm_dir                        = '~/Documents/howm-vim/'
  let g:howm_keywordfile                  = '~/Documents/howm-vim/.howm-keys'
  let g:mygrepprg                         = '/bin/grep'
endif
let g:howm_filename                     = '%Y/%m/%Y-%m-%d-%H%M%S.howm'
let g:howm_fileencoding                 = 'utf-8'
let g:howm_fileformat                   = 'unix'
let g:MyGrep_ShellEncoding              = 'utf-8'
let g:QFixHowm_RecentDays               = 10
let g:QFixHowm_SaveTime                 = 2
let g:QFixHowm_RecentMode               = 2
let g:QFixHowm_Replace_Title_Pattern    = '^=\s*\(\[[:a-zA-Z0-9 ]*\]\s*\)\=$'
let g:QFixHowm_Replace_Title_Len        = 64

" --------------------------------------------
" modeliner.vim
let g:Modeliner_format = 'fenc= ts= sts= sw= tw= ft='

" --------------------------------------------
" qbuf.vim
let g:qb_hotkey="<space><space>"

" --------------------------------------------
" bclose.vim
let bclose_multiple = 1



"///////////////////////////////////////////////////////////////////////////////
" ユーティリティ
"///////////////////////////////////////////////////////////////////////////////

" vimgrepにいちいち|cwをつけるのがめんどくさい
autocmd QuickfixCmdPost vimgrep cw

" .vimrc読み込み後に余計なオプションが付加されてしまうので
" (コメントの行頭文字を勝手に入れるやつをOFF)
autocmd FileType * set formatoptions-=ro

" ファイルを開いた場所をカレントディレクトリにする
autocmd BufEnter *   execute ":lcd " . expand("%:p:h")

" vim: set ts=4 sw=4 sts=0 tw=0

