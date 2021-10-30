#!/bin/sh
var1=$(echo '${project.version}' | mvn help:evaluate | grep -v '^[[]')
var2=$(echo "$var1" | awk -F. -v OFS=. '++$NF')
sed -i "s/<version>.*<\/version>/<version>$var2<\/version>/" pom.xml
echo "$var2"
