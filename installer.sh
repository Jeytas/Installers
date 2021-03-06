#!/bin/bash
#This bash script will clone the RuXt program from the Github Repository to the ~/.ruxt folder and create aliases in the ~/.bashrc file for accessing them (xt and updatext)

if [ -e ~/.ruxt ]; then echo "The program seems to have already been installed since the ~/.ruxt directory already exists. In that case, please use the command 'updatext'" && exit; else echo "Installation starting"; fi
if grep -q ".ruxt" ~/.bashrc
then
    echo "It seems like this program has already been installed previously, since the aliases have already been added to your .bashrc. To prevent errors and the installation adding several of the same aliases to your .bashrc, the installation will now continue without adding any aliases to your .bashrc"
    echo "Cloning from repository starting"

    git clone https://github.com/Jeytas/RuXt.git ~/.ruxt
    if [ $? == 0 ]; then echo "Cloning successful"; else echo "Cloning failed" && exit; fi

    alias xt="ruby ~/.ruxt/lib/bin/extract.rb"
    alias updatext="bash ~/.ruxt/lib/bin/update.sh"
    if [ $? == 0 ]; then echo "Setting aliases (xt and updatext) in current bash session was successful"; else echo "Setting aliases in current session was unsuccessful" && exit; fi

    echo "If you see this message, everything should've been installed correctly. To ensure that it has, please run 'xt -h' and if you get some help regarding the program everything has been installed correctly. If this doesn't work, please try restarting your current Terminal. If that still doesn't solve the issue, please create anissue on this project's Github"
    echo "To update RuXt, please run updatext"

else
    echo "Cloning from repository starting"
    git clone https://github.com/Jeytas/RuXt.git ~/.ruxt
    if [ $? == 0 ]; then echo "Cloning successful"; else echo "Cloning failed" && exit; fi

    alias xt="ruby ~/.ruxt/lib/bin/extract.rb"
    alias updatext="bash ~/.ruxt/lib/bin/update.sh"
    if [ $? == 0 ]; then echo "Setting aliases (xt and updatext) in current bash session was successful"; else echo "Setting aliases in current session was unsuccessful" && exit; fi

    echo 'alias updatext="bash ~/.ruxt/lib/bin/update.sh"' >> ~/.bashrc
    echo 'alias xt="ruby ~/.ruxt/lib/bin/extract.rb"' >> ~/.bashrc
    if [ $? == 0 ]; then echo "Setting alias in ~/.bashrc has was successful"; else echo "Setting aliases in ~/.bashrc was unsuccessful" && exit; fi

    echo "If you see this message, everything should've been installed correctly. To ensure that it has, please run 'xt -h' and if you get some help regarding the program everything has been installed correctly. If this doesn't work, please try restarting your current Terminal. If that still doesn't solve the issue, please create anissue on this project's Github"
    echo "To update RuXt, please run updatext"
fi
