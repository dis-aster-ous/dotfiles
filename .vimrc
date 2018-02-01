" Basic Options
set nocompatible
set modeline
set modelines=10
syntax enable
filetype plugin indent on
set ruler
set showcmd
set number
set incsearch
set hlsearch
set smartcase
set ignorecase
set scrolloff=10
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set nosmartindent
set noerrorbells visualbell t_vb=
set laststatus=2
set hidden
let mapleader = ','
let maplocalleader = '\'
set undofile
set undodir=~/.vim/undo
set wildignore=*.pyc,*.o,.git,.DS_Store
set clipboard=unnamed
set colorcolumn=+1
set concealcursor=
set formatoptions+=j
set viminfo='100,n$HOME/.viminfo

" Colors
set t_Co=256

fu! ReverseBackground()
  if &bg=="light"
    se bg=dark
  else
    se bg=light
  endif
endf
com! BgToggle call ReverseBackground()
nm <F12> :BgToggle<CR>

let g:solarized_termcolors=16
set bg=light
colorscheme solarized

" Window Navigation
nnoremap <space>w <C-w>
nnoremap <space>h <C-w>h
nnoremap <space>j <C-w>j
nnoremap <space>k <C-w>k
nnoremap <space>l <C-w>l
nnoremap <space>z <C-w>z

" YouCompleteMe
let g:ycm_semantic_triggers =  {
      \   'c' : ['->', '.'],
      \   'objc' : ['->', '.'],
      \   'ocaml' : ['.', '#'],
      \   'cpp,objcpp' : ['->', '.', '::'],
      \   'perl' : ['->'],
      \   'php' : ['->', '::'],
      \   'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
      \   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
      \   'ruby' : ['.', '::'],
      \   'lua' : ['.', ':'],
      \   'erlang' : [':'],
      \   'clojure' : ['(', '.', '/', '[']
      \ }

" ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Tagbar options
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1

" Statusline
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_theme='solarized'
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tagbar#flags = 'f'
let g:ariline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2

" Bufferline
let g:bufferline_echo=0

" Signify options
let g:signify_vcs_list = ['git']
let g:signify_sign_change       = '~'
let g:signify_sign_delete       = '-'
highlight clear SignColumn

" Startify
let g:startify_bookmarks=[ '~/.vimrc',  '~/.zshrc' ]

" Mustache/Handlebars
let g:mustache_abbreviations = 1
