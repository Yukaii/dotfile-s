# migrating from https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh

source $__fish_config_dir/secrets.fish

set PATH $PATH "$HOME/.bin"
set PATH $PATH "$HOME/.deno/bin"


set PATH $PATH "$HOME/.spicetify"

set arc (arch)
if string match -q "arm64" $arc
  # set PATH $PATH "/usr/local/bin"
  fish_add_path "/opt/homebrew/bin/"
  fish_add_path "/opt/homebrew/sbin/"

  # openJDK
  fish_add_path "/opt/homebrew/opt/openjdk/bin/"
else
  fish_add_path "/usr/local/bin"
  fish_add_path "/usr/local/sbin"
end

fish_add_path "$HOME/.local/bin/hx-utils-bin"

set PATH $PATH "$HOME/.cargo/bin"

set PATH $PATH "$HOME/go/bin"

set PATH $PATH "$HOME/.poetry/bin"
set PATH $PATH "$HOME/Library/Android/sdk/platform-tools"
set PATH $PATH "$HOME/Library/Android/sdk/tools"

# solana
set PATH $PATH "$HOME/.local/share/solana/install/active_release/bin"

# bun
set PATH $PATH "$HOME/.bun/bin"

# mysql
set PATH $PATH "/usr/local/mysql/bin"

# For Android development
set ANT_HOME "/usr/local/opt/ant"
set MAVEN_HOME "/usr/local/opt/maven"
set GRADLE_HOME "/usr/local/opt/gradle"

set ANDROID_HOME "$HOME/Library/Android/sdk"
set ANDROID_NDK_HOME "/usr/local/share/android-ndk"
set ANDROID_SDK_ROOT "$HOME/Library/Android/sdk"

# Python 3
set PATH $PATH "$HOME/Library/Python/3.8/bin"

# mason
set PATH $PATH "$HOME/.local/share/nvim/mason/bin"

# gnu getopt
fish_add_path /opt/homebrew/opt/gnu-getopt/bin
# gnu make
fish_add_path /opt/homebrew/opt/make/libexec/gnubin

set LANG "en_US.UTF-8"

set -x PIPENV_SHELL_FANCY 1
set -x PIPENV_IGNORE_VIRTUALENVS 1

set --export FZF_DEFAULT_OPTS '--no-height --no-reverse --highlight-line --marker=+ --margin=1,3 --bind ctrl-y:preview-up,ctrl-e:preview-down,ctrl-b:preview-page-up,ctrl-f:preview-page-down,ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,shift-up:preview-top,shift-down:preview-bottom,alt-up:half-page-up,alt-down:half-page-down'
set --export SKIM_DEFAULT_OPTIONS '--no-height --margin=1,3 --bind ctrl-y:preview-up,ctrl-e:preview-down,ctrl-b:preview-page-up,ctrl-f:preview-page-down,ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,shift-up:preview-top,shift-down:preview-bottom,alt-up:half-page-up,alt-down:half-page-down'

set --export FZF_DEFAULT_COMMAND 'rg --hidden -l ""'

# NNN configs
set -g -x NNN_OPENER "hx-wez"
set -g -x NNN_PLUG 'o:fzopen;d:diffs;v:preview-tui;p:fzplug;c:fzhist;f:fzcd'
set -g -x NNN_FIFO '/tmp/nnn.fifo'
alias nn="env EDITOR=hx-wez nnn -c"

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

# source $HOME/.cargo/env

function passgrep
  pass find $argv | env GREP_COLOR='1;34' egrep --color -i "$argv|\$"
end

alias g='git'
#compdef g=git
alias gst='git status'
#compdef _git gst=git-status
alias gd='git diff'
#compdef _git gd=git-diff
alias gdc='git diff --cached'
#compdef _git gdc=git-diff
alias gpu='git pull'
#compdef _git gl=git-pull
alias gpur='git pull --rebase'
#compdef _git gup=git-fetch
alias gp='git push'
#compdef _git gp=git-push
alias gpf='git push --force-with-lease'
#compdef _git gpf=git-push
alias gd='git diff'

alias gaa="git add --all"

function gdv
  git diff -w $argv | view -
end

