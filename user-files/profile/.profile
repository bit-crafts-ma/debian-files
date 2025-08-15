shopt -s checkwinsize
shopt -s histappend
HISTCONTROL=ignoredups:erasedups
HISTSIZE=10000
HISTFILESIZE=20000
PROMPT_DIRTRIM=2

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
    if [ -f "$HOME/.bash_exports" ]; then
        . "$HOME/.bash_exports"
    fi
    if [ -f "$HOME/.bash_aliases" ]; then
        . "$HOME/.bash_aliases"
    fi
    if [ -f "$HOME/.bash_env" ]; then
        . "$HOME/.bash_env"
    fi
fi