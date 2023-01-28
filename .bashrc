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
# Test last command for error to switch color of displayed return code
function error_test {
  EXIT_STATUS=$?
  [[ $EXIT_STATUS -eq 0 ]] && ES_COLOUR=$BGreen || ES_COLOUR=$BRed
}
# Custom prompt
prompt() {
  error_test
  PS1="$Reset$Grey[$Reset$BBlue\A$Reset$Grey][$Reset$ES_COLOUR$EXIT_STATUS$Reset$Grey][$Reset$BTeal\u@\h$Reset$Grey]$Reset$BOrange\w$Reset$Grey>$Reset "
  # Cyberpunk
  # PS1="$CbDarkBlue[$Reset$BCbBlue\A$Reset$CbDarkBlue][$Reset$ES_COLOUR$EXIT_STATUS$Reset$CbDarkBlue][$Reset$BCbOrange\u@${HOSTNAME}$Reset$CbDarkBlue]$Reset$BCbPink\w$Reset$CbDarkBlue>$Reset"
}
PROMPT_COMMAND=prompt

# ----------------------------------- Eternal bash history -----------------------------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