#compdef _git gdv=git-diff
alias gc='git commit -v'
#compdef _git gcln=git-clone
alias gcln='git clone'
#compdef _git gc=git-commit
alias gc!='git commit -v --amend'
#compdef _git gc!=git-commit
alias gca='git commit -v -a'
#compdef _git gc=git-commit
alias gca!='git commit -v -a --amend'
#compdef _git gca!=git-commit
alias gcar!='git commit -v -a --amend --reuse-message=HEAD'
#compdef _git gcar!=git-commit
alias gcmsg='git commit -m'
#compdef _git gcmsg=git-commit
alias gco='git checkout'
#compdef _git gco=git-checkout
alias gcd='git checkout-default'
alias gcm='git checkout-master'
alias gr='git remote'
#compdef _git gr=git-remote
alias grv='git remote -v'
#compdef _git grv=git-remote
alias grmv='git remote rename'
#compdef _git grmv=git-remote
alias grrm='git remote remove'
#compdef _git grrm=git-remote
alias grset='git remote set-url'
#compdef _git grset=git-remote
alias grup='git remote update'
#compdef _git grset=git-remote
alias grbi='git rebase -i'
#compdef _git grbi=git-rebase
alias grbc='git rebase --continue'
#compdef _git grbc=git-rebase
alias grba='git rebase --abort'
#compdef _git grba=git-rebase
alias gb='git branch'
#compdef _git gb=git-branch
alias gba='git branch -a'
#compdef _git gba=git-branch
alias gbr='git branch -r'
#compdef _git gbr=git-branch-remote
alias gcount='git shortlog -sn'
#compdef gcount=git
alias gcl='git config --list'
alias gcp='git cherry-pick'
#compdef _git gcp=git-cherry-pick
alias glg='git log --stat --max-count=10'
#compdef _git glg=git-log
alias glgg='git log --graph --max-count=10'
#compdef _git glgg=git-log
alias glgga='git log --graph --decorate --all'
#compdef _git glgga=git-log
alias gl="serie"
alias gll='git log --oneline --pretty="format:%C(yellow)%h %Cblue%>(12)%ad %Cgreen%<(7)%aN%Cred%d %Creset%s" --date=relative --graph --branches --remotes --tags --decorate'
alias gl2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
#compdef _git glo=git-log
alias gss='git status -s'
#compdef _git gss=git-status
alias ga='git add'
#compdef _git ga=git-add
alias gm='git merge'
#compdef _git gm=git-merge
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gclean='git reset --hard; and git clean -dfx'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

alias grpr-dry='git remote prune origin --dry-run'
alias grpr='git remote prune origin'
#compdef _git grpr=git-remote-prune-origin
alias gs="git show $1 --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --color"
#compdef _git gs=git-show
alias gsl="git show $1 --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --color | less -RSX"
#compdef _git gsl=git-show-less

alias gbc-dry='git branch --merged | egrep -v "(^\*|master|dev)"'
#compdef _git gbrc-dry='git-branch-cleanup-dryrun'
alias gbc='gbc-dry | xargs git branch -d'
#compdef _git gbrc='git-branch-cleanup'

alias gf='git fetch'
#compdef _git gf=git-fetch

alias gfgrep='git ls-files | grep'

alias gpoat='git push origin --all; and git push origin --tags'
alias gmt='git mergetool --no-prompt'
#compdef _git gm=git-mergetool

alias gg='git grep -n '
#alias gg='git gui citool'
#alias gga='git gui citool --amend'
alias gk='gitk --all --branches'

alias gsts='git stash show --text'
alias gsta='git stash'
alias gstp='git stash pop'
alias gstd='git stash drop'

# Will cd into the top of the current repository
# or submodule.
alias grt='cd (git rev-parse --show-toplevel or echo ".")'

# Git and svn mix
alias git-svn-dcommit-push='git svn dcommit; and git push github master:svntrunk'
#compdef git-svn-dcommit-push=git

alias gsr='git svn rebase'
alias gsd='git svn dcommit'
#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch
  set ref (git symbolic-ref HEAD 2> /dev/null); or \
  set ref (git rev-parse --short HEAD 2> /dev/null); or return
  echo ref | sed s-refs/heads--
end

function current_repository
  set ref (git symbolic-ref HEAD 2> /dev/null); or \
  set ref (git rev-parse --short HEAD 2> /dev/null); or return
  echo (git remote -v | cut -d':' -f 2)
end

# these aliases take advantage of the previous function
alias ggpull='git pull origin (current_branch)'
#compdef ggpull=git
alias ggpur='git pull --rebase origin (current_branch)'
#compdef ggpur=git
alias ggpush='git push origin (current_branch)'
#compdef ggpush=git
alias ggpnp='git pull origin (current_branch); and git push origin (current_branch)'
#compdef ggpnp=git

# these alias commit and uncomit wip branches
alias gwip='git add -A; git ls-files --deleted -z | xargs -0 git rm; git commit -m "wip"'
alias gunwip='git log -n 1 | grep -q -c wip; and git reset HEAD~1'

