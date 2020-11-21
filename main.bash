#!/bin/bash
set -x #echo on

cd ~
echo ". .aliases" >> .bashrc
echo ". .work-aliases" >> .bashrc

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
# Base aliases
alias .='cd ../'
alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../../'
alias b-='cd -'
alias cd-h='cd /c/Users/Tayllan'
alias cd-d='cd-h && cd Desktop'
alias cd-p='cd-h && cd projects'
alias e-aliases='vim ~/.aliases'
alias r-aliases='source ~/.aliases && source ~/.work-aliases'
alias ungron='gron --ungron'

alias dump-history='export HISTORY_TODAY="history$(date +"%y-%m-%d")" && cd-p && cd terminal-history/ && history | cut -c 8- >> $HISTORY_TODAY && git add $HISTORY_TODAY && git commit -m "Adding $HISTORY_TODAY" && git push origin master'

alias get-uuid='cat /proc/sys/kernel/random/uuid | clip.exe'

# Git aliases
alias s='git status'
alias diff='git diff'
alias pull='git pull'
alias push='git push'
alias gp='git push'
alias gp-up='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gc='git checkout'
alias destroy='git checkout HEAD -- .'
alias prune-branches="git remote prune origin && git branch -vv | grep 'origin/.*: gone]' | awk '{print $1}' | xargs git branch -d"
stash() { git stash save -u "$1"; }
pop() { git stash pop stash@{$1}; }
new-issue() { git checkout -b "issue-$1"; }
new-feat() { git checkout -b "feature-$1"; }
new-hotfix() { git checkout -b "hotfix-$1"; }
commit-issue() { git commit -m "$(git rev-parse --abbrev-ref HEAD) - $1"; }
EOL

# My work aliases
cat > .work-aliases << EOL
# Work aliases
EOL
