" ============================
" Vim settings http://lambdalisue.hatenablog.com/entry/2013/06/23/071344
" ============================

" powerline

" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END


" =検索関係=
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト (2013-07-03 14:30 修正）

" =編集関係=
set shiftround          " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set infercase           " 補完時に大文字小文字を区別しない
set virtualedit=all     " カーソルを文字が存在しない部分でも動けるようにする
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=3         " 対応括弧のハイライト表示を3秒にする

"yankでクリップボードにコピー
set clipboard=unnamed,autoselect
"tabサイズを4に
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>

" バックスペースでなんでも消せるようにする
set backspace=indent,eol,start

" Swapファイル？Backupファイル？前時代的すぎ
" なので全て無効化する
set nowritebackup
set nobackup
set noswapfile

"  =表示関係=
set list                " 不可視文字の可視化
set number              " 行番号の表示
syntax on               " 構文色付け
set wrap                " 長いテキストの折り返し
set textwidth=0         " 自動的に改行が入るのを無効化
set colorcolumn=80      " その代わり80文字目にラインを入れる

" 前時代的スクリーンベルを無効化
set t_vb=
set novisualbell

" デフォルト不可視文字は美しくないのでUnicodeで綺麗に
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲

" =マクロおよびキー設定=
" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>

" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" vを二回で行末まで選択
vnoremap v $h

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)

" vim 起動時のみカレントディレクトリを開いたファイルの親ディレクトリに指定
autocmd MyAutoCmd VimEnter * call s:ChangeCurrentDir('', '')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

"evervim key-bind
nnoremap <silent> ,el :<C-u>EvervimNotebookList<CR>
nnoremap <silent> ,eT :<C-u>EvervimListTags<CR>
nnoremap <silent> ,en :<C-u>EvervimCreateNote<CR>
nnoremap <silent> ,eb :<C-u>EvervimOpenBrowser<CR>
nnoremap <silent> ,ec :<C-u>EvervimOpenClient<CR>
nnoremap ,es :<C-u>EvervimSearchByQuery<SPACE>
nnoremap <silent> ,et :<C-u>EvervimSearchByQuery<SPACE>tag:todo -tag:done -tag:someday<CR>
nnoremap <silent> ,eta :<C-u>EvervimSearchByQuery<SPACE>tag:todo -tag:done<CR>
let g:evervim_devtoken='S=s540:U=5d38737:E=15566cf842e:C=14e0f1e5538:P=1cd:A=en-devtoken:V=2:H=387585b13c72b381f597d2454a112b34'
let g:evervim_splitoption=''

"=========================
" Vim settings End
"=========================


"=========================
" NeoBundle settings
"=========================
let s:noplugin = 0
let s:bundle_root = expand('~/.vim/bundle')
let s:neobundle_root = s:bundle_root . '/neobundle.vim'
if !isdirectory(s:neobundle_root) || v:version < 702
    " NeoBundleが存在しない、もしくはVimのバージョンが古い場合はプラグインを一切
    " 読み込まない
    let s:noplugin = 1
