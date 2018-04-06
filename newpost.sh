#!/bin/bash
if [ -z "$1" ]; then
    echo "No post title supplied"
    exit 1
fi

TITLE=$(echo $1 | sed 's/ /-/g')
POST=post/$(date +%F-$TITLE.md) 
hugo new $POST
nvim content/$POST
