call plug#begin('~/.vim/plugged')

" Yes, I am a sneaky snek now
Plug 'ambv/black'

" Plebvim lsp Plugins
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

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Debugger Plugins
Plug 'mfussenegger/nvim-dap'
Plug 'Pocco81/DAPInstall.nvim'
Plug 'szw/vim-maximizer'

" Snippets
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

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'rakr/vim-one' " Theme OneDark

Plug 'mhinz/vim-rfc'

" prettier
Plug 'sbdchd/neoformat'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'junegunn/fzf' " Fuzzy finder
Plug 'tpope/vim-fugitive' " A Git wrapper
Plug 'airblade/vim-gitgutter' " Show gitdiff in the gutter

" Lintng like a god
Plug 'neomake/neomake'
Plug 'cappyzawa/fly-lint.vim' " FLY CLI Linting
Plug 'tpope/vim-commentary' " Auto-comment blocks of text

Plug 'ryanoasis/vim-devicons'

Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'sheerun/vim-polyglot' " Programming languages 
Plug 'jiangmiao/auto-pairs' " Completion of brackets, parenthesis, quotes etc
Plug 'preservim/tagbar' " File outliner such as class/variable/function identifiers
Plug 'dyng/ctrlsf.vim' " File super search
Plug 'Yggdroot/indentLine' " Indentation levels

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
