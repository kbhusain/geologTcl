#!/bin/bash 
# The order in which these parameters are set are important
# Runs in /home/ecc_17/eaqkbh/Projects/pltWork
# Change to proper directory later. 
# 

source ./geologENV.bash

export PG_PROJECT=$1
export PG_WELL=$2
export MINSET=$3
export USEFILE=$4
echo "Starting  geolog $1 $2 $3 $3"
${GEOLOG_EXEC} ./load_one_las.tcl 
echo "Finish  geolog for $1 "
exit
