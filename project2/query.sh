#!/bin/sh

#  query.sh
#  
#
#  Created by Yeli on 11/7/17.
#
curl -XGET 'localhost:9200/task3b/_search?pretty' -H 'Content-Type: application/json' -d'
{
"query": {
"bool": {
"should": [
{
"match": {
"title": "bear"
}
},
{
"match": {
"abstract": "bear"
}
}
]
}
}
}
' |more