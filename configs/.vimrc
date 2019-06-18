" Color scheme
colorscheme industry

" Auto-indentation
set autoindent

" Makes tabs spaces
set expandtab

" Two spaces per tab key press
set tabstop=2

" Indents will have a width of 2
set shiftwidth=2

" Numbers of columns for a TAB
set softtabstop=2

" StackOverflow says it inserts indents instead of tabs at beginning of lines
set smarttab

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Show matching brackets
set showmatch

" Enable mouse usage
set mouse=a

" Show line numbers
" set number

" Show current line
set cursorline

" Have same background as terminal setting
hi clear Normal
hi Normal cterm=none ctermbg=none ctermfg=none

" Highlight search results
set hlsearch

" Search coloring
hi clear Search
hi Search cterm=underline ctermbg=lightblue ctermfg=black

" Search as characters are entered
set incsearch

" 80 columns
let &colorcolumn="80,100,120"
highlight ColorColumn cterm=none ctermbg=darkgray ctermfg=red

" Language setting
set spelllang=en
set spellfile=$HOME/.vim/spell/en.utf-8.add

" Spelling highlight
hi clear SpellRare
hi SpellRare cterm=underline ctermbg=none ctermfg=none

hi clear SpellBad
hi SpellBad cterm=underline ctermbg=none ctermfg=none

" Set style for gVim
" hi SpellBad gui=undercurl

" Latex errors
let g:tex_no_error=1

