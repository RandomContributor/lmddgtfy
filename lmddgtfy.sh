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

# Protocols
# 0 <~> https
# 1 <~> http
# 2 <~> ftp

PROTO=0
PROTOS=\
(
"https://"
"http://"
"ftp://"
)

# Search services
# 0 <~> DDG
# 1 <~> DDG Lite
# 2 <~> PrivateNet Searx
# 3 <~> Google
# 4 <~> StartPage
# 5 <~> Bing
# 6 <~> Qwant
# 7 <~> Yahoo
# 8 <~> Yandex
# 9 <~> Baidu
#10 <~> Ecogine
#11 <~> Aol
#12 <~> Excite
#13 <~> WolframAlpha
#14 <~> GitHub
#15 <~> YouTube
#16 <~> WebCrawler

URL=0

URLS=\
(
'duckduckgo.com?q='
'duckduckgo.com/lite?q='
'searx.privatenet.cf?categories=general&q='
'google.com/search?q='
'https://www.startpage.com/do/dsearch?query='
'bing.com/search?q='
'qwant.com?q='
'search.yahoo.com/search?p='
'yandex.com/search?text='
'baidu.com/s?wd='
'ecogine.org?q='
'search.aol.com/aol/search?q='
'excite.com/serp?q='
'wolframalpha.com/input/?i='
'github.com/search?q='
'youtube.com/results?search_query='
'webcrawler.com/serp?q='
)

# Final URL

FINAL="${PROTOS[$PROTO]}${URLS[$URL]}$(tr " " "+" <<<"${1}")"

echo "${FINAL}"

# out::suc "Finished"
