" Leader
let mapleader = ','
nmap <leader>e :Explore<cr>
nmap <leader>b :Buffers<cr>
imap jj <Esc>
nmap qq :q!<cr>
nmap <leader>w <C-W>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>
nmap <leader>f :Files<cr>
nmap <leader>a :Ag
nnoremap <c-p> :FZF<CR>
nmap <leader>j :ALEFix<cr>
nnoremap ss :wa<cr>
map <leader>y :YRShow<cr>
map <leader>s :norm yiw<cr> :%s/<C-r>"//g<left><left>

" Regex engine NFA
set re=2

" Banner cero
let g:netrw_banner = 0

" Disable annoying beeping
set noerrorbells
set vb t_vb=

" No wrapping
set textwidth=0
set wrapmargin=0

" Colorscheme
syntax enable
set t_Co=256
set cursorline
colorscheme onehalfdark
" colorscheme onehalflight
hi Comment gui=NONE cterm=NONE

" Encoding utf 8
set encoding=utf-8
set fileencoding=utf-8

" Set CSV delimiter
let g:polyglot_disabled = ['csv']

" Set numbers
set number relativenumber
" set number

" Set scroll
set scrolloff=10

" Use the system clipboard
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'

" Recognize file types and indent configuration
filetype plugin indent on " On pressing tab, insert 2 spaces
set expandtab " show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2 " when indenting with '>', use 2 spaces width
set shiftwidth=2

" Automatically removing all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Backup
set backup
set noswapfile
set directory=~/.vim/temp
set backupdir=~/.vim/temp
set undodir=~/.vim/temp

" Satus line
set laststatus=2
set statusline=
set statusline+=%1*\ %l/%L
set statusline+=%1*\ [%02c]
set statusline+=%2*\ %F
set statusline+=\ %m

" Install Vundle
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif
set rtp+=~/.vim/bundle/Vundle.vim/

" :PluginInstall
call vundle#begin()
Plugin 'neoclide/coc.nvim', {'branch': 'master' }
Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim' " TypeScript syntax
Plugin 'vim-scripts/YankRing.vim'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'wincent/ferret', { 'on': ['Ack', 'Acks'] }
Plugin 'sonph/onehalf', { 'rtp': 'vim' }
" Plugin 'w0rp/ale'
Plugin 'dense-analysis/ale'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'alvan/vim-closetag'
Plugin 'airblade/vim-gitgutter'
Plugin 'mg979/vim-visual-multi'
Plugin 'github/copilot.vim'
call vundle#end()

" FZF config
let g:fzf_preview_window = ''
" ignore node_modules when searching files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" closetag configuration
" In vim execute this :CloseTagEnableBuffer
let g:closetag_filetypes = 'html,xhtml,jsx,javascript,tsx'
let g:closetag_shortcut = '>'

let g:ale_set_highlights = 0
let g:ale_virtualtext = 0
let g:ale_virtualtext_cursor = 0

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>fp  <Plug>(coc-fix-current)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'typescriptreact': ['eslint', 'prettier'],
\}
