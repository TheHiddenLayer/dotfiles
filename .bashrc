
export PS1="\e[32m\u\e[3m (\w)\e[m\e[0;95m\$(parse_git_branch)\n>>>\e[m "
export PATH="/usr/local/bin:$PATH"

# ------- BASIC -------

alias b='cd ..'
alias c='clear'
alias bp='open -e ~/.bash_profile'
alias src='source ~/.bash_profile'
alias clera='clear'
alias celar='clear'
alias sl='ls -G'
alias ls='ls -G'
alias q='exit'

# ------ PROJECTS ----------

alias r='npm run build && npm run start'
alias dro='cd ~/Code/Drover/'
alias tse='cd ~/Code/TSE/'

# --------- GIT -----------
prefix="https://github.com/TheHiddenLayer/"
alias cm='git add . && git commit -am'
alias st='git status'
alias co='git checkout'
alias pullom='git pull origin master'
alias br='git branch';
alias clone='read repo; result=""; result+="$prefix";result+="${repo}.git"; git clone $result'
alias log="git log --first-parent --graph --pretty=format:'%C(yellow)%h%Creset -%C(auto)%d%Creset %s %C(cyan)(%cr) %Cresetby %C(bold blue)%aN%Creset' --abbrev-commit --date=relative --branches"

# ---- METHODS ---------
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
d() {
  git add .
  git commit -am "${1}"
  current_branch=$(parse_git_branch) | tr -d '()'
  git push origin ${current_branch} 
}

