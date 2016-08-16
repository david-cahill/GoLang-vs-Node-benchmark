#!/bin/bash
# Author: David Cahill <davidrichardcahill@gmail.com>
# This is a basic test to compare some arbitrary functions in GoLang and Node.js
# Please make sure you have Node.js and Go runtime environments installed.
# These stats show CPU time outside the kernel. For more info see here:
# http://stackoverflow.com/questions/556405/what-do-real-user-and-sys-mean-in-the-output-of-time1
GO_TIMES=('')
NODE_TIMES=('')

for i in {1..3}
do
    GO_TIMES+=($((time (go run go/index.go) 2>&1) | awk 'FNR == 4 {print $2}'))
done

for i in {1..3}
do
    NODE_TIMES+=($((time (node node/index.js) 2>&1) | awk 'FNR == 4 {print $2}'))
done
echo "Go Results: ${GO_TIMES[@]}"
echo "Node results: ${NODE_TIMES[@]}"
