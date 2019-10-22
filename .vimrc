syntax enable
" Enable file type detection and load pluging and indent files
" depending on the file type
" (this is required by many plugins)
filetype plugin indent on
set number relativenumber
set nowrap
set wildmenu
set wildmode=list:longest,full
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
set termencoding=utf-8
set hlsearch " Highlight search results
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching, but do it smart
set incsearch " Search while typing
set backspace=2
set backupdir=~/.vim/backups
set directory=~/.vim/backups
set background=dark

let mapleader=" "
let $LANG='en_US'

" Automatically change the current directory
autocmd BufEnter * silent! lcd %:p:h

call plug#begin('~/.vim/plugged')
	Plug 'scrooloose/nerdtree'
	map <C-n> :NERDTreeToggle<CR>
	Plug 'vim-airline/vim-airline'
	let g:airline_powerline_fonts = 1
	Plug 'vim-airline/vim-airline-themes'
	let g:airline#extensions#tabline#enabled = 1
	Plug 'morhetz/gruvbox'
	Plug 'tpope/vim-fugitive'
	set shellslash
	Plug 'airblade/vim-gitgutter'
	Plug 'MTDL9/vim-log-highlighting'
	Plug 'junegunn/goyo.vim'
	Plug 'miyakogi/conoline.vim'
	Plug 'OmniSharp/omnisharp-vim'
	let g:OmniSharp_server_stdio = 1
	let g:OmniSharp_highlight_types = 2
	Plug 'dense-analysis/ale'
	let g:ale_linters = {
	\ 'cs': ['OmniSharp']
	\}
	Plug 'SidOfc/mkdx'
	let g:mkdx#settings = { 'highlight': { 'enable': 1 }}
call plug#end()

colorscheme gruvbox

nnoremap <space> <nop>
nnoremap <leader>s :w<cr>
nnoremap <leader>- ddp
nnoremap <leader>_ ddkP
nnoremap <leader>sv :so $MYVIMRC<cr>
nnoremap <leader>ev :e $MYVIMRC<cr>
" Press F5 to delete all trailing whitespace
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

inoremap jk <esc>

augroup filetype_javascript
	autocmd!
	autocmd FileType javascript setlocal tabstop=2
	autocmd FileType javascript setlocal shiftwidth=2
	autocmd FileType javascript setlocal expandtab
augroup END

augroup filetype_cs
	autocmd!
	autocmd FileType cs setlocal tabstop=4
	autocmd FileType cs setlocal shiftwidth=4
	autocmd FileType cs setlocal expandtab
augroup END

augroup filetype_vue
	autocmd!
	autocmd BufNewFile,BufRead *.vue setf html
	autocmd FileType javascript setlocal tabstop=2
	autocmd FileType javascript setlocal shiftwidth=2
	autocmd FileType javascript setlocal expandtab
augroup END

augroup filetype_xaml
	autocmd!
	autocmd BufNewFile,BufRead *.xaml setf xml
augroup END

augroup filetype_gitcommit
	autocmd!
	autocmd FileType gitcommit setlocal spell
augroup END

augroup filetype_notes
	autocmd!
	autocmd BufNewFile,BufRead notes.md setlocal spell
	autocmd BufNewFile,BufRead notes.md setlocal spelllang=de
augroup END
