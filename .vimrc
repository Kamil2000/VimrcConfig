call plug#begin()
Plug 'sjl/badwolf'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'qpkorr/vim-bufkill'
Plug 'rrethy/vim-illuminate'
Plug 'tpope/vim-eunuch'
Plug 'w0rp/ale'
Plug 'prabirshrestha/asyncomplete.vim'
call plug#end()


if has('gui_running')
    if(has('win32') || has("win64"))
        set guifont=Consolas:h11:cANSI
    endif
    if (has('gui_gtk2') || has('gui_gtk3'))
        set guifont=Ubuntu \Mono\ Regular\ 13
    endif
endif

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

filetype plugin on
set number
set linebreak
set showbreak=+++
set textwidth=200
set showmatch
set visualbell

set hlsearch
set noignorecase
set incsearch

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
syntax on

autocmd FileType c,cpp,cxx,cc,h,hpp,hxx,hh setlocal cindent
autocmd FileType java setlocal cindent
autocmd FileType scala setlocal cindent
autocmd FileType perl setlocal cindent
autocmd FileType js,ts setlocal cindent
autocmd FileType go setlocal cindent

function! Vimrc_SetBracketsMapping() abort
    inoremap <buffer> {<CR> {<CR>}<Esc>O
endfunction

autocmd FileType c,cpp,cxx,cc,h,hpp,hxx,hh call Vimrc_SetBracketsMapping()
autocmd FileType java call Vimrc_SetBracketsMapping()
autocmd FileType scala call Vimrc_SetBracketsMapping()
autocmd FileType perl call Vimrc_SetBracketsMapping()
autocmd FileType js,ts call Vimrc_SetBracketsMapping()
autocmd FileType go call Vimrc_SetBracketsMapping()

" let g:ackprog='ag --nogroup --nocolor --column --smart-case'

colorscheme badwolf
set noswapfile
set nobackup
set nowritebackup
autocmd Filetype netrw setl buhidden=wipe

set complete=.,w,b,k

let g:Illuminate_ftblacklist=['nerttree', 'netrw']
let g:Illuminate_delay=150
let g:Illuminate_highlightUnderCursor=1
let g:Illuminate_reltime_delay=0.1

hi illuminatedWord ctermbg=53

command WNERDTree NERDTree | vertical resize 70
command WideWindow vertical resize 70

let g:ale_linters_explicit = 1
let g:ale_linters={}

let g:asyncomplete_auto_popup = 0
let g:asyncomplete_auto_completeopt = 0
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
se completeopt=menu,menuone,longest,popup,noinsert,noselect "" popup/preview

if exists('g:local_vimrc_script')
    execute "source " . g:local_vimrc_script
endif
