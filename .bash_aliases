  # Personal theme: colours, etc.
if [ -f ~/.bashtheme ]; then
        . ~/.bashtheme
fi

### BASH COMMANDS ###
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -C'
alias ll='ls -lh'
alias lll='ls -lhtr'
# Doesn't sem to work as an alias
function lllt() {
  command ls --color=always -lhtr "$@" | tail
}

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

alias mkdir='mkdir -pv' # let mkdir create parent folders if needed and report
# Human-readable outputs
alias df='df -H'
alias du='du -ch'

alias lsblkl='lsblk -pb -o NAME,MAJ:MIN,TYPE,SIZE,FSSIZE,FSTYPE,MOUNTPOINTS,HOTPLUG,LABEL,PARTTYPENAME,PARTFLAGS'

function os_version() {
  echo $(sed -n '/\<NAME\>/p' /etc/os-release | awk -F'=' '{print $2}' | sed 's/"//g') $(sed -n '/\<VERSION\>/p' /etc/os-release | awk -F'=' '{print $2}' | sed 's/"//g')
}


### UTILITY ###

alias today='date +"%Y%m%d"' # Print yyyymmdd human-readable
alias now='date +"%H:%M"' # Print time hh:mm:ss human-readable
alias nows='date +"%H:%M:%S"' # Print time hh:mm:ss human-readable
# Add an "alert" alias for long running commands. Use like so: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')" \
  && cvlc --no-video /usr/share/sounds/freedesktop/stereo/complete.oga >/dev/null 2>&1'

alias gvimadd='gvim --servername GVIM --remote' # open file in existing instance

alias pipe2clip='xclip -r -selection clipboard'
alias clip2qr='xclip -o | qrencode -o -'
alias pipe2qr='qrencode -o'
alias qr2screen='qrencode -o - | feh --force-aliasing -ZF -'
alias img2screen='feh --force-aliasing -ZF -'
alias jpl='jupyter-lab'
alias ipynb2pdf='ipython nbconvert --to latex --post pdf'
# add author: --SphinxTransformer.author="$1"

# TODO Shortcuts to various things bundled in one place, so I don't have to remember it all
# function portal() {
#   if [ $# -eq 0 ]; then
#       ls ~/.portal
#   else
#       cwd=$PWD
#       cd ~/.portal
#       $EDITOR "$@"
#       cd $cwd
#   fi
# }
# complete -f -X '~/.portal/*' portal

# Diverse hardware info
# function hwinfo() {
#   if [[ ! -z $1 ]]; then
#     arg = "$1"
#   else
#     select TODO continue
#   fi
# }

# SSH ControlMaster helpers
function sshcm-status () {
  ssh -S "$1" -O check bla
}
function sshcm () {
  [[ -z "$1" ]] && echo -e "Error. Usage: ${FUNCNAME[0]} ${Underline}command${Reset} [argument]" && return 2
  case "$1" in
    list)
      for s in $(ls ~/.ssh/cm_* 2>/dev/null || echo 'None'); do
        echo "$s"
      done;;
    status)
      control_masters=$(ls ~/.ssh/cm_* 2>/dev/null)
      if [ -n $control_masters ]; then
        for s in $control_masters; do
          echo "$s"
          sshcm-status "$s"
        done
      else
        echo 'No control masters active.'
      fi;;
    connect | open)
      [[ ! -z "$2" ]] && ssh "$2" ;;
    disconnect | close | kill)
      if [ -n "$2" ]; then
        s=$(ls ~/.ssh/cm_*${2}* 2>/dev/null)
        [ -z "$s" ] && return
        echo "Disconnecting host $2 (socket $s)."
        ssh -S "$s" -O exit bla
      fi;;
    *)
      echo "Unknown command for function ${FUNCNAME[0]}: $1"
      return 2;;
  esac
}

# Get data usage by file type
function filesizebytype() {
  find . -type f -iname "*.$1" -print0 | xargs -r0 du -a| awk '{sum+=$1} END {print sum}'
}
# Get data usage by file name
function filesizebyname() {
  find . -type f -iname "$1" -print0 | xargs -r0 du -a| awk '{sum+=$1} END {print sum}'
}

