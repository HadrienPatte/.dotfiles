" Comma is leader key
let mapleader=","

" Necesary for lots of cool vim things
set nocompatible

" Share system clipboard (note: vim needs to be compiled with the +clipboard option)
set clipboard=unnamed
set clipboard=unnamedplus
vnoremap y "+y
nnoremap yy "+yy

" Enable mouse
set mouse=a


" Enable syntax highlighting
syntax enable
colorscheme slate
set background=dark

" Load filetype specific files
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime


" Display line numbers
set number

" Display commands
set showcmd

" Show status line
set laststatus=2
set t_Co=256

" Load powerline
try
    python3 from powerline.vim import setup as powerline_setup
    python3 powerline_setup()
    python3 del powerline_setup
catch
    try
        python from powerline.vim import setup as powerline_setup
        python powerline_setup()
        python del powerline_setup
    endtry
endtry

" Highlight current line
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

" Visual autocomplete for command menu
set wildmenu

" Redraw only when needed
set lazyredraw

" Highlight matching [{()}]
set showmatch


" Always display at least 2 lines around cursor
set so=2

" Number of visual spaces per TAB
set tabstop=4
set shiftwidth=4

" Number of spaces in tab when editing
set softtabstop=4

" Insert spaces instead of TABs
set expandtab

" Use smart tabs
set smarttab

" Highlight tabs
set list lcs=tab:\|\ " important space at EOL

" Search as characters are entered
set incsearch

" Highlight search matches
set hlsearch

" Unhighlight search matches
nnoremap <leader><space> :nohlsearch<CR>

" Ignore case for search
set ignorecase

" Don't ignore case if search term has mixed case
set smartcase


" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l


" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set default encoding
set encoding=utf8

" Disable backups
set nobackup
set nowb
set noswapfile

" Enable auto indent
set autoindent

" Enable smart indent
set smartindent

" Wrap lines
set wrap

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre * :call CleanExtraSpaces()
endif


autocmd Filetype c,cc,h setlocal tabstop=2 shiftwidth=2 softtabstop=4 expandtab
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab copyindent preserveindent
autocmd Filetype python,bazel,bzl setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd Filetype yaml,yml setlocal tabstop=2 shiftwidth=2 softtabstop=4 expandtab

" Format C/C++ files on save
autocmd BufWritePost *.c,*.cc,*.h silent !clang-format -i <afile>

" Format go files on save
autocmd BufWritePost *.go silent !goimports -w <afile>

" Format terraform files on save
autocmd BufWritePost *.tf,*.tfvars silent !terraform fmt <afile>

" Display hidden files in NerdTree by default
let NERDTreeShowHidden=1

" Load COC configuration
try
    source ~/.coc.vim
endtry
