# Load .bashrc if it exists
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

export PATH="/Users/harudaylnu/homebrew/opt/postgresql@17/bin:$PATH"

# Load bash completion (keep for git)
[[ -r "/Users/harudaylnu/homebrew/etc/profile.d/bash_completion.sh" ]] && \
    . "/Users/harudaylnu/homebrew/etc/profile.d/bash_completion.sh"
. "/Users/harudaylnu/.local/share/bob/env/env.sh"
