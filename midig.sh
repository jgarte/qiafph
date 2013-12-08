#!/bin/bash

if [ 0 -eq $# ]
then
    echo "usage:"
    echo "midig.sh <name>"
    #echo "generates <name>.md and <name>.mid"
    echo "generates <name>.mg and <name>.mid"
    exit 0
fi

name=$1

if type mgen 1>/dev/null 2>&1 
then
    cmd="mgen"
elif type ./mgen 1>/dev/null 2>&1 
then
    cmd="./mgen"
else
    echo >&2 "mgen command required and not found in path or current directory.  Aborting."
    exit 1
fi

#type mscore 1>/dev/null 2>&1 || { echo >&2 "mscore command required.  Aborting."; exit 1; }
type midge 1>/dev/null 2>&1 || { echo >&2 "midge command required.  Aborting."; exit 1; }
if type midge 1>/dev/null 2>&1
then
    MIDGE=midge
elif type ./midge 1>/dev/null 2>&1
then
    MIDGE=midge
else
    echo >&2 "midge command needed and not found on path or current dir.  Aborting."
    exit 1
fi


$cmd -m "${name}.mg"

#mscore -o ${name}.mid ${name}.md
$MIDGE ${name}.mg


