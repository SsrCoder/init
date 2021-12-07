if [[ $(uname) = 'Linux' ]];then
	git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
	$HOME/.fzf/install --all --no-bash --no-fish
else
	echo 'unsupport os version'
fi

