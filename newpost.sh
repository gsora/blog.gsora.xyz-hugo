#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo "No post title supplied"
    exit 1
fi

TITLE=$(echo $1 | sed 's/ /-/g')
POST=post/$TITLE.md 
hugo new $POST
mv content/$POST content/post/$(date +%F)-$TITLE.md
