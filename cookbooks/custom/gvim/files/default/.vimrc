set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-projectionist'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'kien/ctrlp.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/nerdTree'
Plugin 'benmills/vimux'
Plugin 'pgr0ss/vimux-ruby-test'
Plugin 'airblade/vim-gitgutter'
Plugin 'Yggdroot/indentLine'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'vim-scripts/paredit.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'vim-scripts/php.vim'
Plugin 'wdalmut/vim-phpunit'

"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set number " show numbers
set showmatch " show matching brackets
set autoindent
set noswapfile

set clipboard+=unnamed

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

syntax on "syntax highlighting
colorscheme onedark
set background=dark
let mapleader = ","

" clean trailing whitespace
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>

" set up highlight group & retain through colorscheme changes
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd BufWritePre * :%s/\s\+$//e " Delete trailing spaces on write

" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=blue guibg=red
" map <silent> <LocalLeader>ws :highlight clear ExtraWhitespace<CR>

" highlight too-long lines
autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%126v.*/
highlight LineLengthError ctermbg=black guibg=black
autocmd ColorScheme * highlight LineLengthError ctermbg=black guibg=black

let g:gitgutter_enabled = 1
let g:gitgutter_highlight_lines = 0
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

" Elixir
:map <leader>rt :!clear; mix test<CR>

" Ruby
:map <leader>be :!clear; bundle exec rspec<CR>
:map <leader>t :RunRubyFocusedTest<CR>
:map <leader>r :RunAllRubyTests<CR>

" Clojure
setlocal lispwords+=describe
setlocal lispwords+=it

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['black',       'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound


" colors of matching brackets
hi MatchParen cterm=NONE ctermbg=blue ctermfg=red


" Nerdtree
map <silent> <leader>nt :NERDTreeToggle<CR>
map <silent> <leader>nr :NERDTree<CR>
map <silent> <leader>nf :NERDTreeFind<CR>
let NERDTreeShowHidden=1

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

