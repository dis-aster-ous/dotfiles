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
nnoremap <esc><esc> :noh<return>
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

" Filetypes
au BufRead,BufNewFile *.tml set filetype=witango syntax=html
au BufRead,BufNewFile *.phtml set filetype=php
au BufRead,BufNewFile *.php.*tmp set filetype=php syntax=php
au BufRead,BufNewFile *.phtml.*tmp set filetype=php syntax=php
au BufRead *.tml,*.taf silent! %s//\r/g | setlocal foldmethod=manual |
  \ setlocal noexpandtab | map <Leader>h :set syntax=html<CR>

aug Python
  au!
  au FileType python set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
aug END
let g:python_highlight_all=1

aug PHP
  au!
  "au FileType php setlocal fdm=marker fmr={{{,}}}
aug END

aug Java
  au!
  au FileType java setlocal fdm=marker fmr={,}
aug END

aug Mail
  au FileType mail setlocal spell
aug END

" Haskell
let g:haskell_conceal_wide = 1

" Ruby
augroup Ruby 
  au!
  " au FileType ruby let b:surround_114 = "\\(module|class,def,if,unless,case,while,until,begin,do) \r end"
  " au FileType ruby set fdm=syntax
  au FileType ruby set tw=80
  au FileType haml set tw=80
augroup END

let ruby_operators = 1
let ruby_space_errors = 1

let g:rubycomplete_rails = 1
command! -range ConvertHashSyntax <line1>,<line2>s/:(\S{-})(\s{-})=> /\1:\2/

" Clojure
aug Clojure
  au!
  autocmd FileType clojure nnoremap <C-S> :Slamhound<CR>
  let g:clojure_align_multiline_strings = 1
  let g:clojure_fuzzy_indent_patterns = 
        \ ['^with', '^def', '^let', '^fact']
  let g:clojure_special_indent_words =
        \ 'deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn,html'

  autocmd FileType clojure setlocal lispwords+=GET,POST,PATCH,PUT,DELETE |
        \ setlocal lispwords+=context
  autocmd BufNewFile,BufReadPost *.cljx setfiletype clojure
  autocmd BufNewFile,BufReadPost *.cljx setlocal omnifunc=
  autocmd BufNewFile,BufReadPost *.cljs setlocal omnifunc=
aug END

command! TangentConnect Connect nrepl://localhost:7888 
      \ ~/code/clojure/tangent/tangent

" Remove trailing whitespace
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

augroup striptrailingwhitespaces " {{{
autocmd FileType c,cpp,java,php,ruby,python,javascript,sh,jst,less,haskell,haml,coffee,scss,clojure,md
  \ autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
augroup END " }}}

" Nerdtree
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.swp$']
map <C-n> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1

" If no files specified, open Nerdtree and Startify, with cursor in Startify
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd p | ene | Startify | endif

" If a file was specified, start with Nerdtree open and cursor in file buffer
autocmd VimEnter * if argc() == 1 && !exists("s:std_in") && &filetype !=# 'gitcommit' | NERDTree | wincmd p | endif

" Automatically close Nerdtree if it's the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
