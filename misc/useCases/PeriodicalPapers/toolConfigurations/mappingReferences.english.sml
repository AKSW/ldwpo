PREFIX fn:     <http://aksw.org/sparqlify/>
PREFIX rdfs:   <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf:    <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xsd:    <http://www.w3.org/2001/XMLSchema#>
PREFIX prod:   <http://lod.unicentro.br/LattesProduction/>
PREFIX dc:     <http://purl.org/dc/elements/1.1/>
PREFIX bibo:   <http://purl.org/ontology/bibo/>
PREFIX foaf:   <http://xmlns.com/foaf/0.1/>
PREFIX bibtex: <http://purl.org/net/nknouf/ns/bibtex/>

CREATE VIEW Template DefaultView As Construct {
    ?Department rdf:type  rdf:Class       ;
	            rdf:type  foaf:Group      ;
				rdf:type  prod:Department ;
		        foaf:name ?nameGroup      .
		   
    ?Professor rdf:type      rdf:Class       ;
	           rdf:type      foaf:Person     ;
			   rdf:type      prod:Professor  ;
		       foaf:name     ?namePerson     ;
			   foaf:homepage ?homepagePerson ;
		       foaf:member   ?groupPerson    .

	?PeriodicalPaper rdf:type		   rdf:Class                   ;
					 rdf:type          bibtex:Article              ;
					 rdf:type          prod:PeriodicalPaper        ;
					 bibtex:hasAuthor  ?authorPeriodicalPaper      ;
					 bibtex:hasTitle   ?titlePeriodicalPaper       ;
					 bibtex:hasJournal ?journalPeriodicalPaper     ;
					 bibtex:hasVolume  ?volumePeriodicalPaper      ;
					 bibtex:hasNumber  ?numberPeriodicalPaper      ;  
					 bibtex:hasPages   ?pagesPeriodicalPaper       ;
					 bibtex:hasYear    ?yearPeriodicalPaper        ;
					 dc:contributor    ?contributorPeriodicalPaper .

	?Journal rdf:type  rdf:Class     ; 
			 rdf:type  bibo:Journal  ;
			 bibo:issn ?issnJournal  ; 
			 foaf:name ?nameJournal  .

}
WITH

#csv.FOAFGroup -> ?Group
#"FOAFGroup_DETUR_I"
?Department = uri(fn:urlEncode(?1))

#csv.foafGroupName -> ?nameGroup
#"DETUR/I"
?nameGroup = plainLiteral(?2)



#csv.FOAFPerson -> ?Person
#"FOAFPerson_1834607520455691"
?Professor = uri(concat('http://lod.unicentro.br/LattesProduction/',fn:urlEncode(?3)))

#csv.foafPersonName -> ?namePerson 
#"POLIANA FABÍULA CARDOZO"
?namePerson = plainLiteral(?4)

#csv.foafPersonHomepage -> ?homepagePerson
#"http://lattes.cnpq.br/1834607520455691"
?homepagePerson = plainLiteral(?5)

#csv.foafPersonMember -> ?groupPerson
#"FOAFGroup_DETUR_I"
?groupPerson = uri(concat("http://lod.unicentro.br/Production/",fn:urlEncode(?6)))



#BIBOJournal -> ?Journal
#"Journal_2316-5952"
?Journal = uri(concat("http://lod.unicentro.br/Production/",fn:urlEncode(?7)))

#BIBOJournalName -> ?nameJournal
#"Caderno de Estudos e Pesquisas do Turismo"
?nameJournal = plainLiteral(?8)

#BIBOJournalISSN -> ?issnJournal
#"2316-5952"
?issnJournal = plainLiteral(?9)



#csv.BIBTEXArticle -> ?PeriodicalPaper
#"BIBTEXArticle_&amp;#65279;TURISMO DE EXPERIÊNCIA: UMA POSSIBILIDADE NOS ATRATIVOS TURÍSTICOS DA USINA HIDRELÉTRICA DE ITAIPU EM FOZ DO IGUAÇU ? PR"
?PeriodicalPaper = uri(concat("http://lod.unicentro.br/Production/",fn:urlEncode(?10)))

#csv.BIBTEXArticleHasAuthor -> ?authorPeriodicalPaper
#"FARIAS, A. P., CARDOZO, Poliana;CARDOZO, POLIANA FABIULA"
?authorPeriodicalPaper = plainLiteral(?11)

#csv.BIBTEXArticleTitle -> ?titlePeriodicalPaper
#"&amp;#65279;TURISMO DE EXPERIÊNCIA: UMA POSSIBILIDADE NOS ATRATIVOS TURÍSTICOS DA USINA HIDRELÉTRICA DE ITAIPU EM FOZ DO IGUAÇU ? PR"
?titlePeriodicalPaper = plainLiteral(?12)

#csv.BIBTEXArticleHasJournal -> ?journalPeriodicalPaper
#"Journal_2316-5952"
?journalPeriodicalPaper = uri(concat("http://lod.unicentro.br/Production/",fn:urlEncode(?13)))

#csv.BIBTEXArticleHasVolume -> ?volumePeriodicalPaper
#"3"
?volumePeriodicalPaper = plainLiteral(?14)

#csv.BIBTEXArticleHasNumber -> ?numberPeriodicalPaper
#"3"
?numberPeriodicalPaper = plainLiteral(?15)

#csv.BIBTEXArticleHasPages -> ?pagesPeriodicalPaper
#"204-2015"
?pagesPeriodicalPaper = plainLiteral(?16)

#csv.BIBTEXArticleHasYear -> ?yearPeriodicalPaper
#"2014"
?yearPeriodicalPaper = plainLiteral(?17)

#csv.DCContributor -> ?contributorPeriodicalPaper
#"FOAFPerson_1834607520455691" 
?contributorPeriodicalPaper = uri(concat("http://lod.unicentro.br/Production/",fn:urlEncode(?18)))