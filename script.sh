#!/bin/bash

red='\e[91m'
green='\e[92m'
cyan='\e[96m'
none='\e[0m'

if [[ -z $INPUT_KEY ]]; then
  echo -e "${red}ERROR: the KEY field is required${none}" >&2
  exit 1
fi

if [[ -n $INPUT_HOST ]]; then
  host="$INPUT_HOST"
  echo -e "${cyan}Use custom Bark server hostname${none}: ${host}"
else
  host="https://api.day.app"
fi

request_url="${host}/${INPUT_KEY}/"
request_body="title=${INPUT_TITLE}&body=${INPUT_BODY}&sound=${INPUT_SOUND}&isArchive=${INPUT_IS_ARCHIVE}&url=${INPUT_URL}&automaticallyCopy=${INPUT_AUTOMATICALLY_COPY}&copy=${INPUT_COPY}"

echo -e "${cyan}Request url${none}: ${request_url}"
echo -e "${cyan}Request body${none}:\n${request_body//&/\\n}"

http_code=$(curl -s -o /dev/null -w "%{http_code}" -X POST -d "${request_body}" "${request_url}")
if [[ ! $http_code == 200 ]]; then
  echo -e "${red}Request error! The HTTP code is ${http_code}${none}" >&2
  exit 1
fi
