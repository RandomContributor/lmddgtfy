#!/usr/bin/env bash

###
function out::err {
    (>&2 echo -e \\033[31m"Error: $1"\\033[0m)
    exit 1
}

function out::inf {
    (>&2 echo -e \\033[32m"Information: $1"\\033[0m)
}

function out::dbg {
    (>&2 echo -e \\033[32m"Debug: $1"\\033[0m)
}

function out::suc {
    (>&2 echo -e \\033[32m"Success: $1"\\033[0m)
    exit 0
}
###

PROTO=0
PROTOS=("https://" "http://")

URL=0
URLS=("duckduckgo.com?q=" "duckduckgo.com/lite?q=" "google.com/search?q=")

FINAL="${PROTOS[$PROTO]}${URLS[$URL]}$(tr " " "+" <<<"${1}")"

echo "${FINAL}"

out::suc "Finished"
