# list all available N/Ws
list_nw() {
    echo "want to list N/Ws saved? type 'nwls'"
    echo "want to list N/Ws connected? type 'nwlc"
    echo
    echo "Available N/Ws"
    echo
    nmcli device wifi list
}

# list all the N/Ws saved in the device
connections_saved() {
    echo
    echo "want to list available N/Ws? type 'nwla'"
    echo "want to list N/W connected? type 'nwlc'"
    echo
    echo "N/Ws Saved"
    nmcli connection show
}

# list all the connections connected
active_c() {
    echo "want to list all available N/Ws? type 'nwla'"
    echo "want to list N/Ws saved? type 'nwls'"
    echo
    echo "Connected N/Ws"
    nmcli connection show --active
}

# connect to new N/W
connect_new() {
    SSID_NAME=''
    PASSWORD=''

    echo "Don't know SSID_NAME? Type 'nwla' to list available networks."
    echo "Want to connect to saved N/W? Type 'nwc' ."
    echo -n "SSID_NAME: "
    read -r SSID_NAME
    echo -n "PASSWORD: "
    read -r -s PASSWORD
    echo

    echo "Connecting to $SSID_NAME..."
    nmcli device wifi connect "$SSID_NAME" password "$PASSWORD"
    if [[ $? -eq 0 ]]; then
        echo "Connected to $SSID_NAME successfully."
    else
        echo "Failed to connect to $SSID_NAME."
    fi
}

# connect to saved N/W
connect() {
    CONNECTION_NAME=''
    PREFIX='Auto '
    ADD_PREFIX='n'

    connections_saved

    # echo "Don't know CONNECTION_NAME? Type 'nwcc' to list connections active and saved."
    echo "Want to connect to not saved N/W? Type 'nwcn' ."
    echo
    echo -n "CONNECTION_NAME: "
    read -r CONNECTION_NAME
    echo
    echo -n "Add PREFIX? (y/n): "
    read -r ADD_PREFIX
    echo

    if [[ $ADD_PREFIX == 'n' ]]; then 
        PREFIX=''
    else 
        if [[ $CONNECTION_NAME == $PREFIX* ]]; then 
            PREFIX=''
        fi
    fi

    echo "Connecting to $PREFIX$CONNECTION_NAME..."
    nmcli connection up "$PREFIX$CONNECTION_NAME"

    if [[ $? -eq 0 ]]; then
        echo "Connected to $CONNECTION_NAME successfully."
    else
        echo "Failed to connect to $CONNECTION_NAME."
    fi
}

# disconnect from connected N/W
disconnect() {
    CONNECTION_NAME=''
    PREFIX='Auto '

    active_c

    # echo "Don't know CONNECTION_NAME? Type 'nwcc' to list connections active and saved."
    echo
    echo -n "CONNECTION_NAME: "
    read -r CONNECTION_NAME
    echo
    echo "Disconnecting to $CONNECTION_NAME..."

    if [[ $CONNECTION_NAME == $PREFIX* ]]; then 
        PREFIX=''
    fi

    nmcli connection down "$PREFIX$CONNECTION_NAME"

    if [[ $? -eq 0 ]]; then
        echo "Disconnected to $CONNECTION_NAME successfully."
    else
        echo "Failed to disconnect to $CONNECTION_NAME."
    fi
}

$1
