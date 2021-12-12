test: .bundle/vader.vim
	cd test && vim -EsNu vimrc --not-a-term -c 'Vader! * */*'

.bundle/vader.vim:
	git clone --depth 1 https://github.com/junegunn/vader.vim.git .bundle/vader.vim
