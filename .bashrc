export EDITOR=nvim
export BROWSER=firefox

# export PATH=$PATH:/sbin/
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.gem/ruby/3.1.0/bin"
export PATH
[[ $TERM =~ screen ]] && export TERM='screen-256color' # force 256 colour

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
  PS1="$Reset$Grey[$Reset$BBlue\A$Reset$Grey][$Reset$ES_COLOUR$EXIT_STATUS$Reset$Grey][$Reset$BTeal\u@\h$Reset$Grey]$Reset$BOrange\w$Reset$Grey>$Reset "
  # Cyberpunk
  # PS1="$CbDarkBlue[$Reset$BCbBlue\A$Reset$CbDarkBlue][$Reset$ES_COLOUR$EXIT_STATUS$Reset$CbDarkBlue][$Reset$BCbOrange\u@${HOSTNAME}$Reset$CbDarkBlue]$Reset$BCbPink\w$Reset$CbDarkBlue>$Reset"
}
PROMPT_COMMAND=prompt
