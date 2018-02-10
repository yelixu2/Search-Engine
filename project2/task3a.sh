#!/bin/bash

QUERY=$1

curl -s -XGET 'localhost:9200/task1a/_search?pretty' -H 'Content-Type: application/json' -d'
{
"query": {
"bool": {
"must": [
{
"match": {
"title":{ "query":"'"$QUERY"'","boost":10}
}
},
{
"match": {
"abstract": {"query":"'"$QUERY"'","boost":1}
}
}],
"must_not":[{"match":{"sections":{"query":"'"$QUERY"'","boost":1}}}]
}
}
}
'
