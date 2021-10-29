#!/bin/sh            
tag=$(grep '<version>' $2 | sed 's/<version>[^-]*-\(.*\)<\/version>/\1/')
sed -i "s/<version>.*<\/version>/<version>$1-${tag}<\/version>/" $2
