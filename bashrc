export EDITOR='nvim'
export VISUAL='nvim'

export LANG="en_IN.UTF-8"
source $HOME/.local/share/fonts/i_dev.sh

bind -x '"\e[1;5A":"bctl +"'
bind -x '"\e[1;5B":"bctl -"'
bind -s '"\C-f":"tmux-sessionizer\n"'

# for golang
export PATH=$PATH:/usr/local/go/bin

## for rust 
# cmd : source "$HOME/.cargo/env" will write the line below to the bashrc
. "$HOME/.cargo/env"

# custom aliases
alias nv='nvim .'
alias ..='cd ..'
alias ....='cd ../../'

# wifi alias

# list availabe wifi n/w
alias nwla='bash $HOME/.wifi/main.sh list_nw'
# list all N/Ws saved in this device
alias nwls='bash $HOME/.wifi/main.sh connections_saved'
# list all N/Ws connected
alias nwlc='bash $HOME/.wifi/main.sh active_c'

# connect to new wifi n/w
alias nwcn='bash $HOME/.wifi/main.sh connect_new'
# connect to existing connection
alias nwc='bash $HOME/.wifi/main.sh connect'
# disconnect to existing connection
alias nwd='$HOME/.wifi/main.sh disconnect'


