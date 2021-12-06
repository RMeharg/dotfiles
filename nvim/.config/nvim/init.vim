call plug#begin('~/.vim/plugged')

Plug 'rakr/vim-one' " Theme OneDark
Plug 'mhinz/vim-rfc' " RFC doc searcher
Plug 'sbdchd/neoformat' " Formatting
Plug 'junegunn/fzf' " Fuzzy finder
Plug 'tpope/vim-fugitive' " A Git wrapper
Plug 'airblade/vim-gitgutter' " Show gitdiff in the gutter
Plug 'neomake/neomake' " Lintng like a god
Plug 'cappyzawa/fly-lint.vim' " FLY CLI Linting
Plug 'tpope/vim-commentary' " Auto-comment blocks of text
Plug 'preservim/nerdtree' " The most awesome vim folder tree plugin with \
Plug 'ryanoasis/vim-devicons' " Icons in nerdtree requires homebrew fonts
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Color nerdtree files
Plug 'sheerun/vim-polyglot' " Programming languages 
Plug 'jiangmiao/auto-pairs' " Completion of brackets, parenthesis, quotes etc
Plug 'preservim/tagbar' " Find class/variable/function identifiers in files
Plug 'dyng/ctrlsf.vim' " File super search
Plug 'Yggdroot/indentLine' " Indentation levels

"Language server
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" TOOD: Unsorted mess of plugins
Plug 'ambv/black'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'mattn/emmet-vim'
" Plug 'nvim-lua/completion-nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'
" Plug 'tjdevries/nlua.nvim'
" Plug 'tjdevries/lsp_extensions.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'mfussenegger/nvim-dap'
Plug 'Pocco81/DAPInstall.nvim'
Plug 'szw/vim-maximizer'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'rust-lang/rust.vim'
Plug 'darrikonn/vim-gofmt'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'theprimeagen/vim-be-good'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-projectionist'
Plug 'tomlion/vim-solidity'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

call plug#end()

let mapleader = " "

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Smart way to move between panes
map <c-up> <C-w><up>
map <c-down> <C-w><down>
map <c-left> <C-w><left>
map <c-right> <C-w><right>

" Plugin Configs
call neomake#configure#automake('w')
let g:neomake_virtualtext_current_error = 0

noremap <leader>/ :Commentary<cr>
nnoremap \ :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:neoformat_basic_format_align = 1 " Enable alignment
let g:neoformat_basic_format_retab = 1 " Enable tab to spaces conversion
let g:neoformat_basic_format_trim = 1 " Enable trimmming of trailing whitespace
