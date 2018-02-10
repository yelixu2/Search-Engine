#!/bin/sh

#  Script.sh
#  
#
#  Created by Yeli on 11/7/17.
#
curl -XPOST 'localhost:9200/task2/_close?pretty'
curl -XPUT 'localhost:9200/task2/_settings?pretty' -d '
{
"settings": {
"index":{
"similarity" : {
"default" : {
"type" : "BM25",
"k1" : 1.2,
"b" : 0.5
}
}
}
}
}'
curl -XPOST 'localhost:9200/task2/_open?pretty'
#curl -H "Content-Type: application/txt" -XPOST 'localhost:9200/task2/wikipage/_bulk?pretty&refresh' --data-binary "@data/out.txt"
