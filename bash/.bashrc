shopt -s histappend

export PS1="\[\e[0;35m\]\$\[\e[0m\] "
export HISTSIZE=10000
export HISTFILESIZE=20000
export LC_ALL=en_US.UTF-8
export DOTFILES=$HOME/dotfiles
export EDITOR=nvim
export BROWSER=firefox
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export PATH="$HOME/bin:$PATH"

function jwtd() {
  local input="${1:-}"
  if [ -z "$input" ]; then
    if [ ! -t 0 ]; then
      input=$(cat /dev/stdin)
    else
      echo >&2 '✗ Need an argument or have a piped input!'
      return 1
    fi
  fi
  echo "$input" \
    | jq -Rrce 'split(".")[1] | . + "=" * (. | 4 - length % 4)' \
    | openssl base64 -d -A \
    | jq .
}

function git_rename_branch() {
  if [[ -z "$1" || -z "$2" ]]; then
    echo "Usage: rename_branch <old_branch_name> <new_branch_name> [remote]"
    echo "  <old_branch_name>: The name of the branch to rename."
    echo "  <new_branch_name>: The new name for the branch."
    echo "  [remote]: Optional. The remote repository to push to (default: origin)."
    return 1
  fi

  local old_name=$1
  local new_name=$2
  local remote=${3:-origin} # Default remote is "origin" if not provided

  # Rename the local branch
  git branch -m "$old_name" "$new_name"

  # Delete the old branch on remote
  git push "$remote" --delete "$old_name"

  # Unset the upstream for the new branch
  git branch --unset-upstream "$new_name"

  # Push the new branch to remote
  git push "$remote" "$new_name"

  # Set upstream for the new branch
  git push "$remote" -u "$new_name"
}

alias k=kubectl
alias t=temporal
alias e=nvim
alias ls='ls --color=auto'
alias g=git
alias d=docker
alias b='./bazel'
# alias b='USE_BAZEL_VERSION=7.4.0 bazelisk'
alias v=vault
alias lg=lazygit
alias bc="${EDITOR} ~/.bashrc"
alias nc="${EDITOR} ~/.config/nvim/init.lua"
alias kc="${EDITOR} ~/.config/kitty/kitty.conf"
alias notes="nvim $HOME/notes.txt"
alias dive='docker run -ti --rm  -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(fzf --bash)"
search_repos() {
    local repo_dir="$HOME/src/"
    local repo
    repo=$(find "$repo_dir" -maxdepth 1 -type d -exec basename {} \; | fzf +m --reverse)
    if [ -n "$repo" ]; then
        cd "$repo_dir$repo" && nvim || return
    fi
}
bind -x '"\C-f": search_repos'

#eval "$($(which mise) activate bash)"

[ -f ~/.private.bashrc ] && source ~/.private.bashrc
