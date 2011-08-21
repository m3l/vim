" Author: Melvin Torrens
" Email: melvin.torrens@gmail.com
" File: .vimrc
"
" Pathogen
"
filetype off                        " Prevent interference with pathogen
source ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()              " Load bundles
"
" Prefered defaults
"
filetype plugin indent on           " Filetype indent and plugin detect
set nocompatible                    " Default to Vim features
set nomodeline                      " Disable modelines for security
set backupdir=~/.vim-tmp            " Save backup files here
set directory=~/.vim-tmp            " Save swap files here
set undofile                        " Enable persistent undo
set undodir=˜/.vim-tmp              " Where undo states are saved
set history=1000                    " Default is 20, applies to commands/search
set undolevels=1000                 " Increased undo levels
set title                           " Window title from filename
set ruler                           " Show cursor position if statusline disabled
set listchars=tab:>-,trail:-        " Highlight redundant space
set number                          " Line numbers on
set relativenumber                  " Relative numbering, only >= 7.3
set guioptions=a                    " Disable all GUI features
set laststatus=2                    " Display status on all windows
set scrolloff=3                     " Display 3 lines of padding on scroll
set wrap linebreak textwidth=0      " Sets soft wrapping
set backspace=indent,eol,start      " Allow backspace to delete these
set autoindent                      " Copies indent from previous line
set smartindent                     " Adds indenting if previous line ends with {, }
set tabstop=4                       " Width of tab character
set shiftwidth=4                    " Width of smartindent shifts
set expandtab                       " Replaces tab width in insert mode with spaces
set smarttab                        " Replaces tab width with spaces
set foldenable                      " Enable folding
set fdm=indent                      " Select fold method
set foldlevelstart=99               " Sets fold level when opening
let html_fold=1                     " Enable HTML folding
let css_fold=1                      " Enable CSS folding
set incsearch                       " Incremental search on
set ignorecase                      " Ignore case when searching
set smartcase                       " Case sensitive if uppercase letters are searched
set hidden                          " Switch buffers without saving
set hlsearch                        " Highlight search results (:noh to turn off)
set gdefault                        " Do a global search by default with :s or :g
set showmatch                       " Show matching parenthesis
set completeopt=longest,menuone     " Better completion popup
set noea                            " Don't resize splits
set wmh=0                           " Split height
set wildmode=longest:full,full      " Complete files like in shell
set wildmenu                        " Enhanced command line completion
set showcmd                         " Display incomplete commands
set showmode                        " Display the mode you're in
set wildignore=*.pyc,._*,.DS_Store  " Ignore files
set background=dark                 " Background color scheme
set t_Co=256                        " Set 256 colors
set guifont=DejaVu\ Sans\ Mono\ 8   " Font and size for GUI
"set spell                           " Enable spell chenking
set spelllang=en                    " Choose language
set spellsuggest=9                  " Limit suggestions to 9
set formatprg=par                   " Use gq to format, gqip, gw for internal format
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ -\ %c\ -\ (%p%%)] 
colorscheme desert                  " Color scheme
syntax on                           " Enable syntax highlighting
"
" Completion
"
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
"
" Keybindings
"
" Exit insert mode faster
inoremap kj <ESC>
" Easier to reach for ' and more useful
nnoremap ' `
nnoremap ` '
" Center search results
nmap n nzz
nmap N Nzz
" Arrow keys switch buffers
map <Right> :bnext<CR>
map <Left> :bprev<CR>
imap <Right> <ESC>:bnext<CR>
imap <Left> <ESC>:bprev<CR>
" Switch splits easily
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
" Scroll 3 lines instead of 1
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
" Copy above line
imap <C-\> <ESC>kyyjPi
nmap <C-\> kyyjPi
" Sort css properties alfabetically
map <leader>s ?{<CR>jV/^\s*\}\=$<CR>k:sort<CR>:let @/=''<CR>
" Shortcut to indent entire file
map <leader>i 1G=G
" Open .vimrc
map <leader>v :tabedit $MYVIMRC<CR>
" Source .vimrc
map <leader>sv :so $MYVIMRC<CR>
" Change to currents file directory
map <leader>d :cd %:p:h<CR>
" Move down in wrapped lines
nnoremap j gj
nnoremap k gk
" If you forgot to sudo
cmap w!! w !sudo tee % >/dev/null
" Toggle hidden characters selected in code section
nmap <silent> <leader>h :set nolist!<CR>
"
" Other
"
" Disable relativenumber for quickfix window
au BufReadPost * if &bt == "quickfix" | set number | elseif &bt == "" | set relativenumber | endif
"
" Plugin settings
"
"-------------------------------------------------------------------------------
" Notes
"-------------------------------------------------------------------------------
" [I - show all lines containing the word under the cursor
"----------
" zz, zt, zb position current line to center, top, bottom
"----------
" :set scrolloff=1000 then move cursor to center, it should never leave the
" middle after that, the value of scrolloff is how many lines of buffer you want
" around the top and bottom of the screen before it starts to scroll
"----------
" :ab mail mail#provider.org define mail as abbreviation of mail@provider.org
"----------
" :sh temporary return to shell, exit returns to vim, or C-z and fg in
" terminal
"----------
" :54 go to line 54, or 54G
"----------
" [{ go to previous {
"----------
" '' move to previous position, m{a-z} mark position, '{a-z} go to mark
"----------
" '0 open previous file (good for returning after restart)
"----------
" :sav filename save as and switches to new filename
"----------
" gq justify text, if you have :set textwidth=70
"----------
" D deletes to end of line (easier than d$)
"----------
" K lookup word under cursor in man pages
"----------
" C-] jump to tag, C-t jumps back
"----------
" map <f9> :w<CR>:!python %<CR> run current file through external program
"----------
" iw, aw, iW, aW, is, as, ip, ap, i(, a(, i<, a<, i{, a{, i[, a[, i", a"...
"----------
" C-a, C-x to increment, decrement number under cursor
"----------
" C-K a: Digraphs
"----------
" Git submodules:
" Add with 'git submodule add <address>', 'git add .', 'git commit'
" Update single with 'cd bundle/fugitive && git pull origin master'
" Update all 'git submodule foreach git pull origin master'
" Add to new pc 'cd ~ && git clone repo && ln -s... && cd ~/.vim && git submodule init && git submodule update'
"----------
" Read output of shell command into vim with ':r !<command>'
"-------------------------------------------------------------------------------
" author: Melvin Torrens - email: m@torrens.me - file: .vimrc
"-------------------------------------------------------------------------------
