export EDITOR=nvim
export BROWSER=firefox

# export PATH=$PATH:/sbin/
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.gem/ruby/3.1.0/bin"
PATH="$PATH:$HOME/go/bin"
export PATH
# [[ $TERM =~ screen ]] && export TERM='screen-256color' # force 256 colour

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

# Path to personal scripts etc. Overwrite if you want to use a project's utils.
export UTILDIR=${UTILDIR:-~/rsrc}

# --------------------------------------- Bash prompt ----------------------------------------------
# Default prompt
PS1="\u@\h:\w>"
# Test last command for error to switch color of displayed return code
function error_test {
  export EXIT_STATUS=$?
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
PROMPT_COMMAND="$PROMPT_COMMAND; history -a"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# ------------------------------------------- Other ------------------------------------------------
# SSH
# Set ssh-agent environment variables if one is running, but not set up
# TODO
# ssh-add -l >/dev/null || eval "$(ssh-agent)"
# [[ -z "$SSH_AGENT_PID" ]] && export SSH_AGENT_PID=$SSH_AGENT_PID
# ssh_auth_sock_str=:"/tmp/ssh*/agent.$((SSH_AGENT_PID - 1))"
# [[ -z "$SSH_AUTH_SOCK" ]] && export SSH_AUTH_SOCK=$(ls "$ssh_auth_sock_str")
