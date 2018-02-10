#!/bin/sh

#  task3bscript.sh
#  
#
#  Created by Yeli on 11/10/17.
#
curl -XPUT 'localhost:9200/task3b?pretty' -d '
{
"settings":{
"index":{
"similarity":{
"default":{
"type":"cs246-similarity"
}
}
}
},
"mappings":{
"wikipage":{
"properties":{
"clicks":{"type":"long", "index":"not_analyzed"}
}
}
}
}'
curl -H "Content-Type: application/txt" -XPOST 'localhost:9200/task3b/wikipage/_bulk?pretty&refresh' --data-binary "@data/out.txt"