export EDITOR=nvim
export BROWSER=firefox

# export PATH=$PATH:/sbin/
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.gem/ruby/3.1.0/bin"
export PATH

if [ -f ~/.bashrc.local ]; then
  . ~/.bashrc.local
fi
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
# Personal theme: colours, etc.
if [ -f ~/.bashtheme ]; then
  . ~/.bashtheme
fi

# --------------------------------------- Bash prompt ----------------------------------------------

# Default prompt
PS1="\u@\h:\w>"

function error_test {
    EXIT_STATUS=$?
    [[ $EXIT_STATUS -eq 0 ]] && ES_COLOUR=$BGreen || ES_COLOUR=$BRed
}

prompt() {
    error_test
    # Using tput seems to break my terminal (Konsole): using keys such as Home results in the displayed
    # text being f'd up and the caret does weird shit
    # if [[ "$TERM" =~ derp ]]; then
    #     PS1="$Grey[$BBlue\A$Reset$Grey]-[$ES_COLOUR$EXIT_STATUS$Reset$Grey]-[$BTeal\u@${HOSTNAME}$Reset$Grey]$BOrange\w$Reset$Grey> $Reset"
    # else
        PS1="$White[$BBlue\A$White]-[$ES_COLOUR$EXIT_STATUS$White]-[$BMint\u@${HOSTNAME}$White]$BYellow\w$White> $Reset"
    # fi
}
PROMPT_COMMAND=prompt
