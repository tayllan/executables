#!/bin/bash
set -x #echo on

cd ~
echo ". .aliases" >> .bashrc

# Vim configurations
cat > .vimrc << EOL
syntax on
colorscheme murphy
set nocompatible
set autoindent
set ruler
set tabstop=4
set shiftwidth=4
set encoding=utf-8
set showcmd
set smarttab
set background=dark
set number
set hlsearch
set autoread
set magic
set showmatch
set nobackup
set nowb
set noswapfile
filetype plugin indent on

autocmd User plugin-template-loaded call s:template_keywords()
function! s:template_keywords()
    %s/<+FILE NAME+>/\=expand('%:t')/g
endfunction
autocmd User plugin-template-loaded
\   if search('<+CURSOR+>')
\   |   execute 'normal! "_da>'
\   |   endif

let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>
EOL

# My aliases
cat > .aliases << EOL
alias .='cd ../'
alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../../'
alias b-='cd -'
alias cd-d='cd ~/Desktop/'
alias dump-history='export HISTORY_TODAY="history$(date +"%y-%m-%d")" && cd ~/projects/terminal-history/ && history | cut -c 8- >> $HISTORY_TODAY && git add $HISTORY_TODAY && git commit -m "Adding $HISTORY_TODAY" && git push origin master'
EOL
