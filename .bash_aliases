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

# cd shortcuts
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

# convenient behaviour of some commands
alias mkdir='mkdir -pv' # let mkdir create parent folders if needed and report
# Human-readable outputs
alias df='df -H'
alias du='du -ch'

alias lsblkl='lsblk -pb -o NAME,MAJ:MIN,TYPE,SIZE,FSSIZE,FSTYPE,MOUNTPOINTS,HOTPLUG,LABEL,PARTTYPENAME,PARTFLAGS'


### UTILITY ###

alias today='date +"%Y%m%d"' # Print yyyymmdd human-readable
alias now='date +"%H:%M"' # Print time hh:mm:ss human-readable
alias nows='date +"%H:%M:%S"' # Print time hh:mm:ss human-readable
# Add an "alert" alias for long running commands. Show notification pop-up and play sound when done.
# Use like so: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')" \
    && cvlc --no-video /usr/share/sounds/freedesktop/stereo/complete.oga >/dev/null 2>&1'

# recursively find last edited files and print human-readable timestamp
alias find-lastedited="find . -type f -printf '%TY-%Tm-%Td %TH:%TM %p\n'| sort -h"

# print OS version
function os_version() {
    echo $(sed -n '/\<NAME\>/p' /etc/os-release | awk -F'=' '{print $2}' | \
        sed 's/"//g') $(sed -n '/\<VERSION\>/p' /etc/os-release | \
        awk -F'=' '{print $2}' | sed 's/"//g')
    }

# pipe output of command to clipboard. use like mycmd | pipe2clip
alias pipe2clip='xclip -r -selection clipboard'
alias p2c='pipe2clip'
# create qr-code from clipboard content
alias clip2qr='xclip -o | qrencode -o - | feh -'
alias c2q='clip2qr'
# create qr-code from command output. use like mycmd | pipe2qr
alias pipe2qr='qrencode -o - | feh -'
alias p2q='pipe2qr'
# create qr-code from command output and show on screen. use like mycmd | qr2screen
alias qr2screen='qrencode -o - | feh --force-aliasing -ZF -'
alias q2s='qr2screen'
# show command output as image on screen. use like mycmd | img2screen
alias img2screen='feh --force-aliasing -ZF'
alias i2s='qr2screen'

# open file in existing instance
alias gvimadd='gvim --servername GVIM --remote'

# Python
alias python='python3.10' # since openSUSE still uses 2 by default ...
alias jpl='jupyter-lab'
alias ipynb2pdf='ipython nbconvert --to latex --post pdf'
# add author: --SphinxTransformer.author="$1"

# Extract various different archive formats
function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar)            tar xf $@                          ;;
            *.tar.gz|*.tgz)   tar xzf $@                         ;;
            *.tar.bz2|*.tbz2) tar xjf $@                         ;;
            *.bz2)            bunzip2 -kvd $@                    ;;
            *.zip)            unzip $@                           ;;
            *.gz)             gunzip $@                          ;;
            *.Z)              uncompress $@                      ;;
            *.rar)            rar x $@                           ;;
            *.7z)             7z x $@                            ;;
            *)                echo "Unknown archive type (ext.)" ;;
        esac
    else
        echo "No such file: '$1'"
    fi
}

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
ssh -S "$1" -O check bla # bogus arguments required, not used
}
function sshcm () {
    [[ -z "$1" ]] && echo -e "Error. Usage: ${FUNCNAME[0]} ${Underline}command${Reset} [argument]" && return 2
    case "$1" in
        ls|list)
            for s in $(ls ~/.ssh/cm_* 2>/dev/null || echo 'None'); do
                echo "$s"
            done;;
        status)
            control_masters=$(ls ~/.ssh/cm_* 2>/dev/null)
            if [[ -n $control_masters ]]; then
                for s in $control_masters; do
                    echo "$s"
                    sshcm-status "$s"
                done
            else
                echo 'No control masters active.'
                fi;;
            connect | open)
                [[ -n "$2" ]] && ssh "$2" ;;
            rm | disconnect | close | kill)
                if [[ -n "$2" ]]; then
                    s=$(ls ~/.ssh/cm_*${2}* 2>/dev/null)
                    [ -z "$s" ] && echo "Nothing to do" && return
                    echo "Disconnecting host $2 (socket $s)."
                    ssh -S "$s" -O exit bla
                    fi;;
                *)
                    echo "Unknown command for function ${FUNCNAME[0]}: $1"
                    return 2;;
            esac
}

# Update SSH environment variables
function env-ssh () {
    local FORCE
    [[ "$1" == '-f' ]] && FORCE=true || FORCE=false
    # TODO Ensure agent pid and auth sock match
    if [[ -z "$SSH_AGENT_PID" || -z "$SSH_AUTH_SOCK" ]] || $FORCE; then
        SSH_AGENT_PID="$(ps -fC ssh-agent | tail -1 | awk '{print $2}' | grep '[0-9]\+')" \
            SSH_AUTH_SOCK=$(
                    find /tmp -path "/tmp/ssh-*" -name "agent.*" 2>/dev/null | \
                        awk -F'agent.' '$2>p{p=$2;s=$0} END{print s}'
                ) ||
                {
                    echo "No agent found, starting new one .."
                    eval "$(ssh-agent)" >/dev/null
                }
    fi
}
env-ssh -q

