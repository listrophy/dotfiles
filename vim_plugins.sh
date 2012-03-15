#!/usr/bin/env bash

function should_install_vim_plugins {
  proceed=""
  while [ "${proceed}" != "y" -a "${proceed}" != "n" ]
  do
    echo "Would you like to install some vim plugins? (y/n)"
    read proceed
  done
  [[ "$proceed" == "y" ]] && return 0 || return 1
}

function install_vim_plugins {
  should_install_vim_plugins
  if [[ $? -eq 0 ]]
  then
    #TODO: implement
    echo ok
  fi
}
