"""""""""""""""""""""""""""""""plug"""""""""""""""""""""""""""""""""""""""
" specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'easymotion/vim-easymotion'

Plug 'majutsushi/tagbar'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'junegunn/limelight.vim'

Plug 'tomasr/molokai'

Plug 'vim-scripts/ScrollColors'

Plug 'altercation/vim-colors-solarized'

Plug 'inkarkat/vim-mark'

Plug 'basilgor/vim-autotags'

Plug 'fishy/projtags-vim' 

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""""""""""tagbar"""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>


" -----------------------------------------------------------------------------  
"  < 判断操作系统是否是 Windows 还是 Linux >  
" -----------------------------------------------------------------------------  
let g:isWindows = 0  
let g:isLinux = 0  
if(has("win32") || has("win64") || has("win95") || has("win16"))  
    let g:isWindows = 1  
else  
    let g:isLinux = 1  
endif  
   
" -----------------------------------------------------------------------------  
"  < 判断是终端还是 Gvim >  
" -----------------------------------------------------------------------------  
if has("gui_running")  
    let g:isGUI = 1  
else  
    let g:isGUI = 0  
endif  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if (g:isWindows)
	"VIMRUNTIME C:\zseptVim\vim80
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin

	set diffexpr=MyDiff()
	function! MyDiff()
		let opt = '-a --binary '
		if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
		if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
		let arg1 = v:fname_in
		if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
		let arg2 = v:fname_new
		if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
		let arg3 = v:fname_out
		if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
		if $VIMRUNTIME =~ ' '
			if &sh =~ '\<cmd'
				if empty(&shellxquote)
					let l:shxq_sav = ''
					set shellxquote&
				endif
				let cmd = '"' . $VIMRUNTIME . '\diff"'
			else
				let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
			endif
		else
			let cmd = $VIMRUNTIME . '\diff'
		endif
		silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
		if exists('l:shxq_sav')
			let &shellxquote=l:shxq_sav
		endif
	endfunction
endif
""""""""""""""""""""""""""""""""""color theme """""""""""""""""""""""""""""""""""""""""""
color molokai
let g:molokai_original = 1
let g:rehash256 = 1

set fillchars=vert:' 

"在被分割的窗口间显示空白，便于阅读 (没看到效果)
"stl:/ : 当前窗口状态栏显示'空格' ('/'转义字符)
"stlnc:- : 非当前窗口状态栏显示---
"vert:/| : 垂直分割线为|
"fold:- : 若设置折叠功能,折叠后显示---
"set fillchars=stl:/ ,stlnc:-,vert:/|,fold:-,diff:-
"set fillchars=vert:/ ,stl:/ ,stlnc:/

"map <silent><F3> :NEXTCOLOR<cr> 
"map <silent><F2> :PREVCOLOR<cr> 


"""""""""""""""""""""""""""""""""" start """"""""""""""""""""""""""""""""""""""""""""""""
" 启动全屏
if has('win32')    
	au GUIEnter * simalt ~x
else    
	au GUIEnter * call MaximizeWindow()
endif 

function! MaximizeWindow()    
	silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

" 编码，字体
if has("gui_running")
	"set guifont=Consolas:h12
    "set guifontwide=SimSun-ExtB:h12
    set enc=utf-8 " 编码设置
	set fileencodings=utf-8,latin-1,ucs-bom,cp936
	if has("win32")
		set fileencoding=utf-8
	else
		set fileencoding=utf-8
	endif
	"解决菜单乱码
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
	"解决consle输出乱码
	"language messages zh_CN.utf-8
endif

" 启动目录
" cd C:\AndroidStudioProject


" 隐藏菜单，工具栏，滚动条
if has("gui_running")
	set guioptions-=m " 隐藏菜单
	set guioptions-=T " 隐藏工具栏
	set guioptions-=L " 隐藏左侧滚动条
	set guioptions-=r " 隐藏右侧滚动条
	set guioptions-=b " 隐藏底部滚动条
	set showtabline=0 " 隐藏Tab栏

	nmap <F1> :if &guioptions=~#'m'<Bar>set guioptions-=m<Bar>else<Bar>set guioptions+=m<Bar>endif<CR>
	nmap <F2> :if &guioptions=~#'T'<Bar>set guioptions-=T<Bar>else<Bar>set guioptions+=T<Bar>endif<CR>
	"nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
endif


"""""""""""""""""""""""""""""""""" settings """"""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype on
filetype plugin on

let mapleader = "," 
"let mapleader="\<Space>" "前缀键，即<leader>

set expandtab "TAB替换为空格
set ts=4

set showcmd " 命令行显示输入的命令
set showmode
set ruler "标尺

set nu
set incsearch " 输入字符显示匹配点

set ai "设置自动缩进
set cindent "设置使用 C/C++ 语言的自动缩进方式

set shiftwidth=2 "设置自动缩进 2 个空格
set history=50 
set incsearch " 输入字符串就显示匹配点
"set hlsearch


"""""""""""""""""""ctags""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=./tags;,tags

if (g:isWindows)
  function! SeptCtagsCscopeInit()
    let g:curPath = getcwd()
    echo "current path: " g:curPath 
    !dir /s /b *.c *.h *cpp *.hpp *.java > cscope.files
    !cscope -Rbkq 
    !ctags -R getcwd()
  endfunction  

  function! SeptSetRootPath()
  endfunction  

  function! SeptAddSubPath()
  endfunction

  function! SeptDeleteAllTags()
  endfunction

  function! SeptDeleteSubPath()
  endfunction

  function! SeptShowAllPath()
  endfunction

  function! SeptUpdateAllTags()
  endfunction

  command! SeptCtagsCscopeInit :call SeptCtagsCscopeInit()
  command! SeptUpdateAllTags :call SeptUpdateAllTags()

  nnoremap <silent> <F3> :SeptCtagsCscopeInit<CR>
  nnoremap <silent> <F4> :SeptUpdateAllTags<CR>
endif

"""""""""""""""""""autotags""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:autotagTagsFile=".tags"

"""""""""""""""""""""""""""""cscope""""""""""""""""""""""""""""""""""""""""""""""""""""""
"source $VIMRUNTIME/plugin/cscope_macros.vim

