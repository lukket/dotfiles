" Auto change directoty
autocmd BufEnter * silent! lcd %:p:h
" Enable syntax and plugins (for netrw)
"syntax enable
"filetype plugin on
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu
set wildmode=list:longest,full 
" Build ctags
command! MakeTags !ctags -R
" Tweaks for browsing
"let g:netrw_banner=0        " disable annoying banner
"let g:netrw_liststyle=3     " tree view
" Show relative line numbers
set number relativenumber
" No line wraps
set nowrap
" Plugins
call plug#begin('~/.vim/plugged')
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
let g:notes_directories = ['~/notes']
Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
call plug#end()
" Theme
set background=dark
colorscheme gruvbox
" Xaml
au BufNewFile,BufRead *.xaml        setf xml
