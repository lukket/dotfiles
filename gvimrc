" Start in home directory
cd ~
" Disable all GUI elements
set guioptions=
" Start gVim maximized
set lines=999 columns=999
au GUIEnter * simalt ~x
" Disable mouse
set mouse=
set ttymouse=
" Use font with Powerline symbols
" https://github.com/powerline/fonts/blob/master/SourceCodePro/Source%20Code%20Pro%20Light%20for%20Powerline.otf
set guifont=Source_Code_Pro_Light:h10:cANSI
" Set GIT executable for gVim
let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'