"""""""""""""""""""""""""""""taglist"""""""""""""""""""""""""""""""""""""""""""""""""""""
"打开关闭taglist

  " nnoremap <silent> <F8> :TlistToggle<CR>
  "let Tlist_Ctags_Cmd = "C:\zseptVim\zsept_vim_files\ctags58\ctags.exe"  "设置ctags命令的位置 

"""""""""""""""""""""""""""""nerdtree"""""""""""""""""""""""""""""""""""""""""""""""""""""
"打开关闭nerdtree
map <F7> :NERDTreeToggle<CR>         
nnoremap ,nf :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
let Tlist_Enable_Fold_Column  = 0      "taglist 层级数目(左侧)

"""""""""""""""""""BufExplorer""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:bufExplorerDefaultHelp=1       " Do not show default help.
"let g:bufExplorerShowRelativePath=1  " Show relative paths.
"let g:bufExplorerSortBy='mru'        " Sort by most recently used.
"let g:bufExplorerSplitRight=0        " Split left.
"let g:bufExplorerSplitVertical=1     " Split vertically.
"let g:bufExplorerSplitVertSize = 40  " Split width
"let g:bufExplorerUseCurrentWindow=0  " Open in new window.
"let g:bufExplorerSplitHorzSize=15

"map <leader> m  :BufExplorer<CR>
"autocmd BufWinEnter \[Buf\ List\] setl nonumber 
"nnoremap <script> <silent> <unique> <space>m :BufExplorerHorizontalSplit<CR>

" -----------------------------------------------------------------------------  
"  < gvimfullscreen 工具配置 > 请确保已安装了工具  
" -----------------------------------------------------------------------------  
" 用于 Windows Gvim 全屏窗口，可用 F11 切换  
" 全屏后再隐藏菜单栏、工具栏、滚动条效果更好  
if (g:isWindows && g:isGUI)  
    nmap <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>  
endif

"------------------------------------------------------------------------------------
"let MRU_File = 'c:\Temp\_vim_mru_files'
"let MRU_Max_Entries = 1000
"let MRU_Exclude_Files = '^c:\\Temp\\.*'           " For MS-Windows
"let MRU_Window_Height = 10
"let MRU_Use_Current_Window = 0
"let MRU_Max_Submenu_Entries = 15
"let MRU_Max_Menu_Entries = 20
"let MRU_Add_Menu = 1
"let MRU_Auto_Close = 1
" map <space>m :MRU<CR>

"""""""""""""""""""mark"""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""air line"""""""""""""""""""""""""
let g:airline_theme='simple'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"set guifont=Consolas:h14 
"set guifontwide=Consolas:h14 
"set guifontwide=Droid_Sans_Mono_Slashed_for_Pow:h14:cANSI:qDRAFT
"set guifont=Droid_Sans_Mono_Slashed_for_Pow:h14:cANSI:qDRAFT
"set guifont=Source_Code_Pro_for_Powerline:h14:cANSI:qDRAFT

"""""""""""""""""""ctrlp"""""""""""""""""""""""""""""""""
map <space>m :CtrlPMRU<CR>
map <space>p :CtrlP<CR>













