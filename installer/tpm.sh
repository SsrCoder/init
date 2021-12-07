file=$HOME/.tmux.conf

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
if cat $file | grep -q 'tmux-plugins/tpm'
then 
	echo 'finish'
else
	echo '' >> $file
	echo '# List of plugins' >> $file
	echo "set -g @plugin 'tmux-plugins/tpm'" >> $file
	echo "set -g @plugin 'tmux-plugins/tmux-sensible'" >> $file
	echo "" >> $file
	echo "# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)" >> $file
	echo "run '~/.tmux/plugins/tpm/tpm'" >> $file


fi
