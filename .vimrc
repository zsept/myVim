"""""""""""""""""""""""""""""""plug"""""""""""""""""""""""""""""""""""""""
" specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'majutsushi/tagbar'

Plug 'scrooloose/nerdcommenter' 

Plug 'vim-scripts/mru.vim' 

Plug 'junegunn/goyo.vim' 

" plug for markdown
Plug 'godlygeek/tabular'

" plug for markdown
Plug 'plasticboy/vim-markdown'

" plug color theme vim-one
Plug 'rakr/vim-one'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()



"""""""""""""""""""""""""""""""""" settings """"""""""""""""""""""""""""""""""""""""""""""""
syntax on
" syntax enable
filetype on
filetype plugin on

set encoding=utf-8
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

set hlsearch " / 搜索高亮



" resize relative
" :resize +3
" :resize -3
" :vertical resize -3
" :vertical resize +3



""""""""""""""""""""""""""""""""""""""""ctags and scope """""""""""""""""""""""""""""""""""""""""""""
" may custom your ctags and scope path
let g:local_ctags_path=$HOME . '/.vim/dependency/universal-ctags/bin/ctags'
let g:local_cscope_path=$HOME . '/.vim/dependency/cscope/bin/cscope'



""""""""""""""""""""""""""""""""""""""""tagbar or taglist """""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_ctags_bin = g:local_ctags_path
nmap <F8> :TagbarToggle<CR>




""""""""""""""""""""""""""""""""""""""autotags""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:autotagTagsFile=".tags"

let g:autotags_ctags_exe = g:local_ctags_path 
let g:autotags_cscope_exe = g:local_cscope_path
let g:autotags_ctags_opts = "--c++-kinds=+p --fields=+iaS --extras=+q"
let g:autotags_cscope_file_extensions = ".cpp .cc .cpp .m .hpp .hh .h .hxx .hpp .c .idl .vim"

let g:autotags_no_global = 1
let g:autotags_export_cscope_dir = 1




"""""""""""""""""""""""""""""""""""""""""""netrw"""""""""""""""""""""""""""""""""""""""""""""""""""""
" setting do not auto open
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1 



""""""""""""""""""""""""""""""""""""""""nerdtree"""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动打开nerdtree
autocmd vimenter * NERDTree
"
"Delete help information at the top
" let NERDTreeMinimalUI=1
" show bookmark
let NERDTreeShowBookmarks=1
" close when open file
let g:NERDTreeQuitOnOpen=0
" 打开关闭nerdtree
nmap <F7> :NERDTreeToggle<CR>         
nmap ,nf :NERDTreeFind<CR>
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""mark"""""""""""""""""""""""""""""""""
nmap <unique> <silent> mm <Plug>MarkSet
vmap <unique> <silent> mm <Plug>MarkSet
nmap <unique> <silent> mr <Plug>MarkRegex
vmap <unique> <silent> mr <Plug>MarkRegex
nmap <unique> <silent> mn <Plug>MarkClear




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""air line"""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"

" let g:airline_theme='simple'
let g:airline_theme='one'
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'


"""""""""""""""""""""""""""""""""""""""""""""""""""" mru """"""""""""""""""""""""""""""""""""
map <space>m :MRU<CR>
let MRU_Use_Current_Window = 0
let MRU_Auto_Close = 1


""""""""""""""""""""""""""""""""""""""""""""""""""" nerdcommenter """"""""""""""""""""""""""
let g:NERDSpaceDelims=1 "注释添加空格
nmap <silent>  <backspace> <plug>NERDCommenterToggle :call <SID>NERDComment('nx', "Toggle")<CR>
vmap <silent>  <backspace> <plug>NERDCommenterToggle :call <SID>NERDComment('nx', "Toggle")<CR>
" vmap <silent>  <backspace> <plug>NERDCommenterInvert :call <SID>NERDCommentInvert('nx', "Invert")<CR>
" nmap <silent>  <backspace> <plug>NERDCommenterInvert :call <SID>NERDCommentInvert('nx', "Invert")<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""  easymotion """""""""""""""""""""""""""""
map <space> <Plug>(easymotion-prefix)
 


"""""""""""""""""""""""""""""""""""""""""""""""  vim markdown """""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1




""""""""""""""""""""""""""""""""""color theme """""""""""""""""""""""""""""""""""""""""""
set fillchars=vert:\  
"set fillchars=vert:\  
"在被分割的窗口间显示空白，便于阅读 (没看到效果)
"stl:/ : 当前窗口状态栏显示'空格' ('/'转义字符)
"stlnc:- : 非当前窗口状态栏显示---
"vert:/| : 垂直分割线为|
"fold:- : 若设置折叠功能,折叠后显示---
"set fillchars=stl:/ ,stlnc:-,vert:/|,fold:-,diff:-
"set fillchars=vert:/ ,stl:/ ,stlnc:/

" color settting for vim-one
set background=dark " for the dark version  set background=light for the light version
let g:one_allow_italics = 1 " italic for comments
colorscheme one
if (has("termguicolors"))
    set termguicolors     " enable true colors support
endif

hi clear Search
call one#highlight('Search', 'eec900', '', 'underline')





















