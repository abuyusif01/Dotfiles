#!/bin/bash
bat $1 | while read file;
do
    let x=($x+$file)
done
echo $x
