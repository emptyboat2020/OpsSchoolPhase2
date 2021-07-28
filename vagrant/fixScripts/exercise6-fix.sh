#!/bin/bash
#set parameters for source and destination, create var to identify server
SRC1=$1
DEST=$3
BOX=$(hostname)
#conditionals with if statement,, first for server1, then server2
if [ "$BOX" = server1 ]; then 
    scp -r  "$SRC1" "server2:$DEST"
else 
    scp -r  "$SRC1"/* "server1:$DEST"

fi
#print terse stat for byte size of file
stat --printf="%n is %s" $SRC1
