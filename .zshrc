export PATH=$HOME/bin:/usr/local/bin:$PATH

if [ -f "~/.zshenv" ]; then
  source ~/.zshenv
fi

alias ls="ls --color=auto"
if command -v vim &>/dev/null; then
	alias vi="vim"
fi
if command -v nvim &>/dev/null; then
	alias vim="nvim"
fi

#git aliases
alias g="git"
alias ga="git add"
alias gc="git commit"
alias gb="git branch"
alias gf="git fetch"
alias gp="git pull"
alias gfp="git fetch && git pull"

if command -v git &>/dev/null; then
  git config --global alias.co checkout
  git config --global --type bool push.autoSetupRemote true
fi

reset_color=$'%f'
fg_green=$'%F{green}'
fg_red=$'%F{red}'
fg_cyan=$'%F{cyan}'
fg_blue=$'%F{blue}'

function get_git_branch() {
  if command -v git &>/dev/null; then
	  branch=$(git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1/p')
	  if [[ $branch == "" ]];
		then
		  :
		else
		  echo ' %b'$fg_blue'git:('$fg_red$branch$fg_blue')%b'$reset_color''
		fi
  else
	:
  fi
}

setopt prompt_subst
PROMPT='${fg_blue}%m ${fg_green}➜ ${fg_cyan}%c${reset_color}'
PROMPT+='$(get_git_branch)'
PROMPT+=' '

autoload -Uz compinit && compinit

if command -v fzf &>/dev/null; then
  # Don't source FZF shell integrations if version is older than 0.48 (Avoids `unknown option: --zsh`)
  # Version comparison technique courtesy of Luciano Andress Martini:
  # https://unix.stackexchange.com/questions/285924/how-to-compare-a-programs-version-in-a-shell-script
  FZF_VERSION="$(fzf --version | cut -d' ' -f1)"
  if [[ "$(printf '%s\n' 0.48 "$FZF_VERSION" | sort -V | head -n1)" = 0.48 ]]; then
  source <(fzf --zsh)
  fi
fi

bindkey -v

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

