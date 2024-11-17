# Backup of imported aliases

alias ping='prettyping --nolegend'
alias pg8='ping 8.8.8.8'
alias vim='nvim'
alias cat='bat'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias pn="pnpm"
alias ed="ed -p ':'"
alias ts='sesh connect $(sesh list | fzf)'
alias gaa="git add --all"
alias gcount='git shortlog -sn'
alias gcl='git config --list'
alias gcd='git checkout-default'
alias gcm='git checkout-master'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gclean='git reset --hard; and git clean -dfx'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias gfgrep='git ls-files | grep'
alias gpoat='git push origin --all; and git push origin --tags'
alias gg='git grep -n'
alias gk='gitk --all --branches'
alias gs='git show'
alias gsts='git stash show --text'
alias gsta='git stash'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias grt='cd (git rev-parse --show-toplevel or echo ".")'
alias gsr='git svn rebase'
alias gsd='git svn dcommit'
alias gwip='git add -A; git ls-files --deleted -z | xargs -0 git rm; git commit -m "wip"'
alias gunwip='git log -n 1 | grep -q -c wip; and git reset HEAD~1'
alias ptt="ssh bbsu@ptt.cc"
alias l='ls -alh'
alias em="emacs -nw"
alias kbc="kubectl"
alias ati="atuin search -i"
alias pm2lc="pm2_app_selector logs"
alias pm2s="pm2_app_selector start"
alias pm2rs="pm2_app_selector restart"
alias pm2st="pm2_app_selector stop"