#!/bin/bash

cd pom_version_change/

version=$(grep -ri "<version>" pom.xml |head -n 1 | sed -e 's/^[ \t]*<version>\ 
([^<]*\)<.*$/\1/')

major=$(echo $version | cut -c1)
var2=$(echo $version | cut -c2)
miner=$(echo $version | cut -c3)
var4=$(echo $version | cut -c4)
bug=$(echo $version | cut -c5)
bug=$((bug+1))
str="-SNAPSHOT"
incrementVer=$major$var2$miner$var4$bug$str
echo $incrementVer

pomChange=$(grep -ri "<version>" pom.xml | head -n 1 | sed -i "s/\(<version>\)[^<]*\ 
(<\/version>\)/\1$incrementVer\2/" pom.xml)
echo $pomChange
