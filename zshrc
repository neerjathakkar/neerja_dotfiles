# Neerja's .zshrc file
# Some functions taken from https://matt.blissett.me.uk/linux/zsh/zshrc

##### STARTUP
echo "hello neerja"
RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
RPS2=$RPS1

# use vim keybindings in terminal
set -o vi
 . /usr/local/etc/profile.d/z.sh

# plugins
plugins=(
    git
    z
)

# use up/down keys to autocomplete from history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Short command aliases
alias 'l=ls'
alias 'la=ls -A'
alias 'll=ls -l'

# Play safe!
alias 'rm=rm -i'
alias 'mv=mv -i'
alias 'cp=cp -i'

# For Git
alias 'gs=git status' # (NB overriding GhostScript)
alias 'gp=git pull'

# For convenience
alias 'mkdir=mkdir -p'
alias 'cd..= cd ..'

# Quick find
f() {
    echo "find . -iname \"*$1*\""
    find . -iname "*$1*"
}

# Quick regex history search
zh() {
    pattern=^$(echo '(?=.*'${^@}')' | tr -d ' ')
    grep --text ~/.zsh_history --perl-regexp --regexp $pattern
}


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/neerjathakkar/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/neerjathakkar/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/neerjathakkar/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/neerjathakkar/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
