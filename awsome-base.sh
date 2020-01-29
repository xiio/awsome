#!/bin/bash

instancesIp=$(aws ec2 describe-instances \
  		--filter "Name=tag:Name,Values=*${1}*" \
 	 	--query "Reservations[*].Instances[*].PrivateIpAddress" \
  		--output=text)

xpanes -c "ssh ubuntu@{} -o \"StrictHostKeyChecking no\"" $instancesIp
