set -o vi

alias c=clear
alias svi='sudo vi'

## bash file sourced from internet ##
#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all my BASH configurations and aliases
#
#  Sections:
#  1.  Environment Configuration
#  2.  Make Terminal Better (remapping defaults and adding functionality)
#  3.  File and Folder Management
#  4.  Searching
#  5.  Process Management
#  6.  Networking
#  7.  System Operations & Information
#  8.  Web Development
#  9.  Reminders & Notes
#
#  ---------------------------------------------------------------------------

#   -------------------------------
#   1. ENVIRONMENT CONFIGURATION
#   -------------------------------

#   Change Prompt
#   ------------------------------------------------------------
#    export PS1="________________________________________________________________________________\n| \w @ \h (\u) \n| => "
#    export PS2="| => "

#   Set Paths
#   ------------------------------------------------------------
    export PATH="$PATH:/usr/local/bin/:/Users/ankit/Documents/mongodb_installation/mongodb-osx-x86_64-3.4.2/bin"
    export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
    export GOROOT=/usr/local/go
    export PATH=$PATH:$GOROOT/bin 
    export GOPATH=$HOME/go
    export PATH="$PATH:$GOPATH/bin"

#   Set Default Editor (change 'Nano' to the editor of your choice)
#   ------------------------------------------------------------
    export EDITOR=/usr/bin/vim

#   Set default blocksize for ls, df, du
#   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------
    export BLOCKSIZE=1k

#   Add color to terminal
#   (this is all commented out as I use Mac Terminal Profiles)
#   from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
#   ------------------------------------------------------------
   export CLICOLOR=1
   export LSCOLORS=ExFxBxDxCxegedabagacad


#   -----------------------------
#   2. MAKE TERMINAL BETTER
#   -----------------------------

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -lh'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias edit='subl'                           # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
# https://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows
export HISTSIZE=100000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignorespace:ignoredups
export HISTTIMEFORMAT="[%F %T] "

_bash_history_sync() {
  builtin history -a         #1
  HISTFILESIZE=$HISTSIZE     #2
}

_bash_history_sync_and_reload() {
  builtin history -a         #1
  HISTFILESIZE=$HISTSIZE     #2
  builtin history -c         #3
  builtin history -r         #4
}

history() {                  #5
  _bash_history_sync_and_reload
  builtin history "$@"
}
#https://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
#PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
#PROMPT_COMMAND='history 1 >> ${HOME}/.bash_eternal_history'
#PROMPT_COMMAND=_bash_history_sync;$PROMPT_COMMAND

#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.            Example: mans mplayer codec
#   --------------------------------------------------------------------
    mans () {
        man $1 | grep -iC2 --color=always $2 | less
    }

#   showa: to remind yourself of an alias (given some part of it)
#   ------------------------------------------------------------
    showa () { /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }


#   -------------------------------
#   3. FILE AND FOLDER MANAGEMENT
#   -------------------------------

zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
alias make1mb='mkfile 1m ./1MB.dat'         # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'         # make5mb:      Creates a file of 5mb size (all zeros)
alias make10mb='mkfile 10m ./10MB.dat'      # make10mb:     Creates a file of 10mb size (all zeros)

#   cdf:  'Cd's to frontmost window of MacOS Finder
#   ------------------------------------------------------
    cdf () {
        currFolderPath=$( /usr/bin/osascript <<EOT
            tell application "Finder"
                try
            set currFolder to (folder of the front window as alias)
                on error
            set currFolder to (path to desktop folder as alias)
                end try
                POSIX path of currFolder
            end tell
EOT
        )
        echo "cd to \"$currFolderPath\""
        cd "$currFolderPath"
    }

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }


#   ---------------------------
#   4. SEARCHING
#   ---------------------------

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
fj () { /usr/bin/find . -name "$1".java ; }      # ff:       Find file under the current directory
#  Find a pattern in a set of files and highlight them:
#+ (needs a recent version of egrep).
function fstr()
{
    OPTIND=1
    local mycase=""
    local usage="fstr: find string in files.
    Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
    while getopts :it opt
        do
            case "$opt" in
                i) mycase="-i " ;;
                *) echo "$usage"; return ;;
            esac
        done
        shift $(( $OPTIND - 1 ))
        if [ "$#" -lt 1 ]; then
            echo "$usage"
                return;
        fi
	find . -type f -name "${2:-*}" -print0 | xargs -0 egrep --color=always -sn ${mycase} "$1" 2>&- | more
}

ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

#   spotlight: Search for a file using MacOS Spotlight's metadata
#   -----------------------------------------------------------
    spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }


#   ---------------------------
#   5. PROCESS MANAGEMENT
#   ---------------------------

#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
    findPid () { lsof -t -c "$@" ; }

#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
    alias memHogsTop='top -l 1 -o rsize | head -20'
    alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
    alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
    alias topForever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
    alias ttop="top -R -F -s 10 -o rsize"

