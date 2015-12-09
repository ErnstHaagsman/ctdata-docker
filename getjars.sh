#!/bin/bash

wget -N -O jars.zip https://s3-us-west-1.amazonaws.com/ctdata-builds/build/$1.zip
unzip -o jars.zip

mv jars/CtdataSensorGateway-*.jar ./sensorgateway/SensorGateway.jar
mv jars/CtdataOrchestrationServer-*.jar ./orchestrator/Orchestrator.jar
mv jars/CtdataDatanodeServer-*.jar ./datanode/DataNode.jar
mv jars/gs-spring-boot-*.jar ./webapp/WebApp.jar

cp jars/CtdataRaspNodeSim-*.jar ./raspnode-1/RaspNodeSim.jar
mv jars/CtdataRaspNodeSim-*.jar ./raspnode-2/RaspNodeSim.jar
