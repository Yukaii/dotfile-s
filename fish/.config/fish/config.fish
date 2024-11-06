# Configuration and Secrets
source $__fish_config_dir/secrets.fish
set LANG "en_US.UTF-8"
set -x GPG_TTY (tty)
set -x LC_CTYPE en_US.UTF-8
set -x LC_ALL en_US.UTF-8

# Path Configurations
fish_add_path "$HOME/.bin"
fish_add_path "$HOME/.deno/bin"
fish_add_path "$HOME/.spicetify"
fish_add_path "$HOME/.local/bin/hx-utils-bin"
fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/go/bin"
fish_add_path "$HOME/.bun/bin"

# Homebrew paths for different architectures
set arc (arch)
if string match -q "arm64" $arc
  fish_add_path "/opt/homebrew/bin/"
  fish_add_path "/opt/homebrew/sbin/"
  fish_add_path "/opt/homebrew/opt/openjdk/bin/"
else
  fish_add_path "/usr/local/bin"
  fish_add_path "/usr/local/sbin"
end

# GNU paths
fish_add_path /opt/homebrew/opt/gnu-getopt/bin
fish_add_path /opt/homebrew/opt/make/libexec/gnubin

# Environment Variables
set -x PIPENV_SHELL_FANCY 1
set -x PIPENV_IGNORE_VIRTUALENVS 1

# Aliases
alias ping='prettyping --nolegend'
alias pg8='ping 8.8.8.8'
alias vim='nvim'
alias cat='bat'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias pn="pnpm"
alias ed="ed -p ':'"
alias ts='sesh connect $(sesh list | fzf)'
# alias eza="ls"

# Git Aliases
alias g='git' #compdef g=git
alias gst='git status' #compdef _git gst=git-status
alias gd='git diff' #compdef _git gd=git-diff
alias gdc='git diff --cached' #compdef _git gdc=git-diff
alias gpu='git pull' #compdef _git gl=git-pull
alias gpur='git pull --rebase' #compdef _git gup=git-fetch
alias gp='git push' #compdef _git gp=git-push
alias gpf='git push --force-with-lease' #compdef _git gpf=git-push
alias gaa="git add --all"
alias gc='git commit -v' #compdef _git gc=git-commit
alias gcln='git clone' #compdef _git gcln=git-clone
alias gc!='git commit -v --amend' #compdef _git gc!=git-commit
alias gca='git commit -v -a' #compdef _git gc=git-commit
alias gca!='git commit -v -a --amend' #compdef _git gca!=git-commit
alias gcar='git commit -v -a --amend --reuse-message=HEAD' #compdef _git gcar!=git-commit
alias gcmsg='git commit -m' #compdef _git gcmsg=git-commit
alias gco='git checkout' #compdef _git gco=git-checkout
alias gcd='git checkout-default'
alias gcm='git checkout-master'
alias gr='git remote' #compdef _git gr=git-remote
alias grv='git remote -v' #compdef _git grv=git-remote
alias grbi='git rebase -i' #compdef _git grbi=git-rebase
alias grbc='git rebase --continue' #compdef _git grbc=git-rebase
alias grba='git rebase --abort' #compdef _git grba=git-rebase
alias gb='git branch' #compdef _git gb=git-branch
alias gba='git branch -a' #compdef _git gba=git-branch
alias gbr='git branch -r' #compdef _git gbr=git-branch-remote
alias gcount='git shortlog -sn'
alias gcl='git config --list'
alias gcp='git cherry-pick' #compdef _git gcp=git-cherry-pick
alias glg='git log --stat --max-count=10' #compdef _git glg=git-log
alias glgg='git log --graph --max-count=10' #compdef _git glgg=git-log
alias glgga='git log --graph --decorate --all' #compdef _git glgga=git-log
alias gl="serie"
alias gll='git log --oneline --pretty="format:%C(yellow)%h %Cblue%>(12)%ad %Cgreen%<(7)%aN%Cred%d %Creset%s" --date=relative --graph --branches --remotes --tags --decorate'
alias gss='git status -s' #compdef _git gss=git-status
alias ga='git add' #compdef _git ga=git-add
alias gm='git merge' #compdef _git gm=git-merge
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gclean='git reset --hard; and git clean -dfx'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias grpr-dry='git remote prune origin --dry-run' #compdef _git grpr=git-remote-prune-origin
alias grpr='git remote prune origin' #compdef _git grpr=git-remote-prune-origin
alias gf='git fetch' #compdef _git gf=git-fetch
alias gfgrep='git ls-files | grep'
alias gpoat='git push origin --all; and git push origin --tags'
alias gmt='git mergetool --no-prompt' #compdef _git gm=git-mergetool
alias gg='git grep -n'
alias gk='gitk --all --branches'
alias gsts='git stash show --text'
alias gsta='git stash'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias grt='cd (git rev-parse --show-toplevel or echo ".")'

# Git and SVN mix
alias git-svn-dcommit-push='git svn dcommit; and git push github master:svntrunk' #compdef git-svn-dcommit-push=git
alias gsr='git svn rebase'
alias gsd='git svn dcommit'

alias ggpull='git pull origin (current_branch)' #compdef ggpull=git
alias ggpur='git pull --rebase origin (current_branch)' #compdef ggpur=git
alias ggpush='git push origin (current_branch)' #compdef ggpush=git
alias ggpnp='git pull origin (current_branch); and git push origin (current_branch)' #compdef ggpnp=git

# Aliases for committing and managing WIP branches
alias gwip='git add -A; git ls-files --deleted -z | xargs -0 git rm; git commit -m "wip"'
alias gunwip='git log -n 1 | grep -q -c wip; and git reset HEAD~1'

# Miscellaneous Aliases
alias ptt="ssh bbsu@ptt.cc"
alias l='ls -alh'
alias em="emacs -nw"
alias kbc="kubectl"
alias ati="atuin search -i"
alias pm2lc="pm2_app_selector logs"
alias pm2s="pm2_app_selector start"
alias pm2rs="pm2_app_selector restart"
alias pm2st="pm2_app_selector stop"
alias ibrew='arch -x86_64 /usr/local/homebrew/bin/brew'
alias mbrew='arch -arm64e /opt/homebrew/bin/brew'

function set_current_docker_host
  set -x DOCKER_HOST (docker context inspect --format '{{.Endpoints.docker.Host}}')
end

function start_iodine
  sudo iodine -r -I1 -T CNAME -m 212 -M 100 -f -P $IODINE_PASSWORD $DNS_TUNNEL
end

function start_dnstt
  dnstt-client -doh https://cloudflare-dns.com/dns-query -pubkey-file $DNSTT_PUB_KEY_PATH $DNS_TUNNEL 127.0.0.1:8000
end

# Shell Integrations and Completions
oh-my-posh init fish --config (mbrew --prefix oh-my-posh)"/themes/uew.omp.json" | source
volta completions fish | source
sg completions fish | source
fzf --fish | source
kubectl completion fish | source
fnm env --use-on-cd | source
zoxide init fish | source
atuin init fish | source
mise activate fish | source
if test -n "$WEZTERM_PANE"
  wezterm shell-completion --shell fish | source
end
