#!/bin/bash
#This bash script will clone the RuXt program from the Github Repository to the ~/.ruxt folder and create aliases in the ~/.bashrc file for accessing them (xt and updatext)

if [ ! -e ~/.ruxt ]; then mkdir ~./ruxt; else echo "The program seems to have already been installed since the ~/.ruxt directory already exists. In that case, please use the command 'updatext'" && exit; fi

echo "Cloning from repository starting"
git clone https://github.com/Jeytas/RuXt.git ~/.ruxt
if [ $? == 0 ]; then echo "Cloning successful"; else echo "Cloning failed" && exit; fi

if grep -q ".ruxt" ~/.bashrc
    then
        echo "It seems like you've already installed this program before and removed it, but forgot to remove the aliases from your .bashrc. To prevent having several of the same aliases in your .bashrc, please remove the aliases manually from your .bashrc and run this script again" && exit

    else
        alias xt="ruby ~/.ruxt/extract.rb"
        alias updatext="bash ~/.ruxt/update.sh"
        if [ $? == 0 ]; then echo "Setting aliases (xt and updatext) in current bash session was successful"; else echo "Setting aliases in current session was unsuccessful" && exit; fi

        echo 'alias updatext="bash ~/.ruxt/update.sh"' >> ~/.bashrc
        echo 'alias xt="ruby ~/.ruxt/extract.rb"' >> ~/.bashrc
        if [ $? == 0 ]; then echo "Setting alias in ~/.bashrc has was successful"; else echo "Setting aliases in ~/.bashrc was unsuccessful" && exit; fi

        echo "If you see this message, everything should've been installed correctly. To ensure that it has, please run 'xt -h' and if you get some help regarding the program everything has been installed correctly. If this doesn't work, please try restarting your current Terminal. If that still doesn't solve the issue, please create anissue on this project's Github"
        echo "To update RuXt, please run updatext"
fi

