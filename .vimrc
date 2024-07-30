set nocompatible              " Enable Vim features
set ruler                     " Show line & column
set number                    " Show line numbers
set relativenumber            " Show relative line numbers
set scrolloff=1               " Keep 1 line above and below the cursor while scrolling
set scroll=4                  " Number of lines to scroll with scroll command
set cursorline                " Highlight the current line
set showcmd                   " Show incomplete commands in the bottom right corner
set showmode                  " Show current mode (e.g., -- INSERT --)
set showmatch                 " Highlight matching brackets
set matchtime=5               " Time to highlight matching brackets (tenths of a second)
set nowrap                    " Disable line wrapping
set belloff=all               " Disable all bell sounds
set noerrorbells              " Disable error bells
set vb t_vb=                  " Disable visual bell
set mouse=a                   " Enable mouse in all modes

" Colors and Highlighting
syntax on                     " Enable syntax highlighting
colorscheme habamax           " Set color scheme
highlight Normal ctermbg=256  " Set background color

" Indentation and Tabs
set shiftwidth=2              " Number of spaces for each step of (auto)indent
set tabstop=2                 " Number of spaces for a tab character
set softtabstop=2             " Number of spaces for a tab character during editing
set expandtab                 " Convert tabs to spaces
set smarttab                  " Smart tab behavior
set autoindent                " Enable automatic indentation

" Search Settings
set incsearch                 " Incremental search
set ignorecase                " Ignore case in search patterns
set smartcase                 " Override ignorecase if search pattern contains uppercase letters
set hlsearch                  " Highlight search results
set nohlsearch                " Disable search highlighting after search completion

" Backup and Undo
set undofile                  " Enable persistent undo
set undodir=.undo/,~/.undo/,/tmp// " Set directories for undo history files
set nobackup                  " Disable backup files

" File Encoding
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 " Set file encodings

" Command Line
set updatetime=50             " Time of inactivity before writing swap file (ms)
set backspace=indent,eol,start " Configure backspace behavior

" Navigation and Window Management
nnoremap <C-j> <C-w>j       " Move to the pane below
nnoremap <C-h> <C-w>h       " Move to the pane to the left
nnoremap <C-k> <C-w>k       " Move to the pane above
nnoremap <C-l> <C-w>l       " Move to the pane to the right

" Split windows
nnoremap <silent> <C-\> :vsplit<CR><C-w>l " Split vertically and move to the right pane
nnoremap <silent> <C-w>s :split<CR><C-w>j " Split horizontally and move to the bottom pane

" Line Moving and Visual Mode Fixes
" Line moving dark-art
vnoremap J :m '>+1<CR>gv=gv " Move selected lines down in visual mode
vnoremap K :m '<-2<CR>gv=gv " Move selected lines up in visual mode

" Visual mode fix
vmap $ g_                   " Move to the end of the line, excluding newline

" Bracket Pairs Function
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

" Jump list fixes
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" File manager
nmap <C-b> :Sex!<CR><C-w>l<C-q> " Open file explorer in current pane

" Commented out map
"map <C-f> <Nop>
"nmap <C-f> ggVG=<C-o><C-o>

