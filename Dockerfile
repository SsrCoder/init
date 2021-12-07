FROM centos

WORKDIR /root

ENV ZSH_CUSTOM=/root/.oh-my-zsh/custom

RUN \
    # remove unused files
    rm -rf ana* && \
    rm -rf *.cfg && \
    # install locale langpack
    dnf install -y glibc-langpack-en && \
    curl -sL https://rpm.nodesource.com/setup_12.x | bash - && \
    yum install -y yum-utils && \
    yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo && \
    yum install -y zsh git python2 python3 nodejs ripgrep && \
    curl 'https://bootstrap.pypa.io/get-pip.py' | python3 && \
    pip install ranger-fm

# python default for python3
RUN ln -s /usr/bin/python3 /usr/bin/python

# oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

RUN git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# autojump
RUN git clone git://github.com/wting/autojump.git && \
    cd autojump && \
    SHELL=zsh python install.py && \
    cd .. && \
    rm -rf autojump

# vim
COPY nvim /usr/bin/vim
COPY ./nvim-linux64/share/nvim/runtime /share/nvim/

COPY ranger /root/.config/ranger
COPY .zshrc /root/.zshrc
COPY .vimrc /root/.config/nvim/.vimrc
RUN ln -s /root/.config/nvim/init.vim /root/.vimrc

