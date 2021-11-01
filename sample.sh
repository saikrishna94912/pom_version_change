#!/bin/bash

version=$(grep -ri "<version>" pom.xml |head -n 1 | sed -e 's/^[ \t]*<version>\([^<]*\)<.*$/\1/')
echo $version
latest=$(echo $version | cut -d "." -f 1)
latest=$((latest+1))
echo $latest
major=$(echo $version | cut -d "." -f 2)
echo $major
minor=$(echo $version | cut -d "." -f 3)
echo $minor
str="."
incrementVer=$latest$str$major$str$minor
echo $incrementVer

LN=$(grep -n "<version>" pom.xml | head -1 | awk -F ":" '{print $1}') sed -i "$LN s/$version/$incrementVer/" pom.xml
echo $LN
