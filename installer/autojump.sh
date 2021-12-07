if echo $SHELL | grep -q -E '\zsh$'
then

    git clone git://github.com/wting/autojump.git
    cd autojump
    SHELL=zsh python install.py
    cd ..
    rm -rf autojump

    if cat $HOME'/.zshrc' | grep -q '.autojump/etc/profile.d/autojump.sh'
    then 
        echo 'finish'
    else
        
        echo '[[ -s '$HOME'/.autojump/etc/profile.d/autojump.sh ]] && source '$HOME'/.autojump/etc/profile.d/autojump.sh' >> ~/.zshrc
        echo 'autoload -U compinit && compinit -u' >> ~/.zshrc

    fi
else

    echo 'only support zsh right now'

fi

