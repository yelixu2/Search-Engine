#!/bin/bash

# In case you use the provided ParseJSON.java code for preprocessing the wikipedia dataset, 
# uncomment the following two commands to compile and execute your modified code in this script.
#
#javac ParseJSON.java
#java ParseJSON

# TASK 2A:
# Create and index the documents using the default standard analyzer

curl -H "Content-Type: application/txt" -XPOST 'localhost:9200/task2a/wikipage/_bulk?pretty&refresh' --data-binary "@data/out.txt"


# TASK 2B:
# Create and index with a whitespace analyzer
curl -XPUT 'localhost:9200/task2b?pretty' -d '
{
  "mappings":{
      "wikipage":{
         "_all":{ "type": "text", "analyzer": "whitespace"},
         "properties":{
             "abstract":{ "type": "text", "analyzer": "whitespace"},
             "title":{ "type": "text", "analyzer": "whitespace"},
             "url":{ "type": "text", "analyzer": "whitespace"},
             "sections":{ "type": "text", "analyzer": "whitespace"}
         }
       }
    }
}'
curl -H "Content-Type: application/txt" -XPOST 'localhost:9200/task2b/wikipage/_bulk?pretty&refresh' --data-binary "@data/out.txt"
# TASK 2C:
# Create and index with a custom analyzer as specified in Task 2C
curl -XPUT 'localhost:9200/task2c?pretty' -d '
{
"settings": {
   "analysis": {
      "filter": {
       "my_stopwords":{
             "type":       "stop",
             "stopwords":  "_english_"
       }
      },
      "analyzer": {
         "my_analyzer":{
            "type":"custom",
            "char_filter":["html_strip"],
            "tokenizer": "standard",
            "filter":[ "asciifolding", "lowercase", "my_stopwords","snowball" ]
          }
      }
    }
},
"mappings":{
      "wikipage":{
           "_all":{ "type": "text", "analyzer": "my_analyzer"},
           "properties":{
                "abstract":{ "type": "text", "analyzer": "my_analyzer"},
                "title":{ "type": "text", "analyzer": "my_analyzer"},
                "url":{ "type": "text", "analyzer": "my_analyzer"},
                "sections":{ "type": "text", "analyzer": "my_analyzer"}
            }
       }
}
}'
curl -H "Content-Type: application/txt" -XPOST 'localhost:9200/task2c/wikipage/_bulk?pretty&refresh' --data-binary "@data/out.txt"
