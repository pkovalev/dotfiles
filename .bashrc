export PATH=$HOME/bin:/usr/local/bin:$PATH

if [ -f "~/.zshenv" ]; then
	source ~/.zshenv
fi

alias vi="vim"
alias vim="nvim"
alias new="open -n /Applications/Alacritty.app --args -e '/usr/local/bin/tmux'"
alias ls="ls --color=auto"
alias ll="ls -l"

#git aliases
alias g="git"
alias ga="git add"
alias gc="git commit"
alias gb="git branch"

reset_color='\[\e[00m\]'
fg_green='\[\e[32m\]'
fg_red='\[\e[31m\]'
fg_cyan='\[\e[36m\]'
fg_blue='\[\e[34m\]'

function get_git_branch() {
	branch=$(git branch 2>/dev/null | sed -n -e 's/^\* \(.*\)/\1/p')
	if [[ $branch == "" ]]; then
		:
	else
		echo ' '$fg_blue'git:('$fg_red$branch$fg_blue')'$reset_color''
	fi
}

#setopt prompt_subst
PROMPT=''$fg_green'➜ '$fg_cyan'\w'$reset_color''
PROMPT+=''$(get_git_branch)''
PROMPT+=' '
export PS1=$PROMPT
