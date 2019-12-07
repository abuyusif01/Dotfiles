call plug#begin()
" ================= looks and GUI stuff ================== "

Plug 'vim-airline/vim-airline'                          " airline status bar
Plug 'vim-airline/vim-airline-themes'                   " airline themes
Plug 'ryanoasis/vim-devicons'                           " powerline like icons for NERDTree
Plug 'junegunn/rainbow_parentheses.vim'                 " rainbow paranthesis
Plug 'hzchirs/vim-material'                             " material color themes
Plug 'junegunn/goyo.vim'                                " zen mode
Plug 'amix/vim-zenroom2'                                " more focus in zen mode

" ================= Functionalities ================= "

" autocompletion using ncm2 (much lighter and faster than coc)
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'filipekiss/ncm2-look.vim'
Plug 'fgrsnau/ncm-otherbuf'
Plug 'fgrsnau/ncm2-aspell'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'ncm2/ncm2-pyclang'
Plug 'davidhalter/jedi-vim'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-vim' | Plug 'Shougo/neco-vim'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-html-subscope'
Plug 'ncm2/ncm2-markdown-subscope'

" markdown
Plug 'jkramer/vim-checkbox', { 'for': 'markdown' }
Plug 'dkarter/bullets.vim'                              " markdown bullet lists

" search
Plug 'wsdjeg/FlyGrep.vim'                               " project wide search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                                " fuzzy search integration

" snippets
Plug 'honza/vim-snippets'                               " actual snippets
Plug 'SirVer/ultisnips'                                 " snippets and shit

" visual
Plug 'majutsushi/tagbar'                                " side bar of tags
Plug 'scrooloose/nerdtree'                              " open folder tree
Plug 'jiangmiao/auto-pairs'                             " auto insert other paranthesis pairb
Plug 'alvan/vim-closetag'                               " auto close html tags
Plug 'Yggdroot/indentLine'                              " show indentation lines
Plug 'chrisbra/Colorizer'                               " show actual colors of color codes
Plug 'google/vim-searchindex'                           " add number of found matching search items

" languages
Plug 'sheerun/vim-polyglot'                             " many languages support
Plug 'tpope/vim-liquid'                                 " liquid language support

" other
Plug 'Chiel92/vim-autoformat'                           " an actually good and light auto formatter
Plug 'tpope/vim-commentary'                             " better commenting
Plug 'rhysd/vim-grammarous'                             " grammer checker
Plug 'tpope/vim-sensible'                               " sensible defaults
Plug 'lambdalisue/suda.vim'                             " save as sudo
Plug '907th/vim-auto-save'                              " auto save changes
Plug 'mhinz/vim-startify'                               " cool start up screen

call plug#end()

"Visual Stuff

let g:material_style='oceanic'
set background=dark
colorscheme vim-material
let g:airline_theme='material'
highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE

" ==================== general config ======================== "

set termguicolors                                       " Opaque Background
set mouse=a                                             " enable mouse scrolling
set clipboard+=unnamedplus                              " use system clipboard by default

" ===================== Other Configurations ===================== "

filetype plugin indent on                               " enable indentations
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent              " tab key actions
set incsearch ignorecase smartcase hlsearch             " highlight text while seaching
set list listchars=trail:»,tab:»-                       " use tab to navigate in list mode
set fillchars+=vert:\▏                                  " requires a patched nerd font (try furaCode)
set wrap breakindent                                    " wrap long lines to the width sset by tw
set encoding=utf-8                                      " text encoding
set number                                              " enable numbers on the left
set number relativenumber                               " relative numbering to current line (current like is 0 )
set title                                               " tab title as file file
set conceallevel=2                                      " set this so we womt break indentation plugin
set splitright                                          " open vertical split to the right
set splitbelow                                          " open horizontal split to the bottom
set tw=80                                               " auto wrap lines that are longer than that
set emoji                                               " enable emojis
let g:indentLine_setConceal = 0                         " actually fix the annoying markdown links conversion
au BufEnter * set fo-=c fo-=r fo-=o                     " stop annying auto commenting on new lines
set undofile                                            " enable persistent undo
set undodir=~/.nvim/tmp                                 " undo temp file directory
set ttyfast                                             " faster scrolling
set lazyredraw                                          " faster scrolling

" Airline
let g:airline_powerline_fonts = 0
let g:airline#themes#clean#palette = 1
call airline#parts#define_raw('linenr', '%l')
call airline#parts#define_accent('linenr', 'bold')
let g:airline_section_z = airline#section#create(['%3p%%  ',
\ g:airline_symbols.linenr .' ', 'linenr', ':%c '])
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'        " show only file name on tabs

" use a different buffer for dd
nnoremap d "_d
vnoremap d "_d

" emulate windows copy, cut behavior
noremap <LeftRelease> "+y<LeftRelease>
noremap <C-c> "+y<CR>
noremap <C-x> "+d<CR>

" switch between splits using ctrl + {h,j,k,l}
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" select text via ctrl+shift+arrows in insert mode
inoremap <C-S-left> <esc>vb
inoremap <C-S-right> <esc>ve
