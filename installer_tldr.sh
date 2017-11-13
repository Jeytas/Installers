##!/bin/bash

if [ -e ~/.rtldr ]; then echo "The program seems to have already been installed since the ~/.rtldr directory already exists. In that case, please use the command 'updatetldr'" && exit; else echo "Installation starting"; fi
if grep -q ".rtldr" ~/.bashrc
then
    echo "It seems like this program has already been installed previously, since the aliases have already been added to your .bashrc. To prevent errors and the installation adding several of the same aliases to your .bashrc, the installation will now continue without adding any aliases to your .bashrc"
    echo "Cloning from repository starting"

    git clone https://github.com/Jeytas/RubyTldr.git ~/.rtldr
    if [ $? == 0 ]; then echo "Cloning successful"; else echo "Cloning failed" && exit; fi

    alias tldr="ruby ~/.rtldr/tldr.rb"
    alias updatetldr="bash ~/.rtldr/lib/bin/update.sh"
    if [ $? == 0 ]; then echo "Setting aliases (tldr and updatetldr) in current bash session was successful"; else echo "Setting aliases in current session was unsuccessful" && exit; fi

    echo "If you see this message, everything should've been installed correctly. To ensure that it has, please run 'tldr tldr'. If you get an explanation of this program, then everything worked correctly"
    echo "To update tldr, please run updatetldr"

else
    echo "Cloning from repository starting"
    git clone https://github.com/Jeytas/RubyTldr.git ~/.rtldr
    if [ $? == 0 ]; then echo "Cloning successful"; else echo "Cloning failed" && exit; fi

    alias tldr="ruby ~/.rtldr/tldr.rb"
    alias updatetldr="bash ~/.rtldr/lib/bin/update.sh"
    if [ $? == 0 ]; then echo "Setting aliases (tldr and updatetldr) in current bash session was successful"; else echo "Setting aliases in current session was unsuccessful" && exit; fi

    echo 'alias updatetldr="bash ~/.rtldr/lib/bin/update.sh"' >> ~/.bashrc
    echo 'alias tldr="ruby ~/.rtldr/tldr.rb"' >> ~/.bashrc
    if [ $? == 0 ]; then echo "Setting alias in ~/.bashrc has was successful"; else echo "Setting aliases in ~/.bashrc was unsuccessful" && exit; fi

    echo "If you see this message, everything should've been installed correctly. To ensure that it has, please run 'tldr tldr' and if you get some help regarding the program everything has been installed correctly. If this doesn't work, please try restarting your current Terminal. If that still doesn't solve the issue, please create anissue on this project's Github"
    echo "To update Tldr, please run updatetldr"
fi
