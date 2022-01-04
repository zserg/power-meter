#!/bin/bash
source venv/bin/activate

PERIOD=5

while true; do 
	# data=`python power-meter.py --baud 2400 --parity N /dev/ttyUSB0 --json --reg total_energy_active`
	data=`python power-meter.py --baud 2400 --parity N /dev/ttyUSB0 --json --reg power_active`
	echo $data
	curl -X POST -d "$data" $HOST_NAME/api/v1/$ACCESS_TOKEN/telemetry --header "Content-Type:application/json"
	sleep $PERIOD
done