else
    " NeoBundleを'runtimepath'に追加し初期化を行う
    if has('vim_starting')
        execute "set runtimepath+=" . s:neobundle_root
    endif
    call neobundle#begin(s:bundle_root)
    NeoBundleFetch 'Shougo/neobundle.vim'
    
    " 非同期通信を可能にする
    " 'build'が指定されているのでインストール時に自動的に
    " 指定されたコマンドが実行され vimproc がコンパイルされる
    NeoBundle "Shougo/vimproc", {
        \ "build": {
        \   "windows"   : "make -f make_mingw32.mak",
        \   "cygwin"    : "make -f make_cygwin.mak",
        \   "mac"       : "make -f make_mac.mak",
        \   "unix"      : "make -f make_unix.mak",
        \ }}

    "=追加プラグイン=
    "vim-tempate
    NeoBundle "thinca/vim-template"
    " テンプレート中に含まれる特定文字列を置き換える
    autocmd MyAutoCmd User plugin-template-loaded call s:template_keywords()
    function! s:template_keywords()
        silent! %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
    	silent! %s/<+FILENAME+>/\=expand('%:r')/g
    endfunction
    " テンプレート中に含まれる'<+CURSOR+>'にカーソルを移動
    autocmd MyAutoCmd User plugin-template-loaded
    	\   if search('<+CURSOR+>')
    	\ |   silent! execute 'normal! "_da>'
    	\ | endif 
    NeoBundle 'tpope/vim-surround'
    NeoBundle 'vim-scripts/Align'
    NeoBundle 'vim-scripts/YankRing.vim'
    NeoBundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
    NeoBundle 'tpope/vim-fugitive'
    
    "vim color scheme
    "=Neocomplete=
    " if has('lua') && v:version > 703 && has('patch825') 2013-07-03 14:30 > から >= に修正
    " if has('lua') && v:version >= 703 && has('patch825') 2013-07-08 10:00 必要バージョンが885にアップデートされていました
    if has('lua') && v:version >= 703
        NeoBundleLazy "Shougo/neocomplete.vim", {
            \ "autoload": {
            \   "insert": 1,
            \ }}
        let g:neocomplete#enable_at_startup = 1
        let s:hooks = neobundle#get_hooks("neocomplete.vim")
        function! s:hooks.on_source(bundle)
            let g:acp_enableAtStartup = 0
            let g:neocomplete#enable_smart_case = 1
            " NeoCompleteを有効化
            " NeoCompleteEnable
        endfunction
    endif

    "NeoComplete 設定
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      " return neocomplete#close_popup() . "\<CR>"
      " For no inserting <CR> key.
      return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction
    " ホップアップの数max 30
    let g:neocomplete#max_list = 30
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()

    " Close popup by <Space>.
    " inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

    "インデントの可視化
    NeoBundle "nathanaelkane/vim-indent-guides"
    let g:indent_guides_enable_on_vim_startup=1
    let g:indent_guides_start_level=2
    let g:indent_guides_auto_colors=0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=239
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=244
    let g:indent_guides_color_change_percent = 30
    let g:indent_guides_guide_size = 1
    " let g:indent_guides_enable_on_vim_startup = 1 2013-06-24 10:00 削除
    "let s:hooks = neobundle#get_hooks("vim-indent-guides")
    "function! s:hooks.on_source(bundle)
    "  let g:indent_guides_guide_size = 1
    "endfunction 
    "quickrun
    NeoBundleLazy "thinca/vim-quickrun", {
      	  \ "autoload": {
      	  \   "mappings": [['nxo', '<Plug>(quickrun)']]
      	  \ }}
    nmap <Leader>r <Plug>(quickrun)
    let s:hooks = neobundle#get_hooks("vim-quickrun")
    function! s:hooks.on_source(bundle)
      let g:quickrun_config = {
          \ "*": {"runner": "remote/vimproc"},
          \ }
    endfunction

    "jedi
    NeoBundleLazy "davidhalter/jedi-vim", {
          \ "autoload": {
          \   "filetypes": ["python", "python3", "djangohtml"],
          \ },
          \ "build": {
          \   "mac": "pip install jedi",
          \   "unix": "pip install jedi",
          \ }}
    let s:hooks = neobundle#get_hooks("jedi-vim")
    function! s:hooks.on_source(bundle)
      " jediにvimの設定を任せると'completeopt+=preview'するので
      " 自動設定機能をOFFにし手動で設定を行う
      let g:jedi#auto_vim_configuration = 0
      " 補完の最初の項目が選択された状態だと使いにくいためオフにする
      let g:jedi#popup_select_first = 0
      " quickrunと被るため大文字に変更
      let g:jedi#rename_command = '<Leader>R'
      " gundoと被るため大文字に変更 (2013-06-24 10:00 追記）
      let g:jedi#goto_assighmentd_command = '<Leader>G'
    endfunction
    "Vim-Latex
    NeoBundle "https://github.com/vim-latex/vim-latex.git"
    filetype plugin on
    filetype indent on
    set shellslash
    set grepprg=grep\ -nH\ $*
    let g:tex_flavor='latex'
    let g:Imap_UsePlaceHolders = 1
    let g:Imap_DeleteEmptyPlaceHolders = 1
    let g:Imap_StickyPlaceHolders = 0
    let g:Tex_DefaultTargetFormat = 'pdf'
    let g:Tex_MultipleCompileFormats='dvi,pdf'
    "let g:Tex_FormatDependency_pdf = 'pdf'
    let g:Tex_FormatDependency_pdf = 'dvi,pdf'
    "let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
    let g:Tex_FormatDependency_ps = 'dvi,ps'
    let g:Tex_CompileRule_pdf = 'ptex2pdf -u -l -ot "-kanji=utf8 -no-guess-input-enc -synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
    "let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
    "let g:Tex_CompileRule_pdf = 'lualatex -synctex=1-interaction=nonstopmode -file-line-error-style $*'
    "let g:Tex_CompileRule_pdf = 'luajitlatex -synctex=1-interaction=nonstopmode -file-line-error-style $*'
    "let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
    "let g:Tex_CompileRule_pdf = 'ps2pdf.exe $*.ps'
    let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
    let g:Tex_CompileRule_dvi = 'uplatex -kanji=utf8 -no-guess-input-enc -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
    let g:Tex_BibtexFlavor = 'upbibtex'
    let g:Tex_MakeIndexFlavor = 'upmendex $*.idx'
    let g:Tex_ViewRule_pdf = 'rundll32 shell32,ShellExec_RunDLL SumatraPDF -reuse-instance -inverse-search "\"' . $VIM . '\gvim.exe\" -n -c \":RemoteOpen +\%l \%f\""'
    "let g:Tex_ViewRule_pdf = 'texworks'
    "let g:Tex_ViewRule_pdf = 'rundll32 shell32,ShellExec_RunDLL firefox -new-window'
    "let g:Tex_ViewRule_pdf = 'powershell -Command "& {$p = [System.String]::Concat(''"""'',[System.IO.Path]::GetFullPath($args),''"""'');Start-Process chrome -ArgumentList (''--new-window'',$p)}"'
    "let g:Tex_ViewRule_pdf = 'pdfopen --r15 --file'
    let g:Tex_IgnoreLevel = 9 
    let g:Tex_IgnoredWarnings = 
        \"Underfull\n".
        \"Overfull\n".
        \"specifier changed to\n".
        \"You have requested\n".
        \"Missing number, treated as zero.\n".
        \"There were undefined references\n".
        \"Citation %.%# undefined\n".
        \"LaTeX Font Warning: Font shape `%s' undefined\n".
        \"LaTeX Font Warning: Some font shapes were not available, defaults substituted."

    "evervim http://gk9187.hatenablog.com/entry/2014/12/08/175751
    NeoBundle 'kakkyz81/evervim'
    
    "Unite.vim
    NeoBundleLazy "Shougo/unite.vim", {
      \ "autoload": {
      \   "commands": ["Unite", "UniteWithBufferDir"]
      \ }}
    NeoBundleLazy 'h1mesuke/unite-outline', {
      \ "autoload": {
      \   "unite_sources": ["outline"],
      \ }}


    " インストールされていないプラグインのチェックおよびダウンロード
    NeoBundleCheck
    call neobundle#end()
    "NeoBundle 'altercation/vim-colors-solarized'
    "let g:solarized_termtrans=1
    "colorscheme solarized

endif

" docstringは表示しない
autocmd FileType python setlocal completeopt-=preview

" ファイルタイププラグインおよびインデントを有効化
" これはNeoBundleによる処理が終了したあとに呼ばなければならない
filetype plugin indent on
"=========================
" NeoBundle settings End
"=========================

"solarized
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

 " Powerline
let g:Powerline_symbols = 'fancy'
" Always show statusline
set laststatus=2
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8


" Unite keybind
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <Space>u [unite]

" unite.vim keymap
let g:unite_source_history_yank_enable =1
nnoremap <silent> [unite]u :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]g :<C-u>Unite<Space>grep<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]c :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,vr :UniteResume<CR>
" vinarise
let g:vinarise_enable_auto_detect = 1 
" unite-build map
nnoremap <silent> ,vb :Unite build<CR>
nnoremap <silent> ,vcb :Unite build:!<CR>
nnoremap <silent> ,vch :UniteBuildClearHighlight<CR>
