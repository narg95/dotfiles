export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=""

plugins=(
  git zsh-autosuggestions dirhistory brew vagrant dircycle fasd httpie vscode web-search urltools Kubectl docker
)

source $ZSH/oh-my-zsh.sh

# User configuration


#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# CUSTOM NESTOR

eval "$(direnv hook zsh)"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'

# prevents agnoster team to show user name
DEFAULT_USER=`whoami`
autoload -U promptinit; promptinit
prompt pure

export KUBE_PS1_LABEL_USE_IMG=true
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PROMPT='$(kube_ps1)%(?.%F{magenta}.%F{red}❯%F{magenta})❯%f '

# Aliases

## Applications
alias adbpull="adb pull /sdcard/Android/data/btsnoop_hci.log"
alias adbdel="adb shell rm /sdcard/Android/data/btsnoop_hci.log"
alias adbbton="adb shell settings put secure bluetooth_hci_log 1"
alias adbbtoff="adb shell settings put secure bluetooth_hci_log 0"
alias dk="docker"
alias dki="docker images"
alias dkig="docker images | grep "
alias kk=clear
alias kns="kubens"
alias kcx="kubectx"
alias aca="argocd app"
alias ac="argocd"
alias kpx="k proxy" #kubectl proxy
alias watch='watch --color ' # the empty space is to expand aliases
alias wk=$'watch "kubectl get pods,services,deployments,configmaps,secrets; kubectl top pod --containers |sort -t \' \' -k 1,2 -b"'
alias wkw=$'watch "kubectl get --output=wide pods,services,configmaps,secrets; kubectl top pod --containers |sort -t \' \' -k 1,2 -b"'
alias wkt=$'watch "kubectl top pod --containers |sort -t \' \' -k 1,2 -b"'
alias catc='pygmentize -g'
alias vlcx='/Applications/VLC.app/Contents/MacOS/VLC -I macosx --extraintf rc'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias mif=mediainfo
alias kz="kustomize"
alias t="tree -C"
alias tl="t -L"
alias t1="tl 1"
alias cc="code -r"
alias vzh="vi ~/.zshrc"
alias vvi="vi ~/.vimrc"
alias k9='kill -9'
alias p=' ps aux | grep'
alias gs='git status -s'
alias gdh='git diff HEAD'
alias g='git'
alias b='brew'
alias cd=' cd'
alias ...=' cd ..; cd ..; ls'
alias ....=' cd ..; cd ..; cd ..; ls'
alias cd..='..'
alias cd...='...'
alias cd....='....'
alias -g Gc='| grepc'
alias -g G='| grep '
alias -g P='2>&1 | $PAGER'
alias -g L='| less'
alias -g LA='2>&1 | less'
alias -g M='| most'
alias -g C='| wc -l'
alias v="vim"
# open files alias
alias -s md=" open"
alias -s markdown="open"
alias -s htm="$BROWSER"
alias -s html="$BROWSER"
alias gitzip="git archive HEAD -o "

# to sync dot files
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias configsync='function _sync_dotfile(){config add $1;config commit -m "add $1";config push;};_sync_dotfile'

function chpwd () { ls }
function grepc () { grep --color=always -e $1 -e "$" }
function kpc() {kubectl get pods $1 -o jsonpath='{.spec.containers[*].name}'}
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source <(stern --completion=zsh)
ssh-add -K ~/.ssh/id_rsa

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nestor/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nestor/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nestor/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/nestor/google-cloud-sdk/completion.zsh.inc'; fi
export PATH=$PATH:/usr/local/Cellar/node/14.1.0/bin/
