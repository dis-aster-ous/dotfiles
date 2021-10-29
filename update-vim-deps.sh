#!/bin/bash

cd $(dirname $0)

git pull
git submodule update --init --recursive

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

YouCompleteMe/install.py --go-completer --ts-completer --rust-completer --java-completer

git commit -am 'auto-update vim deps'
