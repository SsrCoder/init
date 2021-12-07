if [[ $(uname) = 'Linux' ]];then
	curl -LO "https://github.com/sharkdp/bat/releases/download/v0.18.3/bat-v0.18.3-x86_64-unknown-linux-musl.tar.gz"
	tar -zxvf bat-v0.18.3-x86_64-unknown-linux-musl.tar.gz
	cp bat-v0.18.3-x86_64-unknown-linux-musl/bat /usr/bin/fzf
	rm -rf bat-v0.18.3-x86_64-unknown-linux-musl.tar.gz
else
	echo 'unsupport os version'
fi

