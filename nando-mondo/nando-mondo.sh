#!/bin/sh
# 20210209 takatsuki
# SPARQL query
QUERY="PREFIX nando:<http://nanbyodata.jp/ontology/nando#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
SELECT DISTINCT ((?s)AS ?NANDO_ID) (STR(?id) AS ?ID)
FROM <http://nanbyodata.jp/ontology/nando>
WHERE {
  ?s skos:closeMatch ?id.
         }"
# curl -> format -> delete header
curl -H "Accept: text/csv" --data-urlencode "query=$QUERY" https://integbio.jp/rdf/sparql | sed -e 's/\"//g; s/,/\t/g; s/http:\/\/purl.obolibrary.org\/obo\/MONDO_/MONDO:/g; s/http:\/\/nanbyodata.jp\/ontology\/nando#/NANDO:/g' | sed -e '1d'> pair.tsv