# Generate password within pass command, with characters defined by $PASSWORD_STORE_CHARACTER_SET
# This set of special characters should be a bit safer with services that don't allow everything.
function pass-gen () {
  [ $# -ne 2 ] && echo "Error. Usage: ${FUNCNAME[0]} name length" && return 2
  PASSWORD_STORE_CHARACTER_SET="[a-zA-Z0-9]"'\!@#$%^&*()-_=+[]{};:.<>\/|' pass generate "$1" "$2"
}

# System commands
function nwrestart() {
  command systemctl restart NetworkManager
}

# re-define commands without output spam and as background process
# function subl() {
#   command /usr/bin/sublime_text/sublime_text "$@" > /dev/null 2>&1 &
# }
# function qpdf() {
#   command qpdfview "$@" > /dev/null 2>&1 &
# }
function subm() {
  command /usr/local/bin/sublime_merge/sublime_merge "$@" > /dev/null 2>&1 &
}
function okular() {
  command okular "$@" > /dev/null 2>&1 &
}
function libreoffice() {
  command libreoffice "$@" > /dev/null 2>&1 &
}
function dolphin() {
  command dolphin "$@" > /dev/null 2>&1 &
}
function obsidian() {
  command obsidian ${@} > /dev/null 2>&1 &
}
function gwenview() {
  command gwenview "$@" > /dev/null 2>&1 &
}


### GIT ###
alias gstatus='git status'
alias glog='GIT_PAGER=cat git log' # git log cat'ed
alias gtree='git ls-tree --full-tree -r --name-only HEAD'
alias gdiff='git diff'
alias gdiff-igws='git diff -b' # Ignore whitespace changes
alias gcomm-am='git commit -am' # commit, automatically adding modified files, with inline message

### KDE ###
function kwin-restart() {
  nohup plasmashell --replace >/dev/null 2>&1 &
  nohup kwin --replace >/dev/null 2>&1 &
}
alias zyppurge='sudo zypper rm -u'
alias zypdup='sudo zypper dup -y --auto-agree-with-licenses'


### DEVICES ###

# Open and mount encrypted USB device
function crypt_mount() {
  case $# in
    1)
      dev_map=cr_usb;;
    2)
      dev_map="$2";;
    *)
      echo "Error. Usage: ${FUNCNAME[0]} block_device [device_mapper]"; return 1;;
  esac
  dev=/dev/$(basename "$1")
  dev_map=/dev/mapper/$(basename "$dev_map")
  sudo cryptsetup luksOpen "$dev" $(basename "$dev_map")
  udisksctl mount -b "$dev_map"
  echo "Opened and mounted device $dev (mapper $dev_map)"
}
# Unmount and close encrypted USB device
function crypt_unmount() {
  if [ $# -eq 0 ]; then
    dev_map=cr_usb
  fi
  dev=$(lsblk | grep "$dev_map" | awk '{print $7}')
  udisksctl unmount -b "/dev/mapper/$dev_map" >/dev/null 2>&1
  sudo cryptsetup luksClose "$dev_map"
  echo "Unmounted and closed device $dev (mapper $dev_map)"
}

# Work-around to filter Logitech bluetooth device errors from log, otherwise unreadable
# TODO prevent this from actually ending up in the log
function dmesg() {
   command dmesg -xT --color=always "$@" | grep -v 'logitech-djreceiver'
}


### MISC

# Firefox
alias ffse='nohup firefox -P "Sebastian Erfort" >/dev/null 2>&1 &'
# Rename images with EXIF data (to date and time taken, plus a number if multiple files with same name)
# Use like: command directory
alias picture_rename="exiftool '-filename<CreateDate' -d %Y%m%d_%H%M%S%%-c.%%e"
# run latexmk, trying to guess main tex file
alias latexmkspeciale='grep -l '\''\documentclass'\'' *tex | xargs latexmk -pdf -pvc -silent'
