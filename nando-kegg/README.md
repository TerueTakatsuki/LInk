- Bashを動かすと、IDのデータが取れると思います。
- エンドポイントはportalを利用しています。

```
PREFIX nando:<http://nanbyodata.jp/ontology/nando#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>
SELECT DISTINCT ((?s)AS ?NANDO_ID) (STR(?id) AS ?ID)
FROM <http://nanbyodata.jp/ontology/nando>
WHERE {
  ?s rdfs:seeAlso ?id.
   FILTER(contains(STR(?id),'kegg'))
  }
```