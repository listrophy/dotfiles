#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NO_COLOR='\033[0m'

for i in git curl
do
  which $i || (
    echo -e "${RED}ERROR: You must have $i installed${NO_COLOR}"
    exit 1
  )
done

echo
echo 'Updating dotfiles...'
echo

THIS_DIR="$( cd "$( dirname "$0" )" && pwd )"

#.gitconfig
echo -e "${GREEN}updating gitconfig${NO_COLOR}"
source ${THIS_DIR}/setup_gitconfig.sh

#.bashrc
#.bash_login
#.vimrc
for i in .bashrc .bash_login .vimrc
do
  output=$(ln -s ${THIS_DIR}/${i} ${HOME}/.bashrc 2>&1)
  if [[ $? -eq 0 ]]
  then
    echo -e "${GREEN}Linked ${i}${NO_COLOR}"
  else
    echo -e "${RED}Could not link ${i}:\n  $output${NO_COLOR}"
  fi
done

#.vim/
mkdir -f ${HOME}/.vim # don't care if it already exists

#vim-pathogen
mkdir -p ${HOME}/.vim/{autoload,bundle} && \
  curl -so ${HOME}/.vim/autoload/pathgen.vim \
    https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim

#.vim/bundle/
mkdir ${HOME}/.vim/bundle
if [[ $? -eq 0 ]]
then
  echo -e "${GREEN}Created .vim/bundle/${NO_COLOR}"

  source ${THIS_DIR}/vim_plugins.sh
  install_vim_plugins
else
  echo -e "${RED}Could not create .vim/bundle/${NO_COLOR}"
fi

echo
