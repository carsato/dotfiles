#!/bin/bash

#set up directories
cd ~/

#clone project
#git clone git@github.com:carsato/dotfiles.git
cd dotfiles

ls -a ~/dotfiles/ > ~/dotfiles/.ls

#create simbolic links to home directory ( ignore the files/dirs in .setupignore )
for i in `cat ~/dotfiles/.ls ~/dotfiles/.setupignore | sort | uniq -u`
do
  echo
  echo "Link ~/dotfiles/$i to ~/$i"
  ln -s ~/dotfiles/$i ~/
  echo
done

exit 0
