#!/bin/bash

cat pom.xml
perl -ne ' { s/(.*)\.(\d+)(-SNAPSHOT.*)/printf("%s.%d%s",$1,$2+1,$3)/ge and $_=~s/.$//g if /<version>/; print } ' pom.xml
