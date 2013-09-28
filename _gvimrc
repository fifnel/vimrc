"-------------------------------------------------------------------------------
" 見た目の設定
set antialias              " アンチエイリアシング
set guioptions-=T          " ツールバー削除
if has("mac")
  set transparency=10        " 半透明
  "set guifont=Osaka-Mono:h14 " フォント
  set guifont=Ricty:h16       " フォント
endif

" OSのクリップボードを使えるようにする
set clipboard+=unnamed

" IME周りの設定
"set iminsert=0
"set imsearch=0
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
nnoremap <silent> / :set imsearch=0<CR>/
nnoremap <silent> ? :set imsearch=0<CR>?

"日本語入力中のカーソルの色
highlight CursorIM guifg=NONE guibg=Red

"-------------------------------------------------------------------------------
" ウィンドウサイズの再設定(.vimrcで効かない項目があるので再度設定する)
set sessionoptions+=resize " 行・列を設定する
set lines=48               " 行数
set columns=160            " 横幅
set cmdheight=1            " コマンドラインの高さ
set previewheight=20       " プレビューウィンドウの高さ

"-------------------------------------------------------------------------------
" タブを使う
set showtabline=2
"nnoremap <Space>t t
"nnoremap <Space>T T
nnoremap t <Nop>
nnoremap <silent> tc :<C-u>tabnew<CR>:tabmove<CR>
nnoremap <silent> tk :<C-u>tabclose<CR>
nnoremap <silent> tn :<C-u>tabnext<CR>
nnoremap <silent> tp :<C-u>tabprevious<CR>


"colorscheme desert " カラースキーム
"colorscheme jellybeans " カラースキーム
colorscheme hybrid

" vim: set ts=4 sw=4 sts=0 tw=0

