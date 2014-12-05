set nocompatible

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" BUNDLES
" Bundle 'adamlowe/vim-slurper'
" Bundle 'tpope/vim-abolish'
" Bundle 'scrooloose/nerdcommenter'
" Bundle 'vim-scripts/bufkill.vim'
" Bundle 'pangloss/vim-javascript'
Bundle 'gmarik/vundle'

" general vim/commands
Bundle 'tpope/vim-pathogen'
Bundle 'tpope/vim-repeat'
Bundle 'terryma/vim-multiple-cursors'

" syntax
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tdesikan/vim-tritium'
Bundle 'slim-template/vim-slim'
Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'
Bundle 'rylnd/vim-javascript-syntax'
Bundle 'wting/rust'

" ruby
Bundle 'tpope/vim-endwise'
Bundle 'vim-ruby/vim-ruby'

" clojure
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'guns/vim-clojure-static'
" filetype off

" formatting
Bundle 'godlygeek/tabular'
Bundle 'jgdavey/vim-blockle'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

" linting
Bundle 'walm/jshint.vim'

" files/search/buffers
Bundle 'scrooloose/nerdtree'
Bundle 'duff/vim-bufonly'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'Lokaltog/vim-powerline'

" tags
Bundle 'tpope/vim-ragtag'

" git
" Bundle 'gregsexton/gitv'
" Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'

" rails
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'

" tmux
Bundle 'benmills/vimux'
Bundle 'jgdavey/vim-turbux'

" colorschemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'endel/vim-github-colorscheme'
Bundle 'jgdavey/vim-railscasts'
Bundle 'jpo/vim-railscasts-theme'
Bundle 'therubymug/vim-pyte'
Bundle 'tpope/vim-vividchalk'
Bundle 'croaker/mustang-vim'
Bundle 'wgibbs/vim-irblack'

filetype plugin indent on

set visualbell
set guifont=Source\ Code\ Pro:h13
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set shell=bash

augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=120 lines=70
augroup END

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
