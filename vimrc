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
set directory=~/.vim/tmp/swap//     " Save backup files here
set backupdir=~/.vim/tmp/backup//   " Save swap files here
set undodir=˜/.vim/tmp/undo//       " Where undo states are saved
set undofile                        " Enable persistent undo
set undoreload=10000                " Save whole file into undo before reloading (:e!)
set backup                          " Enable backups
set history=1000                    " Default is 20, applies to commands/search
set undolevels=1000                 " Increased undo levels
set title                           " Window title from filename
set encoding=utf-8                  " Prefered enconding
set ttyfast                         " Improves speed
set lazyredraw                      " Avoid redundant redraws
set shell=/bin/bash                 " Prefered shell
set ruler                           " Show cursor position if statusline disabled
set listchars=tab:>-,trail:-        " Highlight redundant space
set showbreak=↪                     " Custom character for break
set number                          " Line numbers on
set relativenumber                  " Relative numbering, only >= 7.3
set guioptions=a                    " Disable all GUI features
set virtualedit+=block              " Allow visual block selection to extend
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
set matchtime=3                     " How long the matching parenthesis are lit
set splitbelow                      " When splitting place window below
set splitright                      " When splitting place window right
set sidescroll=1
set sidescrolloff=10
set completeopt=longest,menuone     " Better completion popup
set noea                            " Don't resize splits
set wmh=0                           " Split height
set wildmode=longest:full,full      " Complete files like in shell
set wildmenu                        " Enhanced command line completion
set showcmd                         " Display incomplete commands
set showmode                        " Display the mode you're in
set wildignore=*.pyc,._*,.DS_Store,.git     " Ignore files
set background=dark                 " Background color scheme
set t_Co=256                        " Set 256 colors
set guifont=DejaVu\ Sans\ Mono\ 8   " Font and size for GUI
set nospell                         " Disable spell checking
set spelllang=en                    " Choose language
set spellsuggest=9                  " Limit suggestions to 9
set formatprg=par                   " Use gq to format, gqip, gw for internal format
set clipboard=unnamed               " Use Mac OS clipboard, if you use tmux you need this https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard/blob/master/README.md
colorscheme xoria256                " Color scheme
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
" : is more common than ;
nnoremap ; :
nnoremap , ;
" Center search results
nmap n nzz
nmap N Nzz
" Better search
nnoremap / /\v
vnoremap / /\v
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
noremap <leader>g <C-w>v
" Scroll 3 lines instead of 1
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
" Scroll faster
nnoremap <space> 10<c-e>10j
nnoremap <backspace> 10<c-y>10k
" Copy above line
imap <C-\> <ESC>kyyjPi
nmap <C-\> kyyjPi
" Sort css properties alfabetically
map <leader>s ?{<CR>jV/^\s*\}\=$<CR>k:sort<CR>:let @/=''<CR>
" Shortcut to indent entire file
map <leader>i 1G=G
" Open .vimrc
map <leader>ev :tabedit $MYVIMRC<CR>
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
" Open URL on this line
map <leader>w :call Browser ()<CR>
" Create blank lines and stay in normal mode
nnoremap <silent> zj o<esc>
nnoremap <silent> zk O<esc>
"
" Other
"
" Disable relativenumber for quickfix window
au BufReadPost * if &bt == "quickfix" | set number | elseif &bt == "" | set relativenumber | endif
" Open URL in browser
function! Browser ()
    let line = getline (".")
    let line = matchstr (line, "http[^   ]*")
    exec "!firefox ".line
endfunction
"
" http://got-ravings.blogspot.com/2009/07/vim-pr0n-combating-long-lines.html
"
"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning
"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction
"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction
"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning
"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning = '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction
"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning
"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")

        if !&modifiable
            let b:statusline_long_line_warning = ''
            return b:statusline_long_line_warning
        endif

        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction
"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)

    let long_line_lens = []

    let i = 1
    while i <= line("$")
        let len = strlen(substitute(getline(i), '\t', spaces, 'g'))
        if len > threshold
            call add(long_line_lens, len)
        endif
        let i += 1
    endwhile

    return long_line_lens
endfunction
"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction
"
" Statusline
"
set statusline=%f "tail of the filename
" Display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*
" Display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*
set statusline+=%h "help file flag
set statusline+=%y "filetype
set statusline+=%r "read only flag
set statusline+=%m "modified flag
" Display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*
set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%{StatuslineLongLineWarning()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*
set statusline+=%= "left/right separator
function! SlSpace()
    if exists("*GetSpaceMovement")
        return "[" . GetSpaceMovement() . "]"
    else
        return ""
    endif
endfunc
set statusline+=%{SlSpace()}
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c, "cursor column
set statusline+=%l/%L "cursor line/total lines
set statusline+=\ %P "percent through file
"
" Plugin settings
"
" Gundo
nnoremap <F12> :GundoToggle<CR>
" CloseTag
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim
" SuperTab
let g:SuperTabDefaultCompletionType = "context"
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
"----------
" See latest error messages without them dissapearing immediately with :mess
"-------------------------------------------------------------------------------
" author: Melvin Torrens - email: melvin.torrens@gmail.com - file: .vimrc
"-------------------------------------------------------------------------------
