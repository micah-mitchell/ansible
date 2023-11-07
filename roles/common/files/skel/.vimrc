

""" " ----------------------------------------------------------------------------
""" " | Vundle - Vim plugin manager
""" " | Requires Git to function
""" " | Install with: git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle.vim
""" " | Initialize plugins with: ':PluginInstall'
""" " |
""" " | Remove `""" ` from beginging of lines to enable Vundle
""" " ----------------------------------------------------------------------------
""" set nocompatible              " be iMproved, required
""" filetype off                  " required
""" 
""" " set the runtime path to include Vundle and initialize
""" set rtp+=~/.vim/bundle/Vundle.vim
""" call vundle#begin()
""" 
""" " let Vundle manage Vundle, required
""" Plugin 'VundleVim/Vundle.vim'
""" 
""" Plugin 'christoomey/vim-tmux-navigator'				" Links Tmux and Vim
""" 
""" Plugin 'unblevable/quick-scope'						" Quick line movement
""" 
""" " Nerdtree Plugins (File Explorer)
""" Plugin 'preservim/nerdtree'							" Add file explorer
""" Plugin 'Xuyuanp/nerdtree-git-plugin'				" Adds git features to NerdTree
""" Plugin 'ryanoasis/vim-devicons'						" Adds icons to NerdTree
""" Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'	" Colors icons of Devicons
""" 
""" " Theme plugins
""" Plugin 'edkolev/tmuxline.vim'
""" Plugin 'bling/vim-airline'
""" Plugin 'arcticicestudio/nord-vim'
""" call vundle#end()  
""" filetype plugin indent on     " required
""" 
""" " Brief help
""" " :PluginList          - list configured bundles
""" " :PluginInstall(!)    - install (update) bundles
""" " :PluginSearch(!) foo - search (or refresh cache first) for foo
""" " :PluginClean(!)      - confirm (or auto-approve) removal of unused bundles
""" "
""" " see :h vundle for more details or wiki for FAQ
""" " NOTE: comments after Bundle commands are not allowed.
""" " ----------------------------------------------------------------------------
""" " | End Vundle config
""" " ----------------------------------------------------------------------------

""" " ----------------------------------------------------------------------------
""" " | Vundle Plugin config
""" " |
""" " | Remove `""" ` from beginging of lines to enable Vundle Plugin config
""" " ----------------------------------------------------------------------------
""" " Configure NERDTree
""" let g:NERDTreeGitStatusShowIgnored = 1
""" let g:NERDTreeGitStatusUntrackedFilesMode = 'all'
""" let g:NERDTreeGitStatusShowClean = 1
""" 
""" " Configure Devicons
""" set encoding=UTF-8
""" 
""" 
""" " Configure Airline
""" let g:airline#extensions#tabline#enabled = 1
""" let g:airline#extensions#tabline#formatter = 'unique_tail'
""" let g:airline_powerline_fonts = 1
""" 
""" " ----------------------------------------------------------------------------
""" " | End Vundle config
""" " ----------------------------------------------------------------------------

" Lots of the following VIM config comes from (https://github.com/twerth/dotfiles/blob/master/etc/vim/vimrc)
" -----------------------------------------------------------------------------
" | VIM Settings |
" | (see gvimrc for gui vim settings) |
" | |
" | Some highlights: |
" | jj = <esc> Very useful for keeping your hands on the home row |
" | |
" | |
" | ,h = new horizontal window |
" | ,v = new vertical window |
" | |
" | ,i = toggle invisibles |
" | space bar = un-highligts search
" | |
" | F2 = toggle paste " |
" | |
" | enter and shift-enter = adds a new line after/before the current line |
" | |
" | Put machine/user specific settings in ~/.vimrc.local |
" -----------------------------------------------------------------------------


set nocompatible
set wildmenu            " enhanced tab-completion shows all matching cmds in a popup menu
set spelllang=en_gb     " real English spelling
set splitbelow          " place new files below the current

let mapleader = ","		" sets Vim command leader
imap jj <Esc> " Professor VIM says '87% of users prefer jj over esc', jj abrams disagrees
set wildignore=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.o,.DS_Store


" Tabs ************************************************************************
set sta " a <Tab> in an indent inserts 'shiftwidth' spaces

" Using 4 column tabs
set tabstop=4       " Size of hard tabstop (ts)
set shiftwidth=4    " Size of an indentation (sw)
set softtabstop=0   " Number of spaces a <Tab> counts for. When ), feature is off (sts)
set noexpandtab     " Dont uses spaces instead of a tab character (et)
set autoindent      " Copy indent from current line when starting a new line (ai)

" Use 2 spaces
"set tabstop=2
"set shiftwidth=2
"set softtabstop=2
"set expandtab


" Indenting *******************************************************************
set ai 					" Automatically set the indent of a new line (local to buffer)
set si 					" smartindent (local to buffer)
set pastetoggle=<F2>	" Disables auto-indent for multi-line pastes


" Scrollbars ******************************************************************
set sidescrolloff=2


" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

" Vertical and horizontal split then hop to a new buffer
:noremap <Leader>v :vsp^M^W^W<cr>
:noremap <Leader>h :split^M^W^W<cr>


" Colors **********************************************************************
set t_Co=256 " 256 colors
set background=dark
syntax on " syntax highlighting

" Sets color scheme to Nord (https://www.nordtheme.com/) if installed,
" otherwise sets theme to lucius (https://github.com/jonathanfilip/vim-lucius)
try
	colorscheme nord
catch /^Vim\%((\a\+)\)\=:E185/
	colorscheme lucius
endtry


" Line Numbers ****************************************************************
"set number 			" Show line numbers
set numberwidth=4	" Set width to 4 spaces
nmap <F3> :set number! number?<cr>


" Cursor highlights ***********************************************************
set cursorline
"set cursorcolumn


" Searching *******************************************************************
set hlsearch		" highlight search
set incsearch		" Incremental search, search as you type
set ignorecase		" Ignore case when searching
set smartcase		" Ignore case when searching lowercase

" space bar un-highligts search
:noremap <silent> <Space> :silent noh<Bar>echo<CR> 

" ,a to continue search throughout all
nmap <Leader>a :silent exec "while !search( @/, \"W\") \| bnext \| 0 \| endwhile"<CR>


" Status Line *****************************************************************
set showcmd
set ruler " Show ruler
"set ch=2 " Make command line two lines high
"match LongLineWarning '\%120v.*' " Error format when a line is longer than 120


" Line Wrapping ***************************************************************
set nowrap
set linebreak " Wrap at word


" Directories *****************************************************************
" Setup backup location and enable
set backupdir=~/.vim/temp/backup
set backup

" Setup Undo location and enable
set undodir=~/.vim/temp/undo
set undofile

" Set Swap directory
set directory=~/.vim/temp/swap

" Sets path to directory buffer was loaded from
"autocmd BufEnter * lcd %:p:h


" File Stuff ******************************************************************
filetype plugin indent on
" To show current filetype use: set filetype

"autocmd FileType html :set filetype=xhtml


" Insert New Line *************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>
"set fo-=r " do not insert a comment leader after an enter, (no work, fix!!)


" Sessions ********************************************************************
" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
" make vim save and load the folding of the document each time it loads"
" also places the cursor in the last place that it was left."
au BufWinLeave * mkview
au BufWinEnter * silent loadview


" Invisible characters ********************************************************
set listchars=trail:.,tab:>-,eol:$
set nolist
:noremap <Leader>i :set list!<CR> " Toggle invisible chars


" Mouse ***********************************************************************
set mouse=a " Enable the mouse
behave xterm
set selectmode=mouse
"set ttymouse=xterm


" Misc settings ***************************************************************
set backspace=indent,eol,start
set matchpairs+=<:>
set vb t_vb= " Turn off bell, this could be more annoying, but I'm not sure how
"set nofoldenable " Turn off folding



" Navigation ******************************************************************

" Make cursor move by visual lines instead of file lines (when wrapping)
"map <up> gk
"map k gk
"imap <up> <C-o>gk
"map <down> gj
"map j gj
"imap <down> <C-o>gj
"map E ge

" Omni Completion *************************************************************
autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Enables writing files with root priviledges
cmap w!! w !sudo tee % > /dev/null

" toggle colored right border after 80 chars
set colorcolumn=0
let s:color_column_old = 80


" Powerline *******************************************************************
" Setup with steps at: http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
"set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2 " Always show statusline

" -----------------------------------------------------------------------------
" | Startup |
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" | Host specific |
" -----------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

