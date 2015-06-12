""""""""""""" Hotkey """""""""""""#
"<F4>:          NERDTreeToggle<CR>
"<F8>:          BufExplorer<CR>
"<F9>:          TagbarToggle<CR>
"<F11>:         YRShow<CR> 剪切板
"<F12>:         UndotreeToggle<CR> 撤销持久化
"<Leader>f:     CtrlPMRUFiles

"CtrlP快捷键
"<c-f><c-b>     切换模式
"<c-d>          切换按全路径或文件名查找
"<c-r>          改变regexp模式
"<c-j><c-k>     下一个/上一个文件
"<c-t>          新tab打开文件
"<c-v><c-x>     新split打开文件
"<c-n><c-p>     上一个或下一个查找
"<c-y>          创建新文件和他的父目录
"<c-z>          标记文件
"<c-o>          打开标记文件

"Nerdcommenter
"<Leader>cc     最基本注释
"<Leader>cu     撤销注释
"<Leader>cm     多行注释
"<Leader>cs     性感的注释方式

"跳转
"%    跳转到相配对的括号
"gD   跳转到局部变量的定义处
"''   跳转到光标上次停靠的地方, 是两个',而不是一个"
"mx   设置书签,x只能是a-z的26个字母
"`x   跳转到书签处("`"是1左边的键)
">    增加缩进,"x>"表示增加以下x行的缩进
"<    减少缩进,"x<"表示减少以下x行的缩进
"
"{    跳到上一段的开头
"}    跳到下一段的的开头
"(    移到这个句子的开头
")    移到下一个句子的开头
"
"[[   跳转至上一个函数(要求代码块中'{'必须单独占一行)
"]]   跳转至下一个函数(要求代码块中'{'必须单独占一行)
"
"C-]  跳转至函数或变量定义处
"C-O  返回跳转前位置
"C-T  同上
"nC-T 返回跳转 n 次
"
"0    数字0,跳转至行首
"^    跳转至行第一个非空字符
"$    跳转至行尾

set nocompatible               " 关闭兼容模式
"####################################
"#"""""""""""" vundle """"""""""""""#
"####################################
filetype off                   " required!

if has("win32")
    set rtp+=$VIM\plugins\Vundle.vim
else
    set rtp+=~/.vim/bundle/vundle
endif

call vundle#begin()
" vim-scripts repos
Bundle 'gmarik/vundle'
"buffer管理
Bundle 'jlanzarotta/bufexplorer.git'
"补全
Bundle 'mattn/emmet-vim.git'
Bundle 'Shougo/neocomplete'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'Shougo/neosnippet'
Bundle 'jiangmiao/auto-pairs.git'
"Bundle  'jinja.vim'
"语法检查
Bundle 'scrooloose/syntastic.git'
"代码树
Bundle 'majutsushi/tagbar'
"增强%匹配跳转，支持HTML等
Bundle 'matchit.zip'
"快速删除配对标签
Bundle 'tpope/vim-surround.git'
"撤销持久化
if has("unix")
Bundle 'sjl/Gundo.vim.git'
elseif has("win32")
Bundle 'mbbill/undotree'
endif
"自动保存
Bundle '907th/vim-auto-save.git'
"强化搜索
Bundle 'kien/ctrlp.vim'
Bundle 'Shougo/unite.vim'
"Bundle 'Shougo/neomru.vim'
"Bundle 'yegappan/mru.git'
"文件管理器
Bundle 'scrooloose/nerdtree.git'
Bundle 'scrooloose/nerdcommenter.git'
"剪切板增强
Bundle 'YankRing.vim'
"代码对齐
Bundle 'junegunn/vim-easy-align'
"颜色代码高亮
Bundle 'chrisbra/color_highlight'
"状态栏配色
Bundle 'bling/vim-airline'
"配色
Bundle 'altercation/vim-colors-solarized.git'
"Bundle 'tomasr/molokai.git'
"Bundle 'tpope/vim-vividchalk.git'
"Bundle 'vim-scripts/tango.vim.git'
"Bundle 'desertEx'
"Bundle 'blackboard.vim'
"Bundle 'Guardian'
"Bundle 'blackboard'
"Bundle 'inkpot'
"Bundle 'chriskempson/tomorrow-theme'
"Bundle 'Lokaltog/vim-distinguished'
"Bundle 'Suave/vim-colors-guardian'
"命令行补全
"Bundle 'CmdlineComplete'
"自动创建文件夹
Bundle 'auto_mkdir'
"自动关闭标签
"Bundle 'closetag.vim'
"Bundle 'genutils'
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

"启动时自动最大化
if has("win32")
    au GUIEnter              * simalt ~x
endif
set sessionoptions+=resize   "保存窗口大小
set autoread                 "设置自动读取文件当外部文件被修改时
set nobackup                 "取消备份
set completeopt=longest,menu "关闭智能补全时的预览窗口，这样可以防止闪屏现象
set mouse=a                  "设置鼠标支持
set autochdir                "自动切换当前目录为当前文件夹所在的目录
set bsdir=buffer             "设定文件浏览器目录为当前目录
set ruler                    "状态标尺，显示当前光标位置的行号、列号，对应的整个文件的百分比
set scrolloff=5              "设定光标离窗口上下边界5行时窗口自动滚动
set keywordprg=sdcv          "英文查询词典
set cmdheight=1              "设置命令行高度为2行
set cursorline               "高亮显示当前行
set cursorcolumn             "设置光标列;高亮光标所在列
set number                   "显示行号
set wildmenu                 "命令行补全
set showmatch                "插入括号时短暂跳转到匹配的对应括号
set matchtime=3              "跳转到匹配括号的时间
set tags=ctags;               "设置ctags
set hlsearch                 "搜索出之后高亮关键词
set incsearch                "搜索时高亮关键词
set ignorecase               "搜索时忽略大小写
au BufNewFile, BufRead *.inc,*.module set filetype=php "绑定.inc为php文件
set laststatus=2             "始终显示状态栏,高度为2行
syntax enable
syntax on
filetype on
filetype plugin on    "允许使用ftplugin目录下的文件类型特定脚本
filetype indent on    "允许使用indent目录下的文件类型缩进

"" 设置配色
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized  "inkpot solarized blackboard molokai tango vividchalk desertEx wombat256mod desert murphy

"" 设置字体"
if has("win32")
    set guifont=Dejavu\ sans\ mono:h10:cANSI
    set gfw=youyuan:h10:cGB2312
else
    set guifont=Dejavu\ sans\ mono\ 10.5
"    set guifont=monaco\ 10.5
    set gfw=youyuan\ 11
endif

"###################################
"####### 快捷编辑Vimrc文件 #########
"###################################
let mapleader=","       "设置逗号','为 mapleader
let g:mapleader=","
nmap <leader>w :w<cr>

if has("win32")
    map <silent> <leader>e :e $VIM/_vimrc<cr>
    autocmd! bufwritepost .vimrc source %   "自动调用新的vimrc
else
    map <silent> <leader>e :e ~/.vimrc<cr>
    autocmd! bufwritepost .vimrc source %
endif

"##################################
"############ 编码设置 ############
"##################################
set encoding=utf-8              "默认显示的文件编码
if has("win32")
    set termencoding=gbk
endif
set fileencoding=utf-8          "新建和保存文件时使用的编码
set fileencodings=utf-8,gb2312,gbk,chinese,utf-16,gb18030,big5,latin1,ansi,ucs-bom,cp939    "此项目配置的是一个编码列表，vim在读取文件的时候，会根据这里的编码自动检测，如果检测失败则尝试下一个，直到检测成功为止。如果一直没有转换成功，则此值会为空
set helplang=cn         "中文帮助文档
set fileformat=unix
set fileformats=unix,dos,mac
set langmenu=zh_cn
"source $vimruntime/delmenu.vim  "设置中文菜单
"source $vimruntime/menu.vim
"language messages zh_cn.utf-8

"##################################
"########### 缩进设置 #############
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
map <s-tab> :bp<cr>

"##################################
"#tab configuration 快捷切换标签页#
"##################################
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
"shift tab pages
map <left> :tabp<cr>
map <right> :tabn<cr>

"###################################
"######  状态栏配色 airline  #######
"###################################
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
autocmd! bufwritepost .vimrc  AirlineRefresh
let g:airline_powerline_fonts=1
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"if has("unix")
"  let g:airline_left_sep = ''
"  let g:airline_left_alt_sep = ''
"  let g:airline_right_sep = ''
"  let g:airline_right_alt_sep = ''
"  let g:airline_symbols.branch = ''
"  let g:airline_symbols.readonly = ''
"  let g:airline_symbols.linenr = ''
"endif

"###################################
"############# nerd_tree ###########
"###################################
let nerdtreewinsize=27
nmap <F4> :NERDTreeToggle<cr>
imap <F4> <esc> :NERDTreeToggle<cr>
nn <silent><f2> :exec("nerdtree ".expand('%:h'))<cr>


"撤销持久化设置
if has("unix")
"###################################
"############# gundo ###############
"###################################
set undofile
set undodir=~/.vim/undodir
set undolevels=1000
nnoremap <F12> :GundoToggle<cr>
elseif has("win32")
"###################################
"########### UndoTree ##############
"###################################
let g:undotree_WindowLayout=4
let g:undotree_SplitWidth=30
let g:undotree_SetFocusWhenToggle=1
nnoremap <F12> :UndotreeToggle<cr>
endif

"###################################
"########### neocomplcache #########
"###################################
"note: this option must set it in .vimrc(_vimrc).  not in .gvimrc(_gvimrc)!
" disable autocomplpop.
let g:acp_enableatstartup = 0
" use neocomplete.
let g:neocomplete#enable_at_startup = 1
" use smartcase.
let g:neocomplete#enable_smart_case = 1
" set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
\ 'default' : '',
\ 'vimshell' : $home.'/.vimshell_hist',
\ 'scheme' : $home.'/.gosh_completions'
\ }
" define keyword.
if !exists('g:neocomplete#keyword_patterns')
let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" plugin key-mappings.
inoremap <expr><c-g> neocomplete#undo_completion()
inoremap <expr><c-l> neocomplete#complete_common_string()
" recommended key-mappings.
" <cr>: close popup and save indent.
inoremap <silent> <cr> <c-r>=<sid>my_cr_function()<cr>
function! s:my_cr_function()
return neocomplete#close_popup() . "\<cr>"
" for no inserting <cr> key.
"return pumvisible() ? neocomplete#close_popup() : "\<cr>"
endfunction
" <tab>: completion.
inoremap <expr><tab> pumvisible() ? "\<c-n>" :"\<tab>"
" <c-h>, <bs>: close popup and delete backword char.
inoremap <expr><c-h> neocomplete#smart_close_popup()."\<c-h>"
inoremap <expr><bs>  neocomplete#smart_close_popup()."\<c-h>"
inoremap <expr><c-y> neocomplete#close_popup()
inoremap <expr><c-e> neocomplete#cancel_popup()
" enable omni completion.
autocmd filetype css           setlocal omnifunc=csscomplete#completecss
autocmd filetype html,markdown setlocal omnifunc=htmlcomplete#completetags
autocmd filetype javascript    setlocal omnifunc=javascriptcomplete#completejs
autocmd filetype python        setlocal omnifunc=pythoncomplete#complete
autocmd filetype xml           setlocal omnifunc=xmlcomplete#completetags
" enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
let g:neocomplete#sources#omni#input_patterns = {}
endif

"##############################
"######### neosnippet #########
"##############################
" plugin key-mappings.
imap <c-k> <plug>(neosnippet_expand_or_jump)
smap <c-k> <plug>(neosnippet_expand_or_jump)
xmap <c-k> <plug>(neosnippet_expand_target)
" supertab like snippets behavior.
imap <expr><tab> neosnippet#expandable_or_jumpable() ?
\ "\<plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<c-n>" : "\<tab>"
smap <expr><tab> neosnippet#expandable_or_jumpable() ?
\ "\<plug>(neosnippet_expand_or_jump)"
\: "\<tab>"
" for snippet_complete marker.
if has('conceal')
set conceallevel=2 concealcursor=niv
endif

"###################################
"##########  Tagbar  ###############
"###################################
nmap <F9> :TagbarToggle<CR>

"###################################
"######## bufExplorer plugin #######
"###################################
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSortBy = "mru"
let g:bufExplorerSplitRight=0
let g:bufExplorerSplitVertical=1
let g:bufExplorerSplitVertSize=30
let g:bufExplorerCurrentWindow=1
let bufExplorerResize=0
"nnoremap <silent> <F8> :BufExplorerVerticalSplit<CR>
map <F8> :ToggleBufExplorer<cr>

"###################################
"############ CtrlP ################
"###################################
map <leader>f :CtrlPMRUFiles<CR>
"let g:ctrlp_map = '<leader>p'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

"###################################
"############ Unite ################
"###################################
"nnoremap <leader>f :Unite file_rec<CR>
"nnoremap <leader>f :Unite -start-insert file_rec<CR>
"let g:unite_source_history_yank_enable = 1
"nnoremap <F5> :<C-u>Unite history/yank<CR>
"nnoremap <silent> <F8> :<C-u>Unite buffer bookmark<CR>

"###################################
"###################################
"############ YankRing #############
"###################################
let g:yankring_replace_n_pkey = ''
let g:yankring_replace_n_nkey = ''
nnoremap <silent> <F11> :YRShow<CR>

"###################################
"############## MRU ################
"###################################
"set history=500
"let MRU_Max_Entries=400
"map <leader>f :MRU<CR>

"###################################
"######### color_highlight #########
"###################################
let g:auto_color=1
let g:color_x11_names=1
nmap <Leader>ch :ColorHighlight<cr>

"###################################
"######### syntastic ###############
"###################################
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_vim_auto_save = 1
let g:syntastic_loc_list_height = 5

"###################################
"######### vim-auto-save ###########
"###################################
let g:auto_save = 0
let g:auto_save_no_updatetime = 0
let g:auto_save_in_insert_mode = 0

"###################################
"######### vim-easy-align ##########
"###################################
vmap <Enter> <Plug>(EasyAlign)
nmap ga      <Plug>(EasyAlign)
