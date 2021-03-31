# --- GIT ---
prefix="https://github.com/thehiddenlayer/"
alias cm='git add . && git commit -am'
alias st='git status'
alias co='git checkout'
alias pullom='git pull origin master'
alias br='git branch';
alias clone='read repo; result=""; result+="$prefix";result+="${repo}.git"; git clone $result'
alias log="git log --first-parent --graph --pretty=format:'%C(yellow)%h%Creset -%C(auto)%d%Creset %s %C(cyan)(%cr) %Cresetby %C(bold blue)%aN%Creset' --abbrev-commit --date=relative --branches"

# --- NAV ---
alias b='cd ..'
alias c='clear'
alias src='source ~/.zshrc'
alias config='vi ~/.zshrc'
alias clera='clear'
alias celar='clear'
alias clearls='clear'
alias sl='ls -lG'
alias ls='ls -lG'
alias rls='ls -lG'
alias q='exit'
alias vc='vi ~/.vimrc'

# --- PROJ ---
alias r='npm start'
