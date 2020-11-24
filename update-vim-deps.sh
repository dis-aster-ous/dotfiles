#!/bin/bash

cd $(dirname $0)

cd .vim/pack/bundle/start
ls
for dir in *
do
  cd $dir
  git checkout master
  git pull
  git submodule update --init --recursive
  cd ..
done

YouCompleteMe/install.py --all

git commit -am 'auto-update vim deps'
