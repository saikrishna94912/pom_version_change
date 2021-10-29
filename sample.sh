#!/bin/bash

open pom.xml ;
register-namespace m http://maven.apache.org/POM/4.0.0 ;
for //m:version
    set . xsh:subst(., '(?<=\.)([0-9]+)$', '$1+1', 'e') ;
save :b ;
