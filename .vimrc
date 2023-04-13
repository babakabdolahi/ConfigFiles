" General
:set number
:set wrap
:set linebreak
:set breakindent
:set laststatus=2
" :set columns=80
:set ai
" :set paste
syntax enable
filetype plugin indent on

" Autocomplete 
filetype plugin on
:set omnifunc=syntaxcomplete#Complete
" autocmd FileType perl
" omnicompete options
:set completeopt+=noinsert
:set cot+=preview
:set cot+=popup
:set cot+=menuone,longest
" :inoremap <Tab><Tab> <c-x><c-o>
" setting ale autocomplete
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc

"tab size
:set tabstop=4
:set shiftwidth=4
:set expandtab
" make goimports to happen on save
" let g:go_fmt_command = "goimports"
" color column
" highlight ColorColumn ctermbg=gray
" set colorcolumn=80

" this is because of tmux
:set background=dark

" :inoremap . .<c-x><c-o> 
" :inoremap a a<c-x><c-o>

" " for auto reloading
" :set autoread<
"
" changing the color of line numbers. 
highlight LineNr ctermfg=grey

:set hlsearch

" customizing file explorer.
let g:netrw_banner = 0
let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
let g:netrw_winsize = 20
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

" Open the directory of the file open
" :set modifiable
" :set autochdir
" " autocmd BufEnter * silent! lcd %:p:h
" let g:netrw_keepdir= 0

" Rust configurations
let g:rustfmt_autosave = 1

" Some mappings
:nnoremap <space> :nohlsearch<CR>
:nnoremap ,b :ls<CR>:buffer<Space>
:nnoremap <F2> :Files<CR>
:nnoremap <F3> :Ag<CR>
:nnoremap <F4> :cd %:p:h<CR>
:nnoremap :ls   :!ls
" :nnoremap :pwd  :!pwd

" linting for perl
let g:ale_linters = {'perl': ['perl','perlcritic'] }
" let g:ale_linters = {'go': ['gofmt', 'golint', 'go vet', 'gometalinter'], 'perl': ['perl','perlcritic'] }

"""""""""""""""""""""""""""""""""""""""""
 " Vim Plug
 call plug#begin('~/.vim/plugged')

"  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
 Plug 'https://github.com/tomtom/tcomment_vim.git'
 Plug 'mattn/emmet-vim'
 Plug 'vim-perl/vim-perl' , { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'vim-airline/vim-airline'
 Plug 'tpope/vim-fugitive'
 Plug 'rust-lang/rust.vim'
 Plug 'vim-scripts/AutoComplPop'
 Plug 'dense-analysis/ale'
 call plug#end()

