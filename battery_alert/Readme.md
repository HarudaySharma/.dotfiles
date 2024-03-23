1. Create a Udev Rule 
    - `sudo nvim /etc/udev/rules.d/99-battery-alert.rules`
    - *Paste the following*
    - SUBSYSTEM=="power_supply", ATTR{status}=="Charging", RUN+="path to battery_alert.sh"

2. Reload Udev Rules
    - `sudo udevadm control --reload-rules`

3. Create a systemd Service
    - `sudo nvim /etc/systemd/system/battery-alert.service`
    - *Paste the following*
    ```
    [Unit]
    Description=Battery Alert Service
    After=network.target
    
    [Service]
    Type=simple
    ExecStart=/home/haru_d/.dotfiles/battery_alert/battery_alert.sh
    Restart=always
    User=haru_d
    StandardOutput=append:/var/log/battery_alert.log
    StandardError=append:/var/log/battery_alert.log
    Environment=DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $USER)/bus
    
    [Install]
    WantedBy=default.target
    
    ```

4. Enable and Start the Service
    - `sudo systemctl enable battery-alert.service`
    - `sudo systemctl start battery-alert.service`

