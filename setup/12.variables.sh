if [[ $PATH != *hacking/scripts* ]]; then
    export PATH=~/hacking/scripts:$PATH
    export PATH=~/hacking/installs/bin:$PATH
    export PATH=~/research/software/scripts:$PATH
    export PATH=~/research/software/installs/bin:$PATH
fi

export EDITOR=vim
export BROWSER=firefox

export MAN_PATH=~/hacking/installs/man
export PYTHONPATH=~/hacking:~/research/software/libraries
export CLASSPATH=.:./bin/:usr/share/java
export TEXINPUTS=~/setup/desktop/latex:

export AUTOSSH_PORT=21109
export AUTOSSH_POLL=5
export AUTOSSH_PIDFILE=~/.ssh/autossh.pid
