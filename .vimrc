""""""""""""" Hotkey """""""""""""#
" <leader>f :MRU 最近打开的文件
" <leader>fenc <ESC>:FencAutoDetect<CR> 自动识别文件编码
" <leader>m :TMiniBufExplorer<CR> 弃,airline a替
" <F4> :NERDTreeToggle<CR>
" <F8> :BufExplorer<CR>
" <F9> :TagbarToggle<CR>
" <F11> :YRShow<CR> 剪切板
" <F12> :GundoToggle<CR> 撤销持久化
"
"
"
"##################################
"####################################
"#"""""""""""" vundle """"""""""""""#
"####################################
"
set nocompatible               " be iMproved
filetype off                   " required!
if has("win32")
    set rtp+=d:\vim74\plugins\Vundle.vim
else
    set rtp+=~/.vim/bundle/vundle
endif

call vundle#begin()
" vim-scripts repos
Bundle 'gmarik/vundle'
"Bundle 'mbbill/FencView'
"buffer管理
Bundle 'bufexplorer.zip'
"补全
Bundle 'mattn/emmet-vim'
"Bundle 'Shougo/neocomplcache.vim'
Bundle 'Shougo/neocomplete'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'jiangmiao/auto-pairs.git'
"Bundle  'jinja.vim'
"文件操作
Bundle 'sjl/Gundo.vim.git'
"Bundle 'taglist.vim'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
"Bundle 'Shougo/unite.vim'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'matchit.zip'
Bundle 'vim-scripts/mru.vim.git'
Bundle 'YankRing.vim'
"颜色代码高亮
Bundle 'chrisbra/color_highlight'
"状态栏配色
Bundle 'bling/vim-airline'
"配色
"Bundle 'tpope/vim-vividchalk.git'
Bundle 'tomasr/molokai.git'
Bundle 'desertEx'
"Bundle 'blackboard.vim'
"Bundle 'vim-scripts/tango.vim.git'
"Bundle 'Guardian'
"Bundle 'blackboard'
Bundle 'altercation/vim-colors-solarized.git'
"Bundle 'inkpot'
"Bundle 'chriskempson/tomorrow-theme'
"Bundle 'Lokaltog/vim-distinguished'
"Bundle 'Suave/vim-colors-guardian'

"其他
"Bundle 'L9'
"Bundle 'FuzzyFinder'
Bundle 'CmdlineComplete'
Bundle 'auto_mkdir'
"Bundle 'JavaScript-syntax'
Bundle 'closetag.vim'
"Bundle 'genutils'
Bundle 'vimcdoc'
call vundle#end()

if has("gui_running")
    set guioptions-=m   "关闭按钮栏
    set guioptions-=T   "关闭工具栏
    set guioptions-=l   "关闭左侧滚动条
    set guioptions-=r   "关闭右侧滚动条
    set guioptions-=b   "关闭底部滚动条
    set guioptions-=L
    set guioptions-=R
endif

set sessionoptions+=resize    "保存窗口大小
set autoread        "设置自动读取文件当外部文件被修改时
set nobackup        "取消备份
set completeopt=longest,menu    "关闭智能补全时的预览窗口，这样可以防止闪屏现象
set mouse=a         "设置鼠标支持
set autochdir       "自动切换当前目录为当前文件夹所在的目录
set bsdir=buffer    "设定文件浏览器目录为当前目录
set ruler           "状态标尺，显示当前光标位置的行号、列号，对应的整个文件的百分比
set scrolloff=5     "设定光标离窗口上下边界5行时窗口自动滚动
set keywordprg=sdcv "英文查询词典
set cmdheight=2     "设置命令行高度为2行
set cursorline      "高亮显示当前行
set cursorcolumn    "设置光标列;高亮光标所在列
set number          "显示行号
set wildmenu        "命令行补全
set showmatch       "插入括号时短暂跳转到匹配的对应括号
set matchtime=3     "跳转到匹配括号的时间
set tags=tags;      "设置ctags
set ai
set si
set hlsearch    "搜索出之后高亮关键词
set incsearch   "搜索时高亮关键词
set ignorecase  "搜索时忽略大小写
au BufNewFile, BufRead *.inc,*.module set filetype=php  "绑定.inc为php文件
set laststatus=2    "始终显示状态栏,高度为2行
syntax enable
"syntax on
filetype on
filetype plugin on    "允许使用ftplugin目录下的文件类型特定脚本
filetype indent on    "允许使用indent目录下的文件类型缩进

"" 设置配色
set t_Co=256
set background=dark
colorscheme solarized  "inkpot solarized blackboard molokai tango vividchalk desertEx wombat256mod desert murphy

""状态栏配色 airline"
let g:airline#extensions#tabline#enabled = 1

"" 设置字体"
if has("win32")
    set guifont=Dejavu\ sans\ mono:h10:cANSI
    "set gfw=simsun:h10:cGB2312
else
    set guifont=Dejavu\ sans\ mono\ 10.5
"    set guifont=monaco\ 10.5
    set gfw=youyuan\ 11
endif

""工作目录"
" if has("win32")
"     cd e:/workspace
" else
"     cd /var/www
" endif

"###################################
"#"""""" 快捷编辑Vimrc文件 """"""""#
"###################################
let mapleader=","       "设置逗号','为 mapleader
let g:mapleader=","
nmap <leader>w :w<cr>

if has("win32")
    map <silent> <leader>e :e $VIM/_vimrc<cr>
    autocmd! bufwritepost _vimrc source %   "自动调用新的vimrc
    "快速编辑windows hosts文件
    map <silent> <leader>host :e C:/windows/system32/drivers/etc/hosts<cr> 
else
    map <silent> <leader>e :e ~/.vimrc<cr>
    autocmd! bufwritepost .vimrc source %
endif



"##################################
"#""""""""""" 编码设置 """""""""""#
"##################################
set encoding=utf-8              "默认显示的文件编码
if has("win32")
    set termencoding=gbk
endif
set fileencoding=utf-8          "新建和保存文件时使用的编码
set fileencodings=utf-8,gb2312,gbk,chinese,utf-16,gb18030,big5,latin1,ANSI,ucs-bom,cp939    "此项目配置的是一个编码列表，Vim在读取文件的时候，会根据这里的编码自动检测，如果检测失败则尝试下一个，直到检测成功为止。如果一直没有转换成功，则此值会为空
set helplang=cn         "中文帮助文档
set fileformat=unix
set fileformats=unix,dos,mac
set langmenu=zh_CN
source $VIMRUNTIME/delmenu.vim  "设置中文菜单
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8
"##################################
"#"""""""""" 缩进设置 """"""""""""#
"##################################
"将tab 转化为4个空白字符
set softtabstop=4
set expandtab
set tabstop=4
set shiftwidth=4
set cindent
set autoindent      "自动缩进
set smartindent     "智能对齐方式
set backspace=2     "使用退格键正常处理indent 、eol、start等
set whichwrap+=<,>,h,l  "允许退格键、光标键跨越行边界
set wrap            "自动换行
set linebreak       "整词换行
"##################################
"#### buffer 切换
"##################################
map <tab> :bn<cr>
map <S-tab> :bp<cr>
"##################################
"#Tab configuration 快捷切换标签页#
"##################################
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
"shift tab pages
map <Left> :tabp<cr>
map <Right> :tabn<cr>
"###################################
"#"""""""""fencview.vim""""""""""""#
"#"""""""自动识别文件编码""""""""""#
"###################################
"nmap <leader>fenc <ESC>:FencAutoDetect<CR>
"let g:fencview_autodetect = 1       "打开文件时自动识别编码
"let g:fencview_checklines = 10      "检查先后10行来判断编码
"###################################
"#"""""""""""" NERD_tree """"""""""#
"###################################
let NERDTreeWinSize=27
nmap <F4> :NERDTreeToggle<cr>
imap <F4> <ESC> :NERDTreeToggle<cr>
nn <silent><F2> :exec("NERDTree ".expand('%:h'))<CR>
"###################################
"#"""""""""""" Gundo """"""""""""""#
"###################################
"撤销持久化设置
set undofile
set undodir=~/.vim/undodir
set undolevels=1000
nnoremap <F12> :GundoToggle<CR>
"###################################
"#"""""""""" neocomplcache """"""""#
"###################################
"let g:acp_enableAtStarup = 0
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()
"##################################
""""""""""" neocomplete """""""""""
"##################################
"let g:acp_enableAtStartup = 0
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#enable_smart_case = 1
"let g:neocomplete#sources#syntax#main_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"autocmd Filetype python setlocal omnifunc=pythoncomplete#Complete
"autocmd Filetype html,markdown setlocal omnifunc=htmlcomplete#Complete
"
"if !exists('g:neocomplete#sources#omni#input_patterns')
"    let g:neocomplete#sources#omni#input_patterns = {}
"endif
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
\ 'default' : '',
\ 'vimshell' : $HOME.'/.vimshell_hist',
\ 'scheme' : $HOME.'/.gosh_completions'
\ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
return neocomplete#close_popup() . "\<CR>"
" For no inserting <CR> key.
"return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1
" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1
" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"##############################
"######### neosnippet #########
"##############################
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
" For snippet_complete marker.
if has('conceal')
set conceallevel=2 concealcursor=niv
endif

"###################################
"##########  Tagbar  ###############
"###################################
nmap <F9> :TagbarToggle<CR>

"###################################
"#""""""" bufExplorer plugin """"""#
"###################################
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSortBy = "mru"
let g:bufExplorerSplitRight=0
let g:bufExplorerSplitVertical=1
let g:bufExplorerSplitVertSize=30
let g:bufExplorerCurrentWindow=1
let bufExplorerResize=0
map <F8> :BufExplorer<cr>

"###################################
"############ CtrlP  ###############
"###################################
let g:ctrlp_map = ',,'

"###################################
"#""""""""""" YankRing """"""""""""#
"###################################
nnoremap <silent> <F11> :YRShow<CR>

"###################################
"#""""""""""""" MRU """""""""""""""#
"###################################
set history=500
let MRU_Max_Entries=400
map <leader>f :MRU<CR>

"###################################
"#"""""""" color_highlight """"""""#
"###################################
let g:auto_color=1
let g:color_x11_names=1
nmap <Leader>ch :ColorHighlight<cr>
