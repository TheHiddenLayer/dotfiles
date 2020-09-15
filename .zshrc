export PATH="/usr/local/bin:$PATH"
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats "$fg[black]on $fg[cyan](%b)"
setopt PROMPT_SUBST
autoload -U colors && colors
PROMPT="$fg[green]%n $fg[black]at%{$reset_color%} $fg[red]%* $fg[black]in $fg[yellow]%~ \$vcs_info_msg_0_ 
$fg[green]–>${reset_color} "

# ------- ALIASES -------

alias b='cd ..'
alias zshc='open ~/.zshrc'
alias c='clear'
alias bp='open -e ~/.zshrc'
alias src='source ~/.zshrc'
alias clera='clear'
alias celar='clear'
alias sl='ls -G'
alias ls='ls -G'
alias q='exit'

## ------ PROJECTS -------

alias r='npm run build && npm run start'
alias tse='cd ~/Code/TSE/'
alias per='cd ~/Code/Personal/'

## --------- GIT ---------
prefix="https://github.com/TheHiddenLayer/"
alias cm='git add . && git commit -am'
alias st='git status'
alias co='git checkout'
alias pullom='git pull origin master'
alias br='git branch';
alias log="git log --first-parent --graph --pretty=format:'%C(yellow)%h%Creset -%C(auto)%d%Creset %s %C(cyan)(%cr) %Cresetby %C(bold blue)%aN%Creset' --abbrev-commit --date=relative --branches"

