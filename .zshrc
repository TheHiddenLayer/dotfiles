# --- OUTSOURCE ---
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

# --- PROMPT ---
NEWLINE=$'\n'
PROMPT="%F{10}%~${NEWLINE}%F{13}>%f "

# --- EXPORTS ---
export BAT_THEME="gruvbox-dark"
export FZF_DEFAULT_COMMAND="rg --files"

# --- GIT ---
alias cm='git add . && git commit -am'
alias st='git status'
alias co='git checkout'
alias pullom='git pull origin master'
alias br='git branch';
alias log="git log --first-parent --graph --pretty=format:'%C(yellow)%h%Creset -%C(auto)%d%Creset %s %C(cyan)(%cr) %Cresetby %C(bold blue)%aN%Creset' --abbrev-commit --date=relative --branches"
alias clone='cd ~/Desktop && git clone'

# --- NAV ---
alias b='cd ..'
alias c='clear'
alias src='source ~/.zshrc'
alias config='vi ~/.zshrc'
alias clera='clear'
alias celar='clear'
alias clearls='clear'
alias sl='ls -G'
alias ls='ls -G'
alias rls='ls -lG'
alias q='exit'
alias vc='vi ~/.vimrc'

# --- PROJ ---
alias r='npm start'
alias yolo='rm -rf node_modules/ && rm package-lock.json && yarn install'
