set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
" Plugin 'adamlowe/vim-slurper'
" Plugin 'tpope/vim-abolish'
" Plugin 'scrooloose/nerdcommenter'
" Plugin 'vim-scripts/bufkill.vim'
" Plugin 'pangloss/vim-javascript'
Plugin 'gmarik/vundle'

" general vim/commands
Plugin 'tpope/vim-pathogen'
Plugin 'tpope/vim-repeat'
Plugin 'terryma/vim-multiple-cursors'

" syntax
Plugin 'kchmck/vim-coffee-script'
Plugin 'leshill/vim-json'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tdesikan/vim-tritium'
Plugin 'slim-template/vim-slim'
Plugin 'digitaltoad/vim-jade'
Plugin 'wavded/vim-stylus'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'fatih/vim-go'
Plugin 'wting/rust'

" ruby
Plugin 'tpope/vim-endwise'
Plugin 'vim-ruby/vim-ruby'

" clojure
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'
Plugin 'guns/vim-clojure-static'
" filetype off

" formatting
Plugin 'godlygeek/tabular'
Plugin 'jgdavey/vim-blockle'
runtime! macros/matchit.vim " required by blockle
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

" linting
Plugin 'walm/jshint.vim'

" files/search/buffers
Plugin 'scrooloose/nerdtree'
Plugin 'duff/vim-bufonly'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'

" tags
Plugin 'tpope/vim-ragtag'

" git
" Plugin 'gregsexton/gitv'
" Plugin 'tpope/vim-git'
Plugin 'tpope/vim-fugitive'

" rails
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'

" tmux
" Plugin 'benmills/vimux'
" Plugin 'jgdavey/vim-turbux'

" markdown
Plugin 'JamshedVesuna/vim-markdown-preview'

" colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'endel/vim-github-colorscheme'
Plugin 'jgdavey/vim-railscasts'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'therubymug/vim-pyte'
Plugin 'tpope/vim-vividchalk'
Plugin 'croaker/mustang-vim'
Plugin 'wgibbs/vim-irblack'

call vundle#end()
filetype plugin indent on

set visualbell
set guifont=Source\ Code\ Pro\ for\ Powerline:h13
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set shell=bash

augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=120 lines=70
augroup END

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
