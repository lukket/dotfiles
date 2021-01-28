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
"set hlsearch " Highlight search results
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching, but do it smart
set incsearch " Search while typing
set backspace=2
set backupdir=~/.vim/backups
set directory=~/.vim/backups
set viewdir=~/.vim/views
set background=dark
set complete+=kspell
" Change invisible characters
set listchars=tab:▸\ ,eol:¬
" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

let mapleader=" "
let $LANG='en_US'

" Automatically change the current directory
autocmd BufEnter * silent! lcd %:p:h

call plug#begin('~/.vim/plugged')
	"Plug 'scrooloose/nerdtree'
	"map <C-n> :NERDTreeToggle<CR>
	Plug 'vim-airline/vim-airline'
	let g:airline_powerline_fonts = 1
	Plug 'vim-airline/vim-airline-themes'
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#tab_nr_type = 1
	Plug 'morhetz/gruvbox'
	Plug 'tpope/vim-fugitive'
	Plug 'shumphrey/fugitive-gitlab.vim'
	let g:fugitive_gitlab_domains = ['https://devlgitlab01.kg.local']
	set shellslash
	"Plug 'airblade/vim-gitgutter'
	Plug 'MTDL9/vim-log-highlighting'
	"Plug 'junegunn/goyo.vim'
	"Plug 'miyakogi/conoline.vim'
	"Plug 'OmniSharp/omnisharp-vim'
	"let g:OmniSharp_server_stdio = 1
	"let g:OmniSharp_highlight_types = 2
	"Plug 'dense-analysis/ale'
	"let g:ale_linters = { 'cs': ['OmniSharp'] }
	"let g:ale_fixers = { 'javascript': ['eslint'] }
	"Plug 'SidOfc/mkdx'
	"let g:mkdx#settings = { 'highlight': { 'enable': 1 }}
	"Plug 'leafOfTree/vim-vue-plugin'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'masukomi/vim-markdown-folding'
	Plug 'cespare/vim-toml'
	Plug 'tpope/vim-cucumber'
call plug#end()

colorscheme gruvbox

nnoremap <space> <nop>
nnoremap <leader>s :w<cr>
" Press F5 to delete all trailing whitespace
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
" Copy document to system clipboard
nnoremap <leader>c :%y+<CR>

nnoremap <leader>h :setlocal hlsearch!<CR>

inoremap jk <esc>

augroup filetype_javascript
	autocmd!
	autocmd FileType javascript setlocal tabstop=2
	autocmd FileType javascript setlocal shiftwidth=2
	autocmd FileType javascript setlocal expandtab
augroup END

augroup filetype_json
	autocmd!
	autocmd FileType json setlocal tabstop=2
	autocmd FileType json setlocal shiftwidth=2
	autocmd FileType json setlocal expandtab
augroup END

augroup filetype_yaml
	autocmd!
	autocmd FileType yaml setlocal tabstop=2
	autocmd FileType yaml setlocal shiftwidth=2
	autocmd FileType yaml setlocal expandtab
	autocmd FileType yaml setlocal foldmethod=indent
augroup END

augroup filetype_cs
	autocmd!
	autocmd FileType cs setlocal tabstop=4
	autocmd FileType cs setlocal shiftwidth=4
	autocmd FileType cs setlocal expandtab
augroup END

augroup filetype_vue
	autocmd!
	autocmd BufNewFile,BufRead *.vue setf vue
	autocmd FileType vue setlocal tabstop=2
	autocmd FileType vue setlocal shiftwidth=2
	autocmd FileType vue setlocal expandtab
augroup END

augroup filetype_xaml
	autocmd!
	autocmd BufNewFile,BufRead *.xaml setf xml
	autocmd FileType xml setlocal tabstop=4
	autocmd FileType xml setlocal shiftwidth=4
	autocmd FileType xml setlocal expandtab
augroup END

augroup filetype_gitcommit
	autocmd!
	autocmd FileType gitcommit setlocal spell
augroup END

augroup filetype_markdown
	autocmd!
	autocmd FileType markdown setlocal spell
	autocmd FileType markdown setlocal tabstop=2
	autocmd FileType markdown setlocal shiftwidth=2
	autocmd FileType markdown setlocal expandtab
	autocmd FileType markdown setlocal conceallevel=2
augroup END

augroup filetype_cucumber
	autocmd!
	autocmd FileType cucumber setlocal spell
	autocmd FileType cucumber setlocal spelllang=en,de
	autocmd FileType cucumber setlocal tabstop=2
	autocmd FileType cucumber setlocal shiftwidth=2
	autocmd FileType cucumber setlocal expandtab
augroup END

augroup filetype_notes
	autocmd!
	autocmd BufNewFile,BufRead notes.md setlocal spelllang=de,en
augroup END

augroup filetype_changelog
	autocmd!
	autocmd BufNewFile,BufRead CHANGELOG.md setlocal spell
augroup END

" Save and load views (e.g., folds) automatically
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview
