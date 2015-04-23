PREFIX fn:     <http://aksw.org/sparqlify/>
PREFIX rdfs:   <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf:    <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xsd:    <http://www.w3.org/2001/XMLSchema#>
PREFIX qualis: <http://lod.unicentro.br/QualisBrasil/>
PREFIX dc:     <http://purl.org/dc/elements/1.1/>


CREATE VIEW Template DefaultView As Construct {
  ?Evaluation rdf:type                 rdf:Class       ;
              qualis:hasJournal        ?Journal        ;
              qualis:hasKnowledgeField ?KnowledgeField ;
              qualis:hasYear           ?YearEvaluation ;
              qualis:hasQualis         ?Qualis         .

  ?Journal rdf:type      rdf:Class    ; 
           dc:identifier ?issnJournal ; 
           dc:title      ?nameJournal .

  ?KnowledgeField rdf:type      rdf:Class           ; 
                  dc:identifier ?idKnowledgeField   ; 
                  dc:title      ?nameKnowledgeField .
   
  ?YearEvaluation rdf:type  rdf:Class  ;
                  rdf:value ?yearIndex .

  ?Qualis rdf:type  rdf:Class    ;
          rdf:value ?qualisIndex .
}
WITH
#"Evaluation",
#"Journal_2238-0272_KnowledgeField_31_YearEvaluation_2013_Qualis_C",
  ?Evaluation = uri(concat("http://lod.unicentro.br/QualisBrasil/",fn:urlEncode(?1)))

#"Journal",
#"Journal_2238-0272",
  ?Journal = uri(concat("http://lod.unicentro.br/QualisBrasil/",fn:urlEncode(?2)))

#"issnJournal",
#"2238-0272",
  ?issnJournal = plainLiteral(?3)

#"nameJournal",
#"#10.art",
  ?nameJournal = plainLiteral(?4)

#"KnowledgeField",
#"KnowledgeField_31",
  ?KnowledgeField = uri(concat("http://lod.unicentro.br/QualisBrasil/",fn:urlEncode(?5)))

#"idKnowledgeField",
#31,
  ?idKnowledgeField = plainLiteral(?6)

#"nameKnowledgeField",
#"CIÊNCIAS SOCIAIS APLICADAS I",
  ?nameKnowledgeField = plainLiteral(?7)

#"yearEvaluation",
#"YearEvaluation_2013",
  ?YearEvaluation = uri(concat("http://lod.unicentro.br/QualisBrasil/",fn:urlEncode(?8)))

#"yearIndex",
#2013,
  ?yearIndex = plainLiteral(?9)

#"Qualis",
#"Qualis_C",
  ?Qualis = uri(concat("http://lod.unicentro.br/QualisBrasil/",fn:urlEncode(?10)))

#"qualisIndex"
#"C"
  ?qualisIndex = plainLiteral(?11)




   

