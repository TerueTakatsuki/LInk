#!/bin/sh
# 20210209 takatsuki
# SPARQL query
QUERY="PREFIX nando:<http://nanbyodata.jp/ontology/nando#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT DISTINCT ((?s)AS ?NANDO_ID) (STR(?id) AS ?ID)
FROM <http://nanbyodata.jp/ontology/nando>
WHERE {
  ?s rdfs:seeAlso ?id.
   FILTER(contains(STR(?id),'kegg'))
  }"
# curl -> format -> delete header
curl -H "Accept: text/csv" --data-urlencode "query=$QUERY" https://integbio.jp/rdf/sparql | sed -e 's/\"//g; s/,/\t/g; s/https:\/\/www.kegg.jp\/dbget-bin\/www_bget?ds_ja:/KEGG:/g; s/http:\/\/nanbyodata.jp\/ontology\/nando#/NANDO:/g' | sed -e '1d'> pair.tsv