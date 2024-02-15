1. Create a Udev Rule 
    - `sudo nvim /etc/udev/rules.d/99-battery-alert.rules`
    - *Paste the following*
        - SUBSYSTEM=="power_supply", ATTR{status}=="Charging", RUN+="/path/to/your/battery_alert.sh"
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
    ExecStart=/path/to/your/battery_alert.sh

    [Install]
    WantedBy=default.target
    ```
4. Enable and Start the Service
    - `sudo systemctl enable battery-alert.service`
    - `sudo systemctl start battery-alert.service`

