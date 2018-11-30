export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=""

plugins=(
  git zsh-autosuggestions dirhistory brew vagrant dircycle fasd httpie vscode web-search urltools Kubectl
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

# Aliases
alias catc='pygmentize -g'
alias vlcx='/Applications/VLC.app/Contents/MacOS/VLC -I macosx --extraintf rc'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias mif=mediainfo
alias cc="code -r"
alias vzh="vi ~/.zshrc"
alias k9='kill -9'
alias p=' ps aux | grep'
alias gs='git status -s'
alias g='git'
alias b='brew'
alias cd=' cd'
alias ...=' cd ..; cd ..; ls'
alias ....=' cd ..; cd ..; cd ..; ls'
alias cd..='..'
alias cd...='...'
alias cd....='....'
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

# to sync dot files
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias configsync='function _sync_dotfile(){config add $1;config commit -m "add $1";config push;};_sync_dotfile'

function chpwd () { ls } 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
