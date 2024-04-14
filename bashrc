export EDITOR='nvim'
export VISUAL='nvim'

bind -x '"\e[1;5A":"bctl +"'
bind -x '"\e[1;5B":"bctl -"'
bind -s '"\C-f":"tmux-sessionizer\n"'

# for golang
export PATH=$PATH:/usr/local/go/bin

## for rust 
# cmd : source "$HOME/.cargo/env" will write the line below to the bashrc
. "$HOME/.cargo/env"

