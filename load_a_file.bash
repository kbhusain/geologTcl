#!/bin/bash 
# The order in which these parameters are set are important
# Runs in /home/ecc_17/eaqkbh/Projects/pltWork
# Change to proper directory later. 
# 

if [[ $# -lt 3 ]]; then 
	echo "Missing PG_PROJECT PG_WELL USEFILE " 
	exit
fi 

source ./geologENV.bash

export PG_PROJECT=$1
export PG_WELL=$2
export USEFILE=$3
export SETNAME="${4:-WIRE}"


echo "Starting  geolog $PG_PROJECT $PG_WELL $USEFILE $SETNAME "
${GEOLOG_EXEC} ./load_one_las.tcl 
echo "Finished  geolog $PG_PROJECT $PG_WELL $USEFILE $SETNAME "
exit
