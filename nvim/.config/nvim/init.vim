call plug#begin()
" ================= looks and GUI stuff ================== "

Plug 'vim-airline/vim-airline'                          " airline status bar
Plug 'vim-airline/vim-airline-themes'                   " airline themes
Plug 'ryanoasis/vim-devicons'                           " powerline like icons for NERDTree
Plug 'hzchirs/vim-material'                             " material color themes
Plug 'luochen1990/rainbow'

" ================= Functionalities ================= "

"coc lang server and those shit
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'desmap/ale-sensible' | Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'css', 'less', 'scss', 'json',  'markdown',  'yaml', 'html'] }

" markdown
Plug 'dkarter/bullets.vim'                              " markdown bullet lists

" search
Plug 'wsdjeg/FlyGrep.vim'                               " project wide search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'                                " fuzzy search integration

" snippets
Plug 'honza/vim-snippets'                               " actual snippets
"Plug 'SirVer/ultisnips'                                 " snippets and shit

" visual
Plug 'majutsushi/tagbar'                                " side bar of tags
Plug 'scrooloose/nerdtree'                              " open folder tree
Plug 'jiangmiao/auto-pairs'                             " auto insert other paranthesis pairb
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
Plug 'lambdalisue/suda.vim'                             " save as sudo
Plug 'tpope/vim-fugitive'                               " git support
Plug 'tpope/vim-surround'                               " surround stuff with stuff
Plug 'psliwka/vim-smoothie'                             " some very smooth ass scrolling
Plug 'farmergreg/vim-lastplace'                         " open files at the last edited place
Plug 'tpope/vim-eunuch'                                 " run common unix commands inside vim
Plug 'romainl/vim-cool'                                 " disable hl until another search is performed
Plug 'wellle/tmux-complete.vim'                         " complete words from a tmux panes

call plug#end()

"Visual Stuff

let g:material_style='oceanic'
set background=dark
colorscheme vim-material
let g:airline_theme='material'
highlight Pmenu guibg='00010a' guifg=white              " popup menu colors
highlight Comment gui=bold                              " bold comments
highlight Normal gui=none
highlight NonText guibg=none
highlight clear SignColumn                              " use number color for sign colum color
hi Search guibg=#48576e                                 " search string highlight color
autocmd ColorScheme * highlight VertSplit cterm=NONE    " split color

" colors for git(especially the gutter)
hi DiffAdd guibg='#0f111a'
hi DiffChange guibg='#0f111a'

" coc multi cursor highlight color
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2
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
"set tw=800                                               " auto wrap lines that are longer than that
set emoji                                               " enable emojis
let g:indentLine_setConceal = 0                         " actually fix the annoying markdown links conversion
au BufEnter * set fo-=c fo-=r fo-=o                     " stop annying auto commenting on new lines
set undofile                                            " enable persistent undo
set undodir=~/.nvim/tmp                                 " undo temp file directory
set ttyfast                                             " faster scrolling
set lazyredraw                                          " faster scrolling

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

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

" performance tweaks
set nocursorline
set nocursorcolumn
set scrolljump=7
set lazyredraw
set synmaxcol=180
set re=1

" required by coc
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes

let g:material_style='oceanic'
set background=dark
colorscheme vim-material
let g:airline_theme='material'
highlight Pmenu guibg='00010a' guifg=white              " popup menu colors
highlight Comment gui=bold                              " bold comments
highlight Normal gui=none
highlight NonText guibg=none
highlight clear SignColumn                              " use number color for sign colum color

" list of the extensions required
let g:coc_global_extensions = [
            \'coc-yank',
            \'coc-highlight',
            \'coc-prettier',
            \'coc-pairs',
            \'coc-json',
            \'coc-css',
            \'coc-html',
            \'coc-tsserver',
            \'coc-yaml',
            \'coc-lists',
            \'coc-snippets',
            \'coc-python',
            \'coc-xml',
            \'coc-word',
            \'coc-syntax',
            \'coc-emoji',
            \'coc-git',
            \]
" ALE
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'c' : ['clang-format'],
\   'cpp' : ['clang-format'],
\}
let g:ale_linters = {'cpp': ['clang']}

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'

"auto save
let g:auto_save = 1                                     " enable AutoSave on Vim startup
let g:auto_save_no_updatetime = 1                       " do not change the 'updatetime' option
let g:auto_save_in_insert_mode = 0                      " do not save while in insert mode
let g:auto_save_silent = 1

"checkbox && bullets
let g:bullets_enable_file_type =['markdown','text','gitcommit','*']                   "i enable this shit for all file types
"rainbow
let g:rainbow_active = 1

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

let g:grammarous#languagetool_cmd = 'languagetool'
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0,
            \ }
let g:grammarous#enabled_rules = {'*' : ['PASSIVE_VOICE']}
let g:grammarous#disabled_rules = {
            \ '*' : ['WHITESPACE_RULE', 'EN_QUOTES'],
            \ 'help' : ['WHITESPACE_RULE', 'EN_QUOTES', 'SENTENCE_WHITESPACE', 'UPPERCASE_SENTENCE_START'],
            \ }
let g:grammarous#enabled_categories = {'*' : ['PUNCTUATION']}
let g:grammarous#disabled_categories = {
            \ '*' : ['PUNCTUATION'],
            \ 'help' : ['PUNCTUATION', 'TYPOGRAPHY'],
            \ }
abbrev ** ●

" the essentials
let mapleader=","
nnoremap ; :
nmap \ <leader>q
map <F6> :Startify <CR>
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>t :call TrimWhitespace()<CR>
nmap <leader>q :bd<CR>
nmap <leader>w :w<CR>
nmap <leader>f :Files<CR>
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>
noremap <leader>e :PlugInstall<CR>
noremap <C-q> :q<CR>
inoremap jj <ESC>
inoremap xx <ESC>:ToggleCheckbox<CR>

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
