#!/bin/bash

shopt -s nocasematch
[[ "`uname -a`" =~ mswin|msys|mingw|cygwin|bccwin|wince|emc ]] && path="~" || path="/vagrant"
vagrant ssh -c "cd $path/bench && bench start"