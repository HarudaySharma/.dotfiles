#!/bin/bash

# Search for desktop applications in standard directories
apps=$(find /usr/share/applications ~/.local/share/applications -name "*.desktop" | grep -vE '(chrome|firefox)' | xargs grep -i '^Name=' | sed 's/Name=//g')

# Combine with other executables from PATH
executables=$(compgen -c | sort -u)

# Show the combined list of apps and executables in fzf
selected=$( (echo "$apps"; echo "$executables") | sort -u | fzf --prompt="Launch: " --height=40% --reverse)

# If an application is selected, launch it
if [[ -n "$selected" ]]; then
    # Check if it's a .desktop application
    desktop_entry=$(grep -iR "Name=$selected" /usr/share/applications ~/.local/share/applications)
    
    if [[ -n "$desktop_entry" ]]; then
        # Extract and launch the Exec line from the .desktop file
        exec_cmd=$(grep -i "Exec=" $(echo "$desktop_entry" | cut -d':' -f1) | head -1 | sed 's/Exec=//g' | sed 's/%.//g')
        eval "$exec_cmd" &
    else
        # Otherwise, run it as an executable
        $selected &
    fi
fi

