PREFIX fn:     <http://aksw.org/sparqlify/>
PREFIX rdfs:   <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf:    <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xsd:    <http://www.w3.org/2001/XMLSchema#>
PREFIX qualis: <http://lod.unicentro.br/QualisBrasil/>
PREFIX dc:     <http://purl.org/dc/elements/1.1/>
PREFIX bibo:   <http://purl.org/ontology/bibo/>
PREFIX foaf:   <http://xmlns.com/foaf/0.1/>

CREATE VIEW Template DefaultView As Construct {
  ?Evaluation rdf:type                 rdf:Class         ;
              rdf:type                 qualis:Evaluation ;
              qualis:hasJournal        ?Journal          ;
              qualis:hasKnowledgeField ?KnowledgeField   ;
              qualis:hasYearEvaluation ?YearEvaluation   ;
              qualis:hasScore          ?Score            .

  ?Journal rdf:type  rdf:Class      ; 
           rdf:type  bibo:Journal   ;
           bibo:issn ?issnJournal   ;
           foaf:name ?nameJournal   .
		   

  ?KnowledgeField rdf:type      rdf:Class             ; 
                  rdf:type      qualis:KnowledgeField ;
                  dc:identifier ?idKnowledgeField     ; 
                  dc:title      ?nameKnowledgeField   .
   
  ?YearEvaluation rdf:type  rdf:Class             ;
                  rdf:type  qualis:YearEvaluation ;
                  rdf:value ?yearIndex            .

  ?Score rdf:type  rdf:Class     ;
          rdf:type  qualis:Score ;
          rdf:value ?qualisIndex  .
}
WITH
#"Journal_2238-0272_KnowledgeField_31_YearEvaluation_2013_Qualis_C",
  ?Evaluation = uri(concat("http://lod.unicentro.br/QualisBrasil/",fn:urlEncode(?1)))

#"Journal_2238-0272"
  ?Journal = uri(concat("http://lod.unicentro.br/QualisBrasil/",fn:urlEncode(?2)))

#"2238-0272"
  ?issnJournal = plainLiteral(?3)

#"#10.art"
  ?nameJournal = plainLiteral(?4)

#"KnowledgeField_31",
  ?KnowledgeField = uri(concat("http://lod.unicentro.br/QualisBrasil/",fn:urlEncode(?5)))

#"31"
  ?idKnowledgeField = plainLiteral(?6)

#"CIÊNCIAS SOCIAIS APLICADAS I",
  ?nameKnowledgeField = plainLiteral(?7)

#"YearEvaluation_2013",
  ?YearEvaluation = uri(concat("http://lod.unicentro.br/QualisBrasil/",fn:urlEncode(?8)))

#2013
  ?yearIndex = plainLiteral(?9)

#"Qualis_C"
  ?Score = uri(concat("http://lod.unicentro.br/QualisBrasil/",fn:urlEncode(?10)))

#"C"
  ?qualisIndex = plainLiteral(?11)