"""""""""""""""""""""""""""""""plug"""""""""""""""""""""""""""""""""""""""
" specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'easymotion/vim-easymotion'

Plug 'majutsushi/tagbar'

" Plug 'ctrlpvim/ctrlp.vim'

" Plug 'junegunn/limelight.vim'

" Plug 'tomasr/molokai'

Plug 'nanotech/jellybeans.vim'

" Plug 'vim-scripts/ScrollColors'

" Plug 'altercation/vim-colors-solarized'

Plug 'basilgor/vim-autotags'

" Plug 'fishy/projtags-vim' 

Plug 'scrooloose/nerdcommenter' 

Plug 'vim-scripts/mru.vim' 

" Plug 'nanotech/jellybeans.vim' 

" Plug 'vim-scripts/taglist.vim'

Plug 'junegunn/goyo.vim' 

" plug for markdown
Plug 'godlygeek/tabular'

" plug for markdown
Plug 'plasticboy/vim-markdown'

" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""""color theme """""""""""""""""""""""""""""""""""""""""""
color mycolor

"set fillchars=vert:\  

"在被分割的窗口间显示空白，便于阅读 (没看到效果)
"stl:/ : 当前窗口状态栏显示'空格' ('/'转义字符)
"stlnc:- : 非当前窗口状态栏显示---
"vert:/| : 垂直分割线为|
"fold:- : 若设置折叠功能,折叠后显示---
"set fillchars=stl:/ ,stlnc:-,vert:/|,fold:-,diff:-
"set fillchars=vert:/ ,stl:/ ,stlnc:/

"map <silent><F3> :NEXTCOLOR<cr> 
"map <silent><F2> :PREVCOLOR<cr> 


"""""""""""""""""""""""""""""""""" settings """"""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype on
filetype plugin on

set laststatus=2

set lazyredraw

" When the page starts to scroll, keep the cursor 8 lines from the top and 8 lines from the bottom
set scrolloff=12

set nowrap

set synmaxcol=2048

set nocursorline

set nocursorcolumn

let mapleader = "," 
"let mapleader="\<Space>" "前缀键，即<leader>

set expandtab "TAB替换为空格
set ts=4

set showcmd " 命令行显示输入的命令
set showmode
set ruler "标尺

set nu

set ai "设置自动缩进
set cindent "设置使用 C/C++ 语言的自动缩进方式

set shiftwidth=4 "设置自动缩进 2 个空格
set history=50 
set incsearch " 输入字符串就显示匹配点
set hlsearch

"终端类型     前景色        背景色
""term           -              -          黑白终端
"cterm        ctermfg      ctermgb        彩色终端
""gui          guifg        guibg          图形介面

hi Search  cterm=underline ctermfg=208 ctermbg=NONE


""""""""""""""""""""""""""""""""""""""""ctags and scope """""""""""""""""""""""""""""""""""""""""""""
" may custom your ctags and scope path
let g:local_ctags_path=$HOME . '/.vim/dependency/universal-ctags/bin/ctags'
let g:local_cscope_path=$HOME . '/.vim/dependency/cscope/bin/cscope'

""""""""""""""""""""""""""""""""""""""""tagbar or taglist """""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_ctags_bin = g:local_ctags_path

nmap <F8> :TagbarToggle<CR>



"""""""""""""""""""autotags""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:autotagTagsFile=".tags"

let g:autotags_ctags_exe = g:local_ctags_path 
let g:autotags_cscope_exe = g:local_cscope_path
let g:autotags_ctags_opts = "--c++-kinds=+p --fields=+iaS --extra=+q"
let g:autotags_cscope_file_extensions = ".cpp .cc .cxx .m .hpp .hh .h .hxx .c .idl"

let g:autotags_no_global = 1
let g:autotags_export_cscope_dir = 1

"""""""""""""""""""""""""""""cscope""""""""""""""""""""""""""""""""""""""""""""""""""""""
" put it in plugin auto load
" source ~/.vim/plugin/cscope_macros.vim

"""""""""""""""""""""""""""""nerdtree"""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动打开nerdtree
" autocmd vimenter * NERDTree

" show bookmark
let NERDTreeShowBookmarks=1
" close when open file
let g:NERDTreeQuitOnOpen = 0
" 打开关闭nerdtree
nmap <F7> :NERDTreeToggle<CR>         
nmap ,nf :NERDTreeFind<CR>
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'


"""""""""""""""""""mark"""""""""""""""""""""""""""""""""
nmap <unique> <silent> mm <Plug>MarkSet
vmap <unique> <silent> mm <Plug>MarkSet
nmap <unique> <silent> mr <Plug>MarkRegex
vmap <unique> <silent> mr <Plug>MarkRegex
nmap <unique> <silent> mn <Plug>MarkClear

"""""""""""""""""""""""""air line"""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"

let g:airline_theme='simple'
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

"""""""""""""""""" mru """"""""""""""""""""""""""""""""""""
map <space>m :MRU<CR>
let MRU_Use_Current_Window = 0
let MRU_Auto_Close = 1
 
"""""""""""""""""""""""""""" nerdcommenter """"""""""""""""""""""""""
let g:NERDSpaceDelims=1 "注释添加空格
nmap <silent>  <backspace> <plug>NERDCommenterToggle :call <SID>NERDComment('nx', "Toggle")<CR>
vmap <silent>  <backspace> <plug>NERDCommenterToggle :call <SID>NERDComment('nx', "Toggle")<CR>
" vmap <silent>  <backspace> <plug>NERDCommenterInvert :call <SID>NERDCommentInvert('nx', "Invert")<CR>
" nmap <silent>  <backspace> <plug>NERDCommenterInvert :call <SID>NERDCommentInvert('nx', "Invert")<CR>
  
"""""""""""""""""""""""""""""  easymotion """""""""""""""""""""""""""""
map <space> <Plug>(easymotion-prefix)
 

"""""""""""""""""""""""""""""  vim markdown """""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1
