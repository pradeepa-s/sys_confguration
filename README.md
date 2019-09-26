# sys_confguration

Personal configuration files

* Main configuration units
	- bash alias
	- git
	- git alias
	- vim
	- tmux

* Seperate 'work_xxx' scripts for work

========================================

Setting up:

	- Make sure following tools are installed
		1. GIT
		2. tmux
		3. vim
		4. fzf

	- Run setup_my_system.sh -e <environment>
		<environment>	:	w, h

	- Source the .bashrc file
		$: source ~/.bashrc

Packages to look for:
	* ripgrep
	* ack
	* fzf
	* silverseracher

Add later:
	:SyntasticToggleMode
	:SyntasticCheck


	let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
	if executable('ag')
	  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	endif

	Get Ack in vundle and get silversearcher. Connecte them
