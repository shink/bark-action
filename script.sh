#!/bin/bash

red='\e[91m'
green='\e[92m'
cyan='\e[96m'
none='\e[0m'

if [[ -z $INPUT_KEY ]]; then
    echo -e "${red}ERROR: KEY is a required parameter${none}"
    exit -1
fi

host="https://api.day.app"
request_url=$host/$INPUT_KEY/
request_body="key=$INPUT_KEY&body=$INPUT_BODY&sound=$INPUT_SOUND&isArchive=$INPUT_ISARCHIVE&url=$INPUT_URL&automaticallyCopy=$INPUT_AUTOMATICALLYCOPY&copy=$INPUT_COPY"

echo -e "Request url: ${cyan}$request_url${none}"
echo -e "Request body: \n${cyan}${request_body//&/\n}${none}"

res=`curl -s -X POST -d $request_body $request_url`
echo -e "Result: ${green}$res${none}"
