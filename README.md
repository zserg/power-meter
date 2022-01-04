# SDM120M energy meter monitoring with Thingsboard

## prepare virtual environment
```
virtualenv -p python3 venv
. venv/bin/activate
pip install sdm_modbus
```

## add systemd service
create /etc/systemd/system/power-meter.service file

```
[Unit]
Description=Power meter Thingsboard client
After=network.target

[Service]
Environment=HOST_NAME=http://host:port
Environment=ACCESS_TOKEN=<access token>
WorkingDirectory=/home/pi/power-meter
ExecStart=/home/pi/power-meter/start-power-active.sh

[Install]
WantedBy=multi-user.target
```

## enable and start service
```
sudo systemctl enable power-meter.service
sudo systemctl restart power-meter.service
```
