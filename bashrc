export EDITOR='nvim'
export VISUAL='nvim'

export LANG="en_IN.UTF-8"
source $HOME/.local/share/fonts/i_dev.sh

bind -x '"\e[1;5A":"bctl +"'
bind -x '"\e[1;5B":"bctl -"'
bind -s '"\C-f":"tmux-sessionizer\n"'
bind -x '"\C-o":"tmux a"'

# for golang
export PATH=$PATH:/usr/local/go/bin

## for rust
# cmd : source "$HOME/.cargo/env" will write the line below to the bashrc
. "$HOME/.cargo/env"

# custom aliases
alias nv='nvim .'
alias ..='cd ..'
alias ....='cd ../../'

alias zen='~/.local/share/AppImage/ZenBrowser.AppImage'
alias update-zen='bash <(curl https://updates.zen-browser.app/appimage.sh)'

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


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# for persisting ssh-agent across different sessions
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    #echo "Starting ssh-agent..."
    (
        umask 066
        ssh-agent >"$SSH_ENV"
    )
    . "$SSH_ENV" >/dev/null
    ssh-add ~/.ssh/github-ed25519 > /dev/null
}

# Load ssh-agent settings
if [ -f "$SSH_ENV" ]; then
    . "$SSH_ENV" >/dev/null
    # Verify if the agent is running, if not, start it
    if ! pgrep -u "$USER" ssh-agent >/dev/null; then
        start_agent
    fi
else
    start_agent
fi
source ~/.bash_completion/alacritty

source /home/haru_d/.bash_completions/mov-cli.sh

source /home/haru_d/projects/MyAnimeList-CLI/cmp
export PATH="$PATH:~/.local/bin"

