set undodir=.undo/,~/.undo/,/tmp//

set noerrorbells

set vb t_vb=

set belloff=all

set number

set relativenumber

set nocompatible

filetype on

filetype indent on

syntax on

set shiftwidth=2

set tabstop=2

set softtabstop=2

set expandtab

set nobackup

set scrolloff=1

set mouse=a

set nowrap

set incsearch

set ignorecase

set smartcase

set showcmd

set showmode

set showmatch

set matchtime=5

set scroll=4

set updatetime=50

colorscheme habamax 

highlight Normal ctermbg=256

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

set hlsearch

set cursorline

set smarttab

set undofile

set nohlsearch

set autoindent

set backspace=indent,eol,start

" fix jump list
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" fix visual mode
vmap $ g_

" split window vertically
nnoremap <silent> <C-\> :vsplit<CR><C-w>l
nnoremap <silent> <C-w>s :split<CR><C-w>j

" window switching
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" line moving dark-art
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" file manager
nmap <C-b> :Sex!<CR><C-w>l<C-q>


" brackets
function! ConditionalPairMap(open, close)
  let line = getline('.')
  let col = col('.')
  if col < col('$') || stridx(line, a:close, col + 1) != -1
    return a:open
  else
    return a:open . a:close . repeat("\<left>", len(a:close))
  endif
endf
inoremap <expr> ( ConditionalPairMap('(', ')')
inoremap <expr> { ConditionalPairMap('{', '}')
inoremap <expr> [ ConditionalPairMap('[', ']')
inoremap <expr> ` ConditionalPairMap('`', '`')
inoremap <expr> ' ConditionalPairMap('''', '''')
inoremap <expr> " ConditionalPairMap('"', '"')
inoremap <expr> $ ConditionalPairMap('$', '$')


"map <C-f> <Nop>
"nmap <C-f> ggVG=<C-o><C-o>
