let $LANG='en_US'
" Line numbers
set  number relativenumber
" Disable line wrap
set nowrap
" Disable folding
"set nofoldenable
" Save and load foldings automatically
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
" enter the current millenium
set nocompatible
" enable syntax and plugins (for netrw)
syntax enable
" Enable file type detection and load pluging and indent files 
" depending on the file type
" (this is required by many plugins)
filetype plugin indent on
"" Search down into subfolders
"" Provides tab-completion for all file-related tasks
"set path+=**
"if has('win32')
"	set wildignore+=*\\bin\\*,*\\obj\\*,*j.swp,*.zip,*.exe
"endif
"if has('unix')
"	set wildignore+=*/node_modules/*,*/bower_components/*,~/DIS,~/temp,~/Downloads,~/Documents
"endif
" Display all matching files when we tab complete
set wildmenu
set wildmode=list:longest,full
" Tweaks for browsing
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
" Encoding
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
set termencoding=utf-8
" Searching
set hlsearch " Highlight search results
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching, but do it smart
set incsearch " Search while typing
" Make backspace work like most other programs
set backspace=2
" Change leader key
let mapleader=" "
" Enable syntax highlighting
syntax on
" Automatically change the current directory
autocmd BufEnter * silent! lcd %:p:h
" Plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
"Plug 'kien/ctrlp.vim'
"let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
"let g:ctrlp_follow_symlinks=1
""let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|bin|obj)|(\.(swp|ico|git|svn))$'
"if executable('ag')
"	let g:ctrlp_user_command = 'ag %s -l --ignore-case --nogroup --hidden --follow'
"endif
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-notes'
"let g:notes_directories = ['~/notes']
"let g:notes_suffix = '.md'
"Plug 'jkramer/vim-checkbox'
Plug 'SidOfc/mkdx'
let g:mkdx#settings     = { 'highlight': { 'enable': 1 },
                        \ 'enter': { 'shift': 1 },
                        \ 'links': { 'external': { 'enable': 1 } },
                        \ 'fold': { 'enable': 1 } }
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
Plug 'vim-airline/vim-airline-themes'
"let g:airline_theme='solarized'
"let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
Plug 'morhetz/gruvbox'
Plug('tpope/vim-fugitive')
set shellslash
Plug('airblade/vim-gitgutter')
Plug('MTDL9/vim-log-highlighting')
Plug('junegunn/goyo.vim')
Plug('miyakogi/conoline.vim')
Plug('OmniSharp/omnisharp-vim')
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2
Plug('dense-analysis/ale')
let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}
Plug('tpope/vim-commentary')
Plug('tpope/vim-surround')
call plug#end()
" Backup directories
set backupdir=~/.vim/backups
set directory=~/.vim/backups
" Theme
set background=dark
colorscheme gruvbox
" Xaml
au BufNewFile,BufRead *.xaml        setf xml
" Save files
nnoremap <leader>s :w<cr>
" Press F5 to delete all trailing whitespace
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
