#!/bin/bash

echo ******************************************************
echo Starting the replica set
echo ******************************************************

sleep 10 | echo Sleeping
mongo --host mongo-rs0-1 -u root -p root replicaSet.js
