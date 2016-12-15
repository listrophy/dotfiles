call pathogen#infect()

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-surround'
Bundle 'mustache/vim-mode'
Bundle 'heartsentwined/vim-ember-script'
Bundle 'hsitz/VimOrganizer'

Bundle 'NLKNguyen/papercolor-theme'
Bundle 'slim-template/vim-slim'
Bundle 'lambdatoast/elm.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'AndrewRadev/linediff.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'elixir-lang/vim-elixir'

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
