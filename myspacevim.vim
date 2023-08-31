function! myspacevim#before() abort
  " Comma is leader key
  let mapleader=","

  " Enable mouse
  set mouse=a

  " Display spacevim's guide buffer after XX ms
  set timeoutlen=0
endfunction

function! myspacevim#after() abort
  " Share system clipboard (note: vim needs to be compiled with the +clipboard option)
  set clipboard=unnamed
  set clipboard=unnamedplus
  vnoremap y "+y
  nnoremap y "+yy

  " Set to auto read when a file is changed from the outside
  set autoread
  au FocusGained,BufEnter * checktime

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

  " Unhighlight search matches
  nnoremap <leader><space> :nohlsearch<CR>

  " Ignore case for search
  set ignorecase

  " Don't ignore case if search term has mixed case
  set smartcase

  " Disable backups
  set nobackup
  set nowb
  set noswapfile

  " Wrap lines
  set wrap

  " Return to last edit position when opening files (You want this!)
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  autocmd Filetype c,cc,h setlocal tabstop=2 shiftwidth=2 softtabstop=4 expandtab
  autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab copyindent preserveindent
  autocmd Filetype python,bazel,bzl setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
  autocmd Filetype yaml,yml setlocal tabstop=2 shiftwidth=2 softtabstop=4 expandtab

  " Enable trimmming of trailing whitespace
  let g:neoformat_basic_format_trim = 1

  " vim-terraform options
  let g:terraform_fmt_on_save=1
  let g:terraform_align=1
endfunction
