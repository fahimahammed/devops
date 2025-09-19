#!/bin/bash

logFile="app.log"

if [ ! -f "$logFile" ]; then
    echo "Log file not found!"
    exit 1
fi

grep "ERROR" "$logFile"
if [ $? -ne 0 ]; then
    echo "No errors found in the log file."
    exit 0
fi