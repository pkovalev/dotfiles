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
alias gf="git fetch"
alias gp="git pull"
alias gfp="git fetch && git pull"

git config --global alias.co checkout

reset_color=$'%f'
fg_green=$'%F{green}'
fg_red=$'%F{red}'
fg_cyan=$'%F{cyan}'
fg_blue=$'%F{blue}'

function get_git_branch() {
  branch=$(git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/\1/p')
  if [[ $branch == "" ]];
    then
      :
    else
      echo ' %b'$fg_blue'git:('$fg_red$branch$fg_blue')%b'$reset_color''
    fi
}

setopt prompt_subst
PROMPT='${fg_green}➜ ${fg_cyan}%c${reset_color}'
PROMPT+='$(get_git_branch)'
PROMPT+=' '

autoload -Uz compinit && compinit

source <(fzf --zsh)
bindkey -v
