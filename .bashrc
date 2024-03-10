export EDITOR=nvim
export BROWSER=firefox

PATH="$PATH:$HOME/.local/bin"
export PATH

# [[ $TERM =~ screen ]] && export TERM='screen-256color' # force 256 colour

if [ -f ~/.bashrc.local ]; then
  . "${HOME}/.bashrc.local"
fi
if [ -f ~/.bash_aliases ]; then
  . "${HOME}/.bash_aliases"
fi

# Path to personal scripts etc. Overwrite if you want to use a project's utils.
export UTILDIR=${UTILDIR:-"${HOME}/rsrc"}

# ---------------------------------- Prompt ------------------------------------
# Default prompt
PS1="\u@\h:\w>"

# Personal theme: colours, etc.
if which starship &>/dev/null && eval "$(starship init bash)"; then
    :
elif [ -f ~/.bashtheme ]; then
  . "${HOME}/.bashtheme"
fi

# ------------------------------ Eternal History -------------------------------
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
PROMPT_COMMAND="${PROMPT_COMMAND}; history -a"

# ------------------------------- Environment ----------------------------------
PATH="$PATH:$HOME/go/bin"
PATH="$PATH:$HOME/.gem/ruby/3.1.0/bin"
# Add Ruby Version Manager (RVM) to PATH for scripting.
# Make sure this is the last PATH variable change.
[[ -d "${HOME}/.rvm/bin" ]] && PATH="${PATH}:${HOME}/.rvm/bin"
export PATH
# Use Python HOME dir. virtual environment if present
# [[ -d "${HOME}/.venv" ]] && . "${HOME}/.venv/bin/activate"

# SSH
# Set ssh-agent environment variables if one is running, but not set up
# FIX: SSH environment variables, especially in tmux (after resurrect)

# pnpm
export PNPM_HOME="/home/erfort/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
