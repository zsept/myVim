"///////////////// plug /////////////////////////////////////////////
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

" plug color theme vim-one, not fluent enough
Plug 'rakr/vim-one'

" Initialize plugin system
call plug#end()



"/////////////////// settings ///////////////////////////////////// 
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



"///////////////////// ctags and scope///////////////////////////// 
" may custom your ctags and scope path
let g:local_ctags_path=$HOME . '/.vim/dependency/universal-ctags/bin/ctags'
let g:local_cscope_path=$HOME . '/.vim/dependency/cscope/bin/cscope'



"//////////////////// tagbar or taglist//////////////////////////// 
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = g:local_ctags_path
" let g:tagbar_left = 1                  "让tagbar在页面左侧显示，默认右边
" let g:tagbar_width = 30                "设置tagbar的宽度为30列，默认40
let g:tagbar_sort = 0                  "关闭排序,即按标签本身在文件中的位置排序
let g:tagbar_iconchars = ['▸', '▾']
" let g:tagbar_iconchars = ['+', '-']


"/////////////////////  autotags /////////////////////////////////////
" let g:autotagTagsFile=".tags"

let g:autotags_ctags_exe = g:local_ctags_path 
let g:autotags_cscope_exe = g:local_cscope_path
let g:autotags_ctags_opts = "--c++-kinds=+p --fields=+iaS --extras=+q"
let g:autotags_cscope_file_extensions = ".cpp .cc .cpp .m .hpp .hh .h .hxx .hpp .c .idl .vim"

let g:autotags_no_global = 1
let g:autotags_export_cscope_dir = 1




"/////////////////////// netrw ///////////////////////////////////////
" setting do not auto open
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1 



"////////////////////// nerdtree /////////////////////////////////////
" 自动打开nerdtree
autocmd vimenter * NERDTree
"
"Delete help information at the top
let NERDTreeMinimalUI=0
" show bookmark
let NERDTreeShowBookmarks=0
" close when open file
let g:NERDTreeQuitOnOpen=0
" 打开关闭nerdtree
nmap <F7> :NERDTreeToggle<CR>         
nmap ,nf :NERDTreeFind<CR>

" if no powerline font
" let g:NERDTreeDirArrowExpandable = '-'
" let g:NERDTreeDirArrowCollapsible = '|'




"//////////////////// mark //////////////////////////////////////// 
nmap <unique> <silent> mm <Plug>MarkSet
vmap <unique> <silent> mm <Plug>MarkSet
nmap <unique> <silent> mr <Plug>MarkRegex
vmap <unique> <silent> mr <Plug>MarkRegex
nmap <unique> <silent> mn <Plug>MarkClear




"//////////////////// air line /////////////////////////////////////
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"

" let g:airline_theme='simple'
let g:airline_theme='one'
let g:airline#extensions#tabline#enabled = 1
" if no powerline font


"////////////////////// mru //////////////////////////////////////
map <space>m :MRU<CR>
let MRU_Use_Current_Window = 0
let MRU_Auto_Close = 1


"/////////////////////// nerdcommenter///////////////////////////// 
let g:NERDSpaceDelims=1 "注释添加空格
nmap <silent>  <backspace> <plug>NERDCommenterToggle :call <SID>NERDComment('nx', "Toggle")<CR>
vmap <silent>  <backspace> <plug>NERDCommenterToggle :call <SID>NERDComment('nx', "Toggle")<CR>
" vmap <silent>  <backspace> <plug>NERDCommenterInvert :call <SID>NERDCommentInvert('nx', "Invert")<CR>
" nmap <silent>  <backspace> <plug>NERDCommenterInvert :call <SID>NERDCommentInvert('nx', "Invert")<CR>


"////////////////////// easymotion //////////////////////////////// 
map <space> <Plug>(easymotion-prefix)
 


"///////////////////// vim markdown ///////////////////////////////// 
let g:vim_markdown_folding_disabled = 1




"///////////////////////// color theme ////////////////////////////// 
set fillchars=vert:\  

"---------------theme vime-one ------------------------
" color settting for vim-one
set background=dark " for the dark version  set background=light for the light version
let g:one_allow_italics = 1 " italic for comments
colorscheme one

"////// 256 color //////
let g:airline_theme='peaksea'
set t_Co=256
call one#highlight('Normal', '', '2e2e2e', '')
call one#highlight('Search', 'FF8000', '2e2e2e', 'underline')
call one#highlight('Visual', '', '585858', 'bold')
set cursorline
" set cursorcolumn
hi cursorline     ctermfg=NONE ctermbg=236 cterm=bold
hi cursorcolumn   ctermfg=130  ctermbg=236 cterm=bold
hi CursorLineNr   ctermfg=130  ctermbg=236 cterm=bold
"////// 256 color //////

"////// termguicolors //////
" if (has("termguicolors"))
    " set termguicolors     " enable true colors support
" endif
"////// termguicolors //////

"---------------theme vime-one ------------------------














