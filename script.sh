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
request_body="title=${INPUT_TITLE}&body=${INPUT_BODY}&sound=${INPUT_SOUND}&isArchive=${INPUT_ISARCHIVE}&url=${INPUT_URL}&automaticallyCopy=${INPUT_AUTOMATICALLYCOPY}&copy=${INPUT_COPY}"

echo -e "${cyan}Request url${none}: ${request_url}"
echo -e "${cyan}Request body${none}:\n${request_body//&/\\n}"

res=`curl -s -X POST -d "${request_body}" ${request_url}`
echo -e "${green}Result${none}: ${res}"