alias ptt="ssh bbsu@ptt.cc"

# rails alias
alias ttr="touch tmp/restart.txt"
alias rlog="tail -f log/development.log"
alias resetdb="bin/rake db:drop; bin/rake db:create; bin/rake db:migrate"

alias scheme="rlwrap /usr/local/bin/scheme"

# less syntax highlight
set LESSOPEN "| /usr/local/bin/src-hilite-lesspipe.sh %s"
set LESS '-R'

set -g -x EDITOR "k"
alias l='ls -alh'

alias em="emacs -nw"

function tre
  tree -C $argv | less -r
end

function input_volumn_max
  while true
    osascript -e "set volume input volume 100"
    sleep 10
  end
end

function kp --description "Kill processes"
  set -l __kp__pid ''

  if contains -- '--tcp' $argv
    set __kp__pid (lsof -Pwni tcp | sed 1d | eval "fzf $FZF_DEFAULT_OPTS -m --header='[kill:tcp]'" | awk '{print $2}')
  else
    set __kp__pid (ps -ef | sed 1d | eval "fzf $FZF_DEFAULT_OPTS -m --header='[kill:process]'" | awk '{print $2}')
  end

  if test "x$__kp__pid" != "x"
    if test "x$argv[1]" != "x"
      echo $__kp__pid | xargs kill $argv[1]
    else
      echo $__kp__pid | xargs kill -9
    end
    kp
  end
end

function bip --description "Install brew plugins"
  set -l inst (brew search | eval "fzf $FZF_DEFAULT_OPTS -m --header='[brew:install]'")

  if not test (count $inst) = 0
    for prog in $inst
      brew install "$prog"
    end
  end
end

function bcp --description "Remove brew plugins"
  set -l inst (brew leaves | eval "fzf $FZF_DEFAULT_OPTS -m --header='[brew:uninstall]'")

  if not test (count $inst) = 0
    for prog in $inst
      brew uninstall "$prog"
    end
  end
end

# bobthefish theme options
set -g theme_display_ruby yes
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts no
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes

# pyenv virtualenv config
# status --is-interactive; and pyenv init - | source
# status --is-interactive; and source (pyenv virtualenv-init -|psub)
# status --is-interactive; and source (pyenv init -|psub)
status is-login; and pyenv init --path | source

rvm default
# nvm use
set -x GPG_TTY (tty)

# hide the fish welcome message
set -g fish_greeting

alias ibrew='arch -x86_64 /usr/local/homebrew/bin/brew'
alias mbrew='arch -arm64e /opt/homebrew/bin/brew'

oh-my-posh init fish --config (mbrew --prefix oh-my-posh)"/themes/uew.omp.json" | source
# oh-my-posh init fish --config (brew --prefix oh-my-posh)"/themes/takuya.omp.json" | source

# pnpm setup
set PNPM_HOME "$HOME/Library/pnpm"
# set PATH $PNPM_HOME $PATH

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

# GCloud
# source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"

set VOLTA_HOME "$HOME/.volta"
fish_add_path "$VOLTA_HOME/bin"
volta completions fish | source

sg completions fish | source
fzf --fish | source
wezterm shell-completion --shell fish | source
fnm env --use-on-cd | source
zoxide init fish | source
atuin init fish | source
kubectl completion fish | source
mise activate fish | source

if test -n "$GHOSTTY_RESOURCES_DIR"
    source "$GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish"
end

alias kbc="kubectl"

alias ati="atuin search -i"

alias pm2lc="pm2_app_selector logs"
alias pm2s="pm2_app_selector start"
alias pm2rs="pm2_app_selector restart"
alias pm2st="pm2_app_selector stop"

# "$HOME/.tea/tea.xyz/v*/bin/tea" --magic=fish | source

function set_current_docker_host
  set -x DOCKER_HOST (docker context inspect --format '{{.Endpoints.docker.Host}}')
end

function start_iodine
  sudo iodine -r -I1 -T CNAME -m 212 -M 100 -f -P $IODINE_PASSWORD $DNS_TUNNEL
end

function start_dnstt
  # -doh https://cloudflare-dns.com/dns-query
  # -dot cloudflare-dns.com:853
  dnstt-client -doh https://cloudflare-dns.com/dns-query -pubkey-file $DNSTT_PUB_KEY_PATH $DNS_TUNNEL 127.0.0.1:8000
end

fish_add_path /Users/yukai/.spicetify

set -x LC_CTYPE en_US.UTF-8
set -x LC_ALL en_US.UTF-8

