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
	Plug 'vim-airline/vim-airline'
	let g:airline_powerline_fonts = 1
	Plug 'vim-airline/vim-airline-themes'
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#tab_nr_type = 1
	" Colorscheme
	Plug 'morhetz/gruvbox'
	Plug 'tyrannicaltoucan/vim-deep-space'
	Plug 'tomasr/molokai'
	Plug 'joshdick/onedark.vim'
	Plug 'sonph/onehalf', {'rtp': 'vim/'}
	Plug 'tomasiser/vim-code-dark'
	" Git
	Plug 'tpope/vim-fugitive'
	Plug 'shumphrey/fugitive-gitlab.vim'
	set shellslash
	" Autocomplete
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" Syntax highlighting for almost every file type
	Plug 'sheerun/vim-polyglot'
	let g:markdown_folding = 1
	let g:vim_markdown_new_list_item_indent = 0
call plug#end()

colorscheme codedark

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

augroup filetype_html
	autocmd!
	autocmd FileType html setlocal tabstop=2
	autocmd FileType html setlocal shiftwidth=2
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
	autocmd FileType markdown setlocal noexpandtab
augroup END

augroup filetype_changelog
	autocmd!
	autocmd BufNewFile,BufRead CHANGELOG.md setlocal spell
augroup END

" Save and load views (e.g., folds) automatically
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview
