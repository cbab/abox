#!/bin/bash

if test $# -lt 1; then
	echo "Usage : $0 <tracevisor hostname/ip>"
	exit 1
fi

TRACEVISORIP=$1
TRACEVISORPORT=5000

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get -y install mongodb python3 python3-dev python3-pymongo swig2.0 git

# Overwrite mongo config, restart to reload
mv /home/vagrant/mongodb.conf /etc/mongodb.conf
restart mongodb

# Get analysis scripts
cd /usr/local/src
git clone https://github.com/jdesfossez/lttng-analyses.git

# Get tracevisor SSH key
mkdir -p ~/.ssh
curl -s http://${TRACEVISORIP}:${TRACEVISORPORT}/trace/api/v1.0/ssh|grep tracevisor | cut -d '"' -f2 | cut -d "\\" -f1 >> ~/.ssh/authorized_keys2
