"-------------------------------------------------------------------------------
" author:   Melvin.gvimrc
" email:    m@torrens.me
" file:     .vimrc
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" defaults
"-------------------------------------------------------------------------------

set nocompatible "vim not vi
set nomodeline "remote exploits have been possible for allowing modelines
call pathogen#helptags()
call pathogen#runtime_append_all_bundles() "load pathogen
set history=1000 "default is 20 applies to commands and search patterns
set shortmess=atI "see :h shortmess, will warn less
set visualbell "don't beep on errors
"set autochdir "current directory always matches the content of the active file

"--- directory
if has("gui_macvim")
    cd /Volumes/201/work/globegood/code/big/
endif

"--- swap
set nobackup "no backups
set nowritebackup "no backups
set backupdir=~/.vim-tmp//
set directory=~/.vim-tmp//

"--- filetype
filetype plugin indent on

"--- command line
"set wildmode=list:longest "complete files like in shell
set wildmode=longest:full,full "complete files like in shell
set wildmenu "enhanced command line completion
set showcmd "display incomplete commands
set showmode "display the mode you're in

"-------------------------------------------------------------------------------
" colors & gui
"-------------------------------------------------------------------------------

set background=dark
set t_Co=256 "sets colors to 256
colorscheme wombat "default colortheme
set guifont=DejaVu\ Sans\ Mono\ 8 "font and size

"--- MacVim fullscreen
if has("gui_macvim")
    set guifont=DejaVu Sans Mono:10
    set fuopt+=maxhorz "grow to maximum horizontal width
    macmenu &Edit.Find.Find\.\.\. key=<nop>
    map <D-f> :set invfu<CR>
endif

"--- window
set guioptions=a "hide all gui crap
"set guioptions-=T "toolbar off
"set guioptions-=m "menu off
"set guioptions+=lrb "adds scrollbars (workaround for -=lrb)
"set guioptions-=lrb "scrollbars off
set title "window title from filename
set laststatus=2
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ -\ %c\ -\ (%p%%)] "statusline
"set columns=103 "set window width
"set lines=58 "set window height
set scrolloff=3 "have 3 lines of offset (or buffer) when scrolling

"-------------------------------------------------------------------------------
" code
"-------------------------------------------------------------------------------

syntax on "syntax coloring on
set number "line numbers on
set ruler "show cursor position
set cul "highlight cursor line
set cursorcolumn "highlight current column
"set paste "fix pasting when using autoindent BUG disables all completion in cli
set wrap linebreak textwidth=0 "sets soft wrapping
set backspace=indent,eol,start "allow backspace to delete these
"set list "show hidden characters
set listchars=tab:>-,trail:·,eol:$ "list these hidden characters

"--- Relative line numbering
if exists('+relativenumber') " 7.3
    set relativenumber " Use relative line numbers. Current line is still in status bar.
    " do not use relative number for quickfix window
    au BufReadPost * if &bt == "quickfix" | set number | elseif &bt == "" | set relativenumber | endif
endif

"--- indent
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
"python automatically indent next line after these keywords
"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"python remove trailing whites paces on exit
"autocmd BufWritePre *.py :%s/\s\+$//e
set formatprg=par "Use gq to format visual selection or combine gqip. gw to use vims internal engine.

"--- tags
set tags+=$HOME/.vim/tags/python.ctags
"map <F12> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"--- folding
set foldenable
set fdm=indent
set foldlevelstart=20
let html_fold=1
let css_fold=1

"--- spellcheck
"turn on spell checking with English dictionary
"set spell
"set spelllang=en
"show only 9 suggestions for misspelled words
"set spellsuggest=9

"-------------------------------------------------------------------------------
" search
"-------------------------------------------------------------------------------

set incsearch "incremental search on
set ignorecase "ignore case when searching
set smartcase "case sensitive if uppercase letters are searched
set hidden "switch buffers without saving
set hlsearch "highlight search results (:noh to turn off)
set gdefault "do a global search by default with :s or :g

"-------------------------------------------------------------------------------
" completion
"-------------------------------------------------------------------------------

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

let g:SuperTabDefaultCompletionType = "context"

"better completion popup
set completeopt=longest,menuone
"pressing enter while completion menu is open will fill in the highlighted
"word
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"found at http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
"further improvements to the completion menu
"this will make the menu stay open and C-n will move down the list allowing
"you to narrow down your search
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"simulates <C-X><C-O> to bring up the menu and then simulates <C-N><C-P>
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"--- python
let g:pydiction_location = '~/.vim/bundle/python/ftplugin/pydiction/complete-dict'

"-------------------------------------------------------------------------------
" bindings
"-------------------------------------------------------------------------------

