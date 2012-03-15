call pathogen#infect()

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
