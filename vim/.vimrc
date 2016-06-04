" Setup pathogen.
execute pathogen#infect()

" Set filetype. 
" No need to specify 'filetyle on' because it's turned on automatically.
filetype plugin indent on

" Coding related stuff.
set tabstop=4
set shiftwidth=4
set shiftround
set softtabstop=4
set expandtab
set smarttab
set autoindent
set smartindent
set copyindent
set backspace=indent,eol,start| " Could also be set to 2
set nowrap
set cpoptions+=$
set ignorecase| " Still testing this one...
set smartcase|  " Still testing this one... 
set diffopt+=iwhite| " Remove white spaces from diff.
nmap <silent> ,u= :t.\|s/./=/g\|:nohls<cr>| " Used when commenting.
nmap <silent> ,u- :t.\|s/./-/g\|:nohls<cr>
autocmd BufWritePre *.php :%s/\s\+$//e| " Auto-remove trailing spaces 
nmap ,todo :e TODO.txt<cr>| " Edit todo list for project
noremap <leader>s :!php -l %<cr>
nmap <leader>c mzA;<esc>'z

" Shell related stuff.
set shellslash
if has("unix")
    set shell=zsh
endif

" Avoid beeps on errors.
set visualbell
set noerrorbells

" Syntax highlighting
syntax on   

" Command line settings.
set showcmd|  " Show (partial) command in the last line of the screen.
set showmode
"let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme='bubblegum'
"let g:airline#extensions#tabline#enabled = 1
" Powerline
"let g:Powerline_symbols = 'fancy'
"set encoding=utf-8 " Necessary to show Unicode glyphs
"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the status line)

" Timeout options.
set timeout timeoutlen=500 ttimeoutlen=200

" General settings.
set t_Co=256
colorscheme xoria256
set linespace=15| " Space between lines.
set mousehide
set guioptions=acg
set guifont=Menlo:h15
set clipboard+=unnamed
set history=50
set scrolloff=4
set virtualedit=all| " Cursor can move everywhere.
let mapleader = ","
set autoread
set ruler
set number
"set relativenumber
"set autowrite " Save on buffer switch <-- I think I don't like it a lot mainly because of code watchers.
" Don't tab complete binary files
set fileencodings=utf-8,ucs-bom,default,latin1
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.git,.svn
set wildignore+=*~,*.swp,*.tmp
map <silent> <leader>ev :e $MYVIMRC<cr>
map <silent> <leader>sv :source $MYVIMRC<cr>
imap jj <esc>| " Map jj to escape.
set nocursorline
set nocursorcolumn
set nomodeline
set showmatch| " Show matching brackets when text indicator is over them 
nmap <leader>w :w!<cr>| " Fast save.
nmap <leader>q :q!<cr>| " Fast close without saving.
" Keep backup and swap files out of project directory.
set backupdir=~/.vim/backup// 
set directory=~/.vim/swap//
nmap :ed :edit %:p:h/| " Create/edit file in the current directory
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.info,.aux,.log,.dvi,.bbl,.out,.o,.lo
set viminfo='20,\"500

" How many tenths of a second to blink when matching brackets
set mat=2

" Auto-completion settings.
set wildmenu| " Better command-line completion
set complete=.,w,b,t
set textwidth=0| " Disable textwidth because I don't need it for my coding stds.

" Search settings.
map <silent><leader><cr> :noh<cr>| " Remove search highlisht.
"highlight Search cterm=underline
autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch
set incsearch| " Show incremental search pattern.

" Buffer settings.
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>
noremap <silent> <leader>e :b#<cr>

" Windows settings.
nmap :sp :rightbelow sp<cr>| " Create split below.
nmap vs :vsplit<cr>
nmap sp :split<cr>
noremap <silent> <leader>cl :wincmd l<cr>:close<cr>
noremap <silent> <leader>ck :wincmd k<cr>:close<cr>
noremap <silent> <leader>cj :wincmd j<cr>:close<cr>
noremap <silent> <leader>ch :wincmd h<cr>:close<cr>
noremap <silent> ,cc :close<CR>
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mj <C-W>J
noremap <silent> ,mh <C-W>H
noremap <silent> ,wl <C-W>l
noremap <silent> ,wk <C-W>k
noremap <silent> ,wj <C-W>j
noremap <silent> ,wh <C-W>h
noremap <silent> ,wo <C-W>o

" Tabs settings.
map <leader>tne :tabnew<cr>| " Go to next tab
map <leader>to :tabonly<cr>| " Close all tabs except current one.
map <leader>tc :tabclose<cr>| " Close tab.
map <leader>tm :tabmove<cr>| " Move tab
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/| " Open file from current directory in a new tab.
map <leader>tn :tabn<cr>
map <leader>tp :tabp<cr>

" ---------------- PLUGIN SETTINGS ---------------- 

" NERD Tree
nmap <C-b> :NERDTreeToggle<cr>| " Toggle NERDTree by hitting ctrl-b 
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=[ '\.obj$' ]

" CtrlP
nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>fb :CtrlPBuffer<cr>
nnoremap <leader>r :CtrlPTag<cr>
let g:ctrlp_max_files=0
set wildignore+=*/vendor/** " Speed things up by ignoring vendor folders.

" UltiSnips
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"

" PhpDoc
autocmd BufRead,BufNewFile *.php inoremap <buffer> <C-p> :call PhpDoc()<cr>
autocmd BufRead,BufNewFile *.php nnoremap <buffer> <C-p> :call PhpDoc()<cr>
autocmd BufRead,BufNewFile *.php vnoremap <buffer> <C-p> :call PhpDocRange()<cr>

" --------------- / PLUGIN SETTINGS --------------- 

" Abbreviations, mostly used for spelling mistakes.
iab fuction function

" ---------------- TESTING -----------------------
set formatoptions=c,q,r,t
" This is a sequence of letters which describes how
" automatic formatting is to be done.
"
" letter    meaning when present in 'formatoptions'
" ------    ---------------------------------------
"  c         Auto-wrap comments using textwidth, inserting
"            the current comment leader automatically.
"  q         Allow formatting of comments with "gq".
"  r         Automatically insert the current comment leader
"            after hitting <Enter> in Insert mode.
"  t         Auto-wrap text using textwidth (does not apply
"            to comments)
"
" --------------- / TESTING ----------------------

" Laravel specific mapping.
" Hardcoded for now, I need to find a better way of doing this.
nmap <leader>lca :e config/app.php<cr>124Gf(%0

" Add a new dependency to a PHP class.
function! AddDependency()
    let dependency = input('Var Name: ')
    let namespace = input('Class Path: ')

    let segments = split(namespace, '\')
    let typehint = segments[-1]

    " It reproduces something like this:
    " namespace <namespace>
    " 
    " class <class_name>
    " {
    "   protected <dependency>
    "
    "   [...]
    "
    "   public function __construct(<segment> <dependency)
    "   {
    "       $this-><dependency> = $<dependency>
    :execute "normal! gg/construct\<esc>f)i, " . typehint . " $" . dependency . "\<esc>/}\<esc>O$this->" . dependency . " = $" . dependency . ";\<esc>mz?{\<cr>noprotected $" . dependency . ";\<esc>?class\<cr>kOuse " . namespace . ";\<esc>"

    " Remove opening comma if there is only one dependency.
    :execute "normal! :%s/(, /(/ge\<cr>'z"

endfunction

nmap ,1 :call AddDependency()<cr>