"Set space to insert : for additional commands
nnoremap <Space> :
"not sure what this does
nnoremap ' `
nnoremap ` '
"center search results
nmap n nzz
nmap N Nzz

"--- tabs
nmap t% :tabedit %<CR>
nmap tc :tabclose<CR>
nmap tn :tabnew<CR>

"--- buffers
map <Right> :bnext<CR>
map <Left> :bprev<CR>
imap <Right> <ESC>:bnext<CR>
imap <Left> <ESC>:bprev<CR>

"--- splits
"map <S-C-j> <C-w>j
"map <S-C-k> <C-w>k
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
set wmh=0 "split height
"map <Up> 5<C-w>+
"map <Down> 5<C-w>-
"map <Left> 5<C-w><
"map <Right> 5<C-w>>
set noea "don't resize splits

"--- folding
"nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
"vnoremap <Space> zf

"escape insert mode pressing kj
inoremap kj <Esc>
"shortcut to indent entire file
map <leader>i 1G=G
"nmap <F11> 1G=G
"nmap <F11> <ESC>1G=Ga
"scroll 3 lines instead of 1
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
"toggle hidden characters selected in code section
nmap <silent> <leader>h :set nolist!<CR>
"copy above line
imap <C-\> <ESC>kyyjPi
nmap <C-\> kyyjPi
"sort css properties alfabetically
map <leader>s ?{<CR>jV/^\s*\}\=$<CR>k:sort<CR>:let @/=''<CR>
"open .vimrc
map <leader>v :tabedit $MYVIMRC<CR>
"source .vimrc
map <leader>sv :so $MYVIMRC<CR>
"change to currents file directory
map <leader>d :cd %:p:h<CR>
"move down in wrapped lines
nnoremap j gj
nnoremap k gk
"if you forgot to sudo
cmap w!! w !sudo tee % >/dev/null

"-------------------------------------------------------------------------------
" other
"-------------------------------------------------------------------------------

"--- Utl
nnoremap <silent> <F12> :Utl<CR>

"--- YankRing
nnoremap <silent> <F7> :YRShow<CR>

"--- FuzzyFinder
"nnoremap <silent> <F9> :FufFile<CR>
"nnoremap <silent> <F8> :FufBuffer<CR>

"--- Command-T
nnoremap <silent> <F10> :CommandT<CR>
map <leader>f :CommandTFlush<CR>
let g:CommanTMaxHeight=20

"--- BufExplorer
nnoremap <silent> <F9> :BufExplorer<CR>

"--- NERDTree
map <F11> :NERDTreeToggle<CR>
let NERDTreeWinPos="right"
let NERDTreeWinSize=30
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
"let NERDTreeQuitOnOpen=1
let NERDTreeHighlightCursorLine=1
let NERDTreeIgnore=['\.pyc']

"--- NERDCommenter
map <leader>c <plug>NERDCommenterComment

"--- Taglist
let Tlist_Use_Left_Window=1
let Tlist_Auto_Open=0
let Tlist_Enable_Fold_Column=0
let Tlist_Show_One_File = 1 " Only show tags for current buffer
let Tlist_Compact_Format=0
let Tlist_WinWidth=28
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close = 1
nnoremap <silent> <F8> :TlistToggle<CR>

"--- Tasklist
nnoremap <silent> <F6> :TaskList<CR>

"--- TaskPaper
nmap tp :tabnew ~/.taskpaper<CR>

"--- Gundo
nnoremap <F5> :GundoToggle<CR>

"--- RagTag
let g:ragtag_global_maps = 1

"--- Firefox
command Fire :!firefox %<CR>
"refresh Firefox on :w, mozrepl is required for this
autocmd BufWriteCmd *.html,*.css,*.gtpl :call Refresh_firefox()
function! Refresh_firefox()
  if &modified
    write
    silent !echo  'vimYo = content.window.pageYOffset;
                 \ vimXo = content.window.pageXOffset;
                 \ BrowserReload();
                 \ content.window.scrollTo(vimXo,vimYo);
                 \ repl.quit();'  |
                 \ nc localhost 4242 2>&1 > /dev/null
  endif
endfunction

"nnoremap <silent> <leader>r :Reload<CR>
"command! Reload call Refresh_F()
"function! Refresh_F()
    "silent !echo  'vimYo = content.window.pageYOffset;
                 "\ vimXo = content.window.pageXOffset;
                 "\ BrowserReload();
                 "\ content.window.scrollTo(vimXo,vimYo);
                 "\ repl.quit();'  |
                 "\ nc localhost 4242 2>&1 > /dev/null
"endfunction

"--- ConqueShell
function! s:Terminal()
  execute 'ConqueTermSplit bash --login'
endfunction
command! Terminal call s:Terminal()

"--- Python
"  Execute file being edited with <Shift>+e:
map <leader>p :!python %<CR>

"--- vimrc reload on save
if has("autocmd")
   autocmd bufwritepost .vimrc source $MYVIMRC
endif

"-------------------------------------------------------------------------------
" Tips
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
" C-K a: Digraphs, awesome!
"-------------------------------------------------------------------------------
" author: Melvin Torrens - email: m@torrens.me - file: .vimrc
"-------------------------------------------------------------------------------
