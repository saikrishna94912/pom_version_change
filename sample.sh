#!/bin/bash

version=$(grep -ri "<version>" pom.xml |head -n 1 | sed -e 's/^[ \t]*<version>\([^<]*\)<.*$/\1/')

major=$(echo $version | cut -c1)
var2=$(echo $version | cut -c2)
miner=$(echo $version | cut -c3)
var4=$(echo $version | cut -c4)
bug=$(echo $version | cut -c5)
bug=$((bug+1))
str="-SNAPSHOT"
incrementVer=$major$var2$miner$var4$bug$str
echo $incrementVer

LN=$(grep -n "<version>" pom.xml | head -1 | awk -F ":" '{print $1}') sed -i "$LN s/$version/$incrementVer/" pom.xml
echo $LN
mvn versions:set -DnewVersion=$LN
mvn -B release:update-versions
