#!/bin/bash

sleep 10

mysql --host=mysql --user=ctdata --password=use_this_password ctdata < schema.sql
java -jar DataNode.jar -dbconfig db-config.json -queueconfig queue-config.json