# Update tmux environment: SSH env. var.s, ...
# TODO: Test and fix
function env-tmux () {
    env-ssh -f
    # force refreshing all variables? default otherwise.
    for v in SSH_AGENT_PID SSH_AUTH_SOCK; do
        tmux setenv "${v#-}" "${!v}"
        tmux setenv -g "${v#-}" "${!v}"
    done
    [[ -f ~/.tmux/startup.sh ]] && . ~/.tmux/startup.sh
}

# Get disk usage by file type
function filesizebytype() {
    find . -type f -iname "*.$1" -print0 | xargs -r0 du -a| awk '{sum+=$1} END {print sum}'
}
alias fsbt='filesizebytype'
# Get disk usage by file name
function filesizebyname() {
    find . -type f -iname "$1" -print0 | xargs -r0 du -a| awk '{sum+=$1} END {print sum}'
}
alias fsbn='filesizebyname'

# Generate password within pass command, with characters defined by $PASSWORD_STORE_CHARACTER_SET
# This set of special characters should be a bit safer with services that don't allow everything.
. /usr/share/bash-completion/completions/pass
 
complete -o default -F _pass_complete_entries passg
function passg () {
    [[ $# -ne 2 ]] && echo "Error. Usage: ${FUNCNAME[0]} <name> <length>" && return 2
    PASSWORD_STORE_CHARACTER_SET="[a-zA-Z0-9]"'\!@#$%^&*()-_=+[]{};:.<>\/|' pass generate "$1" "$2"
}
 
complete -o default -F _pass_complete_entries passc
function passc () {
    local PASS_LINE="1" PASS_ENTRY
    [[ $1 =~ '-c' ]] && PASS_LINE=${1#-c} && PASS_ENTRY="$2" || PASS_ENTRY="$1"
    pass "$PASS_ENTRY" | awk "NR == ${PASS_LINE} {print}" | sed 's/^[ ]*[a-z]\+:[ ]*//' | xclip -r -selection clipboard
}
 
# Parse YAML format pass entries
function passy () {
    local msg_usage="Usage: ${FUNCNAME[0]} [options] <entry> [YAML key (default pw)]"
    local msg_info="Parse YAML format pass entries"
    local msg_options='Options:
\t-h, --help\t\tdisplay this help and exit
\t-c, --copy\t\tcopy result to clipboard'
    local msg_help="$msg_usage\n$msg_info\n\n$msg_options\n"
    local msg_error="${msg_usage}\nTry '${FUNCNAME[0]} -h' for more information."

    [[ -z "$*" ]] && \
        { echo -e "ERROR. ${msg_error}" >&2; return 2; }
    COPY=false
    # transfer long opt.s to short opt.s, getopts doesn't support long ones
    for arg in "$@"; do
        case "$arg" in
            --help) shift; set -- "$@" '-h'; echo -e "$msg_help"; return ;;
            --copy) shift; set -- "$@" '-c'                              ;;
        esac
    done
    OPTIND=1 # reset for getopts to work
    while getopts ":hc" opt; do
        case "$opt" in
            h) echo -e "$msg_help"; return;;
            c) COPY=true;;
            # :) echo "Option requires an argument: -${OPTARG}"; return 1;;
            ?) echo "Invalid option: -${OPTARG}"; return 1;;
        esac
    done
    shift $((OPTIND - 1)) # remove options from arguments

    pass_entry="$1"
    [[ -n "$2" ]] && yaml_key="$2" || yaml_key=""

    if [[ "$COPY" == 'true' ]]; then
        pass "$pass_entry" | yq ".${yaml_key}" | xclip -r -selection clipboard
    else
        pass "$pass_entry" | yq ".${yaml_key}"
    fi
}
complete -o default -F _pass_complete_entries passy
alias yp='passy'

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
    command /opt/sublime_merge/sublime_merge "$@" > /dev/null 2>&1 &
}
alias sublime-merge='subm'
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
    command obsidian "$@" > /dev/null 2>&1 &
}
function gwenview() {
    command gwenview "$@" > /dev/null 2>&1 &
}


### GIT ###
alias gstatus='git status'
alias gtree='git ls-tree --full-tree -r --name-only HEAD'
alias gdiff='git diff'
# Ignore whitespace changes
alias gdiff-igws='git diff -b'
# commit, automatically adding modified files, with inline message
alias gcomm-am='git commit -am'
# git log cat'ed
alias glog='GIT_PAGER=cat git log'
# short ID, author name and 1st line
alias glogs='git log --pretty="tformat:%C(auto) %h %Cgreen%aN%Creset %s"'

### KDE ###
function kwin-reset() {
sed -i 's/lastScreen=[1-9]/lastScreen=0/g' ~/.config/plasma-org.kde.plasma.desktop-appletsrc
plasmashell --replace >/dev/null 2>&1 &
disown
kwin --replace >/dev/null 2>&1 &
disown
}
alias sysclean='sudo zypper rm -u'
alias sysup='sudo zypper -n dup -yl'


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

# Rename images using EXIF data: date and time taken, plus a number if multiple files with same name
# Use like: <command> <directory>
alias picture_rename="exiftool '-filename<CreateDate' -d %Y%m%d_%H%M%S%%-c.%%e"
# run latexmk, trying to guess main tex file
alias latexmkspeciale='grep -l '\''\documentclass'\'' *tex | xargs latexmk -pdf -pvc -silent'
