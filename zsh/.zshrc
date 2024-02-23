export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=`/usr/libexec/java_home -v 11`/bin:$PATH
export JAVA_HOME="`/usr/libexec/java_home -v 11`"
export PATH=$SONAR:$PATH
export PATH="/opt/homebrew/opt/node@18/bin:$PATH"

alias vi="vim"
alias vim="nvim"
alias new="open -n /Applications/Alacritty.app --args -e '/usr/local/bin/tmux'"
alias ls="ls --color=auto"
alias ll="ls -l"

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
      echo '%b'$fg_blue'git:('$fg_red$branch$fg_blue')%b'$reset_color''
    fi
}


setopt prompt_subst
PROMPT='${fg_green}➜ ${fg_cyan}%c ${reset_color}'
PROMPT+='$(get_git_branch)'
PROMPT+=': '