#   my_ps: List processes owned by my user:
#   ------------------------------------------------------------
    my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }


#   ---------------------------
#   6. NETWORKING
#   ---------------------------

#alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
    ii() {
        echo -e "\nYou are logged on ${RED}$HOST"
        echo -e "\nAdditionnal information:$NC " ; uname -a
        echo -e "\n${RED}Users logged on:$NC " ; w -h
        echo -e "\n${RED}Current date :$NC " ; date
        echo -e "\n${RED}Machine stats :$NC " ; uptime
        echo -e "\n${RED}Current network location :$NC " ; scselect
        echo -e "\n${RED}Public facing IP Address :$NC " ;myip
        #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
        echo
    }


#   ---------------------------------------
#   7. SYSTEMS OPERATIONS & INFORMATION
#   ---------------------------------------

alias mountReadWrite='/sbin/mount -uw /'    # mountReadWrite:   For use when booted into single-user

#   cleanupDS:  Recursively delete .DS_Store files
#   -------------------------------------------------------------------
    alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   -------------------------------------------------------------------
    alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
    alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

#   cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
#   -----------------------------------------------------------------------------------
    alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

#    screensaverDesktop: Run a screensaver on the Desktop
#   -----------------------------------------------------------------------------------
    alias screensaverDesktop='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'

#   ---------------------------------------
#   8. WEB DEVELOPMENT
#   ---------------------------------------

alias apacheEdit='sudo edit /etc/httpd/httpd.conf'      # apacheEdit:       Edit httpd.conf
alias apacheRestart='sudo apachectl graceful'           # apacheRestart:    Restart Apache
alias editHosts='sudo edit /etc/hosts'                  # editHosts:        Edit /etc/hosts file
alias herr='tail /var/log/httpd/error_log'              # herr:             Tails HTTP error logs
alias apacheLogs="less +F /var/log/apache2/error_log"   # Apachelogs:   Shows apache error logs
httpHeaders () { /usr/bin/curl -I -L $@ ; }             # httpHeaders:      Grabs headers from web page

#   httpDebug:  Download a web page and show info on what took time
#   -------------------------------------------------------------------
    httpDebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }


#   ---------------------------------------
#   9. REMINDERS & NOTES
#   ---------------------------------------

#   remove_disk: spin down unneeded disk
#   ---------------------------------------
#export CLOUDSDK_PYTHON=python3
# macOS Catalina
#export PYENV_ROOT="$HOME/.pyenv/versions/3.6.7"
#export PATH="$PYENV_ROOT/bin:$PATH"
alias mosh="LC_ALL="en_US.UTF-8" mosh"
alias gco="git checkout --recurse-submodules"
alias gpl="git pull --recurse-submodules"
alias activate_spark="source /Users/ankit.kumar/go/src/sdmain/polaris/.buildenv/bin/activate"
# set editing mode to vi
set editing-mode vi
# set the key binding to 'jk' to enter vi mode from command line
bind '"jk": vi-movement-mode'

alias sourcebash="source ~/.bashrc"
alias editbash="vi ~/.bashrc"
alias editvimrc="vi ~/.vimrc"

get-taskchain-logs() {
        sp-kubectl logs -f $(sp-kubectl get pods | grep `sp-korg-get-taskchain --taskchain-uuid $1 | jq -r .taskchain.workflowName` | cut -d ' ' -f 1) main
}

# spark command shortcuts
#alias spl="source $sparkenv"
alias sp='cd ~/go/src/sdmain/polaris'
alias spe='spark env'
alias spb='sp-service-build'
 
# arcanist shortcuts
alias af='arc feature'
alias ad='arc diff'
alias ade='arc diff --edit'
alias adc='arc diff --create'
alias al='arc land'

# git shortcuts
alias g='git'
alias gs='git status'
alias ga='git add'
alias gl='git log'
alias gd='git diff'
alias gdh='git diff HEAD~1'
alias gco='git checkout'
alias gre='git pull --rebase'
alias gb='git br'
alias gca='git commit --amend'
alias resetsoft='git reset --soft HEAD~1'
alias resethard='git reset --hard HEAD~1'
alias resetfiletohead='g reset HEAD^ --'
alias gcommitlog='git log --format=%B -n 1'
# To produce patch for several commits, you should use format-patch git command, e.g.
# git format-patch -k --stdout R1..R2
# To generate patch for the last commit, run:
alias gpcreate='git format-patch -k --stdout HEAD^'
# Then in another repository apply the patch by am git command, e.g.
# git am -3 -k file.patch
alias gpapply='git am -3 -k'

glaoneline() {
   git log --author=$1 --oneline
}

gla() {
   git log --author=$1
}

loc() {
   git log --author=$1 --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -
}

parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
YELLOW="\[\033[0;33m\]"
NO_COLOR="\[\033[00m\]"
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
#if [ "$color_prompt" = yes ]; then
#    PS1="${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\w$YELLOW\$(parse_git_branch)$NO_COLOR\$ "
#else
#    PS1='${debian_chroot:+($debian_chroot)}\w\$ '
#fi

# login to the dev vm
alias dv='mosh ubuntu@10.0.97.216'

# running log tail for a component
get-pod-id() {
        sp-kubectl -d $1 get pods -l app=$2 | cut -f 1 -d \  | tail -1
}
 
get-logs() {
        sp-kubectl -d $1 logs -f $(get-pod-id $2)
}

get-logs-killed() {
        sp-kubectl -d $1 logs -p $2
}

patchreview() {
   arc patch $1 --nobranch
}

# Parse the taskchain config returned by sp-korg-get-taskchain
# Usage: sp-korg-get-taskchain -d dev-056 --taskchain-uuid 01a93f11-8772-4ef9-a6f6-697b521948ce | jq-taskchain-config
#alias jq-taskchain-config="jq  .taskchain.config | sed 's/\\\\//g' | tail -c +2 | head -c -2 | jq"
#jq-taskchain-config="jq -r .taskchain.config | sed 's/\\\\//g' | jq"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# ui related shortcuts
alias spu='sp; cd src/rubrik/spark-ui';
alias spa='sp; cd src/rubrik/api-server';
alias ardiff='arc diff --nolint --nounit --skip-staging --excuse jenkins'
alias asail='arc sail --location colo'
alias astatus='arc sail_status'
alias ascancel='arc sail_cancel'
alias arclint='arc lint --severity warning --rev'
alias mypy='mypy --follow-imports silent'
alias t='spu; make test';
alias ws='spu; webstorm &';
alias tracking_branch='git rev-parse --abbrev-ref --symbolic-full-name @{u}'

open-cr() {
    open -a "Google Chrome" $(git log HEAD~1..HEAD | grep 'Differential Revision: https://phabricator.rubrik.com/D[0-9]\+' | cut -d \  -f 7)
}
 
open-issue() {
    open -a "Google Chrome" https://rubrik.atlassian.net/browse/$(git log HEAD~1..HEAD | grep 'JIRA Issues: SPARK-[0-9]\+' | cut -d \  -f 7)
}

#alias rebase='TRACKING_BRANCH=$(tracking_branch); git checkout $TRACKING_BRANCH; git fetch origin; git reset --hard origin/$TRACKING_BRANCH; git checkout @{-1}; git rebase $TRACKING_BRANCH --autostash'
alias trackmaster='git branch --set-upstream-to origin/master'
alias setupstream='git branch --set-upstream-to'
alias build='sp; spark build docker';
alias provision='sp; spark minikube provision';
alias proxy='sp; sp-port-forward'; #port forwarding to minikube

# alfred repo
export PATH="$HOME/.sbt-alfred/sbt/bin:$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_281.jdk/Contents/Home"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home"

# aws specific aliases

# aws ec2 specific commands
alias create-aws-ec2-instance='aws ec2 run-instances --image-id ami-08962a4068733a2b6 --count 1 --instance-type t2.micro --key-name testing-key-pair --security-group-ids sg-5dc4dd37 --subnet-id subnet-c0237ba8'

# aws cli auto complete
export PATH=$PATH:/Users/ankit.kumar/go/src/spark/polaris/.buildenv/bin/
complete -C '/Users/ankit.kumar/.pyenv/versions/3.6.7/shims/aws_completer' aws
#sg_id="sg-1234567890"
#ip_cidr=$(curl --silent -4 v4.ifconfig.co)/32
#echo $ip_cidr
#aws ec2 authorize-security-group-ingress --group-id $sg_id --protocol tcp --port 22 --cidr $ip_cidr

# typical usage fast-bazel <base commit> e.g fast-bazel HEAD
fast-bazel() {
     git diff --dirstat=files,0 $@ | sed -E 's,^[ 0-9.]+% polaris/src,/,g' | xargs sp-bazel-go 
 }
export CLOUDSDK_PYTHON=python3
klogs() {
   sp-deployment-dashboard -d $1
}


# We want to alter `cloudsql.py` file to use `mycli` instead of `mysql`,
# but we also don't want to mess with the git workspace. So, we revert the
# modification as soon as we're done with `sp-mysql`.

#./polaris/src/rubrik/sdk_internal/gcp/cloudsql.py
POLARIS="${HOME}/go/src/spark/polaris"
CLOUDSQL="${POLARIS}/src/rubrik/sdk_internal/gcp/cloudsql.py"

function better-mysql-client {
  sed -i '' "s/'mysql',/'mycli',/g" "${CLOUDSQL}"
}

function meh-mysql-client {
  sed -i '' "s/'mycli',/'mysql',/g" "${CLOUDSQL}"
}

function spdb {
  better-mysql-client
  sp-mysql "$@"
  meh-mysql-client
}
