##############
# ZSH CONFIG #
##############
# Profiling
zmodload zsh/zprof

# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd beep extendedglob nomatch
setopt HIST_IGNORE_DUPS
# history search
bindkey -e

zstyle :compinstall filename '/home/mtcs/.zshrc'

# Completion
autoload -Uz compinit
compinit
setopt completeinword
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'
setopt completealiases



# Spell correction
setopt correct


### Plugins
if ( grep -q Ubuntu /etc/issue ) ; then
    export ZSH="$HOME/.oh-my-zsh"
	OMZSH="${HOME}/.oh-my-zsh/"
	SHPATH="/usr/share"
else
    export ZSH='/usr/share/oh-my-zsh'
	OMZSH='/usr/share/oh-my-zsh/'
	SHPATH="/usr/share/zsh/plugins"
fi
# # Productivity
source $SHPATH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $OMZSH/plugins/colored-man-pages/colored-man-pages.plugin.zsh
# source $OMZSH/plugins/colorize/colorize.plugin.zsh
# source $OMZSH/plugins/cp/cp.plugin.zsh
# source $OMZSH/plugins/extract/extract.plugin.zsh
# source $OMZSH/plugins/fbterm/fbterm.plugin.zsh
# source $OMZSH/plugins/vundle/vundle.plugin.zsh
# # FS Jumping
# source $OMZSH/plugins/z/z.plugin.zsh
# # Themes
# source $OMZSH/plugins/themes/themes.plugin.zsh
plugins=(
    aws
    colored-man-pages
    colorize
    cp
    docker
    extract
    fbterm
    fzf
    git-flow
    gitfast
    pip
    python
    sudo
    systemd
    tmux
    z
    )

# ZSH_THEME="agnoster"
POWERLEVEL9K_MODE='awesome-fontconfig'
# POWERLEVEL9K_COLOR_SCHEME='light'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='grey30'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='grey93'
POWERLEVEL9K_DIR_HOME_BACKGROUND='025'
POWERLEVEL9K_DIR_HOME_FOREGROUND='grey93'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='grey35'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='grey93'
POWERLEVEL9K_DIR_ETC_BACKGROUND='228'
POWERLEVEL9K_DIR_ETC_FOREGROUND='grey30'
#POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='deepskyblue3'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='031'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='grey100'
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND='orange1'
POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND='grey30'
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='red3a'
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='grey93'
POWERLEVEL9K_CONTEXT_SUDO_BACKGROUND='darkorange'
POWERLEVEL9K_CONTEXT_SUDO_FOREGROUND='grey93'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir virtualenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
if ( grep -q Ubuntu /etc/issue ) ; then
    ZSH_THEME="powerlevel9k/powerlevel9k"
fi
# ZSH_THEME="powerline"

source $ZSH/oh-my-zsh.sh
if ( ! grep -q Ubuntu /etc/issue ) ; then
    source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
fi

# Key Re-mapping
typeset -A key
key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# setup key accordingly
bindkey  "${key[Home]}"     beginning-of-line
bindkey  "${key[End]}"      end-of-line
bindkey  "${key[Insert]}"   overwrite-mode
bindkey  "${key[Delete]}"   delete-char
bindkey  "${key[Up]}"       up-line-or-history
bindkey  "${key[Down]}"     down-line-or-history
bindkey  "${key[Left]}"     backward-char
bindkey  "${key[Right]}"    forward-char
bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
bindkey  "${key[PageDown]}" end-of-buffer-or-history

bindkey  "${key[PageUp]}"    history-beginning-search-backward
bindkey  "${key[PageDown]}"  history-beginning-search-forward

# Keypad
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[Ol" "."
bindkey -s "^[OM" "^M"
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * /
bindkey -s "^[Ok" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"


# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi


# Vizited directories
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
	dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
	[[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
	print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

### This reverts the +/- operators.
setopt pushdminus


#########
# ALIAS #
#########

if [[ -x "`whence -p dircolors`" ]]; then
	eval `dircolors`
	alias ls='ls -F --color=auto'
else
	alias ls='ls -F'
fi

pdf_embed_font () { gs -o ${1%.*}-embedded.pdf -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress $1 }

alias ll='ls -l'
alias la='ls -a'
alias vi='vim'
alias nvi='nvim'
alias ccat='colorize'
alias grep='grep --color'

# Pacman Yaourt Powerpill
# Package update
alias pclean='sudo pacman -Scc'
alias psiu='sudo powerpill -Syu'
alias PSIU='sudo powerpill -Syu --noconfirm'
alias saiu='yaourt -Sayu'
alias SAIU='yaourt -Sayu --noconfirm'
alias reflectorbr='sudo reflector --verbose --country Brazil  -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist'
alias reflectoreua='sudo reflector --verbose --country "United States"  -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist'
alias popti='pclean; reflectorbr; sudo pacman-optimize'
# Package search and install
alias pinst='sudo powerpill -S'
alias yinst='sudo echo; yaourt -S'
alias YINST='sudo echo; yaourt --noconfirm -S'
alias pse='pacman -Ss'
alias yse='yaourt -Ss'

alias beep='mplayer -msglevel all=-1 /usr/share/sounds/gnome/default/alerts/glass.ogg &> /dev/null'

alias kt='tracker daemon -k all'


#########################
# Environment variables #
#########################

export EDITOR=vim
export BROWSER=google-chrome-stable
export MAKEFLAGS="-j 3"
export TERM=xterm-256color
export JULIA_NUM_THREADS=4

# Python virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=$HOME/dev/projects
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
#export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

# Terraform
#export TF_VAR_tenancy_ocid=ocid1.tenancy.oc1..aaaaaaaaemyx7bihj42qbbig3t6cf4b6a4msdc2pnnkfoj65tmktow5vuoya
#export TF_VAR_user_ocid=
#export TF_VAR_compartment_ocid=<The tenancy OCID can be used as the compartment OCID of your root compartment>
#export TF_VAR_fingerprint="5f:8d:1f:80:0a:e8:5e:d5:00:06:e6:83:b7:5e:ef:f7"
#export TF_VAR_private_key_path="/home/mtcs/.oci/oci_api_key.pem"


# Path MOVED TO .profile
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.bin:$(perl ~/.cope/cope_path.pl):$(ruby -e 'print Gem.user_dir')/bin:$PATH"


###########
# Motd    #
###########

#if [[ $USER != "root" ]]; then
	if [[ ! -e "~/.motd" ]]; then cat ~/.motd ; fi
#	if [[ ! -e "~/.bin/archnews" ]]; then ~/.bin/archnews -l ; fi
#fi


###########
# Daemons #
###########

# Powerline
#export POWERLINE_CONFIG_OVERRIDES='ext.shell.colorscheme="solarized"'
#export POWERLINE_THEME_OVERRIDES=''
#powerline-daemon -q


#. /usr/share/zsh/site-contrib/powerline.zsh
#if ( grep -q Ubuntu /etc/issue ) ; then
#	. /usr/share/powerline/bindings/zsh/powerline.zsh
#else
#	. /usr/lib/python3.?/site-packages/powerline/bindings/zsh/powerline.zsh
#fi

# For tillix
if [[ $TERMINIX_ID ]]; then
	source /etc/profile.d/vte.sh
fi

#if [[ -e /usr/local/bin/virtualenvwrapper.sh ]]; then
#	. /usr/local/bin/virtualenvwrapper.sh
#fi
