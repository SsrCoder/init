docker kill vim
docker rm vim
docker build -t vim:0.5.1 .
docker run -itd -v /Users/fzzf/Desktop/docker/vim:/root/config --name vim vim:0.5.1
docker exec -it vim ln -s /root/config/.vimrc /root/.config/nvim/init.vim
docker exec -it vim zsh
