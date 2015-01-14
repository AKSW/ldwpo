package br.unicentro.lod.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.model.SelectItem;

import br.unicentro.lod.services.Constantes;

import com.hp.hpl.jena.query.QueryFactory;
import com.hp.hpl.jena.query.QuerySolution;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.sparql.engine.http.QueryEngineHTTP;

@SuppressWarnings("serial")
@ManagedBean
@SessionScoped
public class ProjectReportViewController implements Serializable {


    String PREFIX           = "PREFIX rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>"
							+ "\nPREFIX owl:  <http://www.w3.org/2002/07/owl#>"
							+ "\nPREFIX xsd:  <http://www.w3.org/2001/XMLSchema#>"
							+ "\nPREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>"
							+ "\nPREFIX ldpo: <http://ldpo.aksw.org/terms/1.0/>\n";
    
    String GRAPH			= "http://ldpo.aksw.org/terms/1.0/";


    // comment one of the below instance of project to choose a report
	String PROJECT          = "ldpo:project_qualisbrasil";
	//String PROJECT          = "ldpo:project_limes_workflowExample";

	//used resources in the LDPO
	String NAME             = "ldpo:name";
	String VALUE            = "ldpo:value";
	String CREATOR          = "ldpo:creator";
	String CONTRIBUTOR      = "ldpo:contributor";
	String GOAL             = "ldpo:goal";
	String DESCRIPTION      = "ldpo:description";
	String HOMEPAGE         = "ldpo:homepage";
	String STAGE            = "ldpo:stage";
	String WORKFLOW         = "ldpo:workflow";
	String STARTEDDATE      = "ldpo:startedDate";
	String FIRSTSTEP        = "ldpo:firstStep";
	String NEXTSTEP         = "ldpo:nextStep";
	String PREVIOWSSTEP     = "ldpo:previowsStep";
	String SHORTDESCRIPTION = "ldpo:shortDescription";
	String COMMAND          = "ldpo:command";
	String SCRIPT           = "ldpo:script";
	String EXECUTEDDATE     = "ldpo:executedDate";
	String INPUTDATASET     = "ldpo:inputDataset";
	String FILEFORMAT       = "ldpo:fileFormat";
	String LICENSE          = "ldpo:license";
	String LOCATION         = "ldpo:location";
	String OUTPUTDATASET    = "ldpo:outputDataset";
	String TOOL             = "ldpo:tool";
	String PARAMETER        = "ldpo:parameter";
	String PARAMETERVALUE   = "ldpo:parameterValue";

	String report;

	
	
	public ProjectReportViewController() {
		this.report = PROJECT;
	}

	public String getReport() {
		return this.report;
	}

	public void setReport(String report) {
	}
	
	
	/* 
	 * Event from the interface that generates the desired report
	 */
	public void previewPressed() {
		setProjectReportProperties();
		setProjectReportWorkflow();
	}
	

	/*
	 * Getting properties of Project
	 */
	private void setProjectReportProperties() {
		System.out.println("I'm in");
		System.out.println("1) PROJECT IDENTIFICATION \n1.1 - Name: "	+ getLiteral(PROJECT, NAME));
		System.out.println("1.2 - Homepage: "               + getLiteral(PROJECT, HOMEPAGE));
		System.out.println("1.3 - Creator: "                + getLiteral("<" + getResource(PROJECT, CREATOR) + ">", NAME));
		System.out.println("1.4 - Goal: "                   + getLiteral(PROJECT, GOAL));
		System.out.println("1.5 - Description: "            + getLiteral(PROJECT, DESCRIPTION));
	}
	

	/*
	 * Getting properties of workflow
	 */
	private void setProjectReportWorkflow(){
		System.out.println("\n\n2) WORKFLOW");
		List<String> workflowList = getListResources("SELECT distinct ?workflows WHERE {"
													+ "\n  " + PROJECT +" "+ WORKFLOW + " ?workflows ." 
													+ "\n  ?workflows " + STARTEDDATE + " ?startedDate . "
													+ "\n}ORDER BY ?startedDate", "?workflows");
	    Iterator<String> i = workflowList.iterator();
	    int countWorkflow = 0;
		while(i.hasNext()) {
			String workflow = i.next();
			System.out.println("\n2." + (countWorkflow + 1) + " - " + workflow.substring(workflow.lastIndexOf("/") + 1));
			String temp = getLiteral("<"+ workflow +">", SHORTDESCRIPTION);
			if (!temp.equals(null)) {
				System.out.println("\n\nShort Description: " + temp);
			}
			try {
				int countStep = 0;
			
				String step = getResource("<" + workflow + ">", FIRSTSTEP);
				do {
					setNextStep(countWorkflow + 1, countStep, step);
					step = getResource("<" + step + ">", NEXTSTEP);
					countStep ++;
				} while (step != null);
			} catch (Exception e) {
				
			}
			countWorkflow ++;
			System.out.println("\n\n");
	    }
	}
	
	
	/*
	 * Getting properties of Step
	 */
	private void setNextStep(int countWorkflow, int countStep, String step) {


		System.out.println("\n\n2." + (countWorkflow) + "." + (countStep + 1) + " - " + step.substring(step.lastIndexOf("/") + 1));
		String temp = getLiteral("<" + getResource("<"+ step +">", CONTRIBUTOR) + ">", NAME);
		if (!temp.equals(null)) {
			System.out.println("\nContributor: " + temp);
		}

		temp = getLiteral("<" + getResource("<"+ step +">", STAGE) + ">", NAME);
		if (!temp.equals(null)) {
			System.out.println("\nStage: " + temp);
		}
		
		try {
			System.out.println("\nPerformed at: " + getDate("<"+ step +">", EXECUTEDDATE));
		} catch (Exception e) {
		}
		
		List<String> inputDatasetList = getListResources("SELECT distinct ?inputDatasets WHERE {<"+ step +"> "+ INPUTDATASET + " ?inputDatasets .}", "?inputDatasets");
	    if (inputDatasetList.size() > 0) {
	    	int countInputDataset = 0;
		    System.out.println("\nInput Datasets:");
			while(countInputDataset < inputDatasetList.size()) {
				temp = inputDatasetList.get(countInputDataset);
				try {
					if (!temp.equals(null)) {
						System.out.println("\n" + temp.substring(temp.lastIndexOf("/") + 1));
	
						String tempFileFormat = getLiteral("<" + getResource("<" + temp + ">", FILEFORMAT) + ">", NAME);
						if (!tempFileFormat.equals(null)) {
							System.out.println(" (File format: " + tempFileFormat + ")");
						}
						String tempLocation = getLiteral("<" + getResource("<" + getResource("<" + temp + ">", LOCATION) + ">", PARAMETERVALUE) + ">", VALUE);
						if (!tempLocation.equals(null)) {
							System.out.println(" (Location: " + tempLocation + ")");
						}
						String tempLicense = getLiteral("<" + getResource("<" + temp + ">", LICENSE) + ">", NAME);
						if (!tempLicense.equals(null)) {
							System.out.println(" (License: " + tempLicense + ")");
						}
					}
				}
				catch(Exception e) {
					
				}
				countInputDataset ++;
			}
	    }
		
	    
		try {
		    temp = getResource("<" + step + ">", OUTPUTDATASET);
			if (temp.length() > 0) {
				System.out.print("\nOutput Dataset: \n" + temp.substring(temp.lastIndexOf("/") + 1));
				String tempFileFormat = getLiteral("<" + getResource("<" + temp + ">", FILEFORMAT) + ">", NAME);
				if (!tempFileFormat.equals(null)) {
					System.out.println("\n (File format: " + tempFileFormat + ")");
				}
				String tempLocation = getLiteral("<" + getResource("<" + getResource("<" + temp + ">", LOCATION) + ">", PARAMETERVALUE) + ">", VALUE);
				if (!tempLocation.equals(null)) {
					System.out.println(" (Location: " + tempLocation + ")");
				}
				String tempLicense = getLiteral("<" + getResource("<" + temp + ">", LICENSE) + ">", NAME);
				if (!tempLicense.equals(null)) {
					System.out.println(" (License: " + tempLicense + ")");
				}
			}
		} catch (Exception e) {
			
		}

		
		try {
			String tool = getResource("<"+ step +">", TOOL);
			temp = getLiteral("<" + tool + ">", NAME);
			if (!temp.equals(null)) {
				System.out.println("\nTool: " + temp);
			}
			setStepParameter(step, tool); 
		} catch (Exception e) {

		}
			
		
		try {
			temp = getLiteral("<"+ step +">", SHORTDESCRIPTION);
			if (!temp.equals(null)) {
				System.out.println("\n\nShort Description: " + temp);
			}
		} catch (Exception e) {
			
		}


		try {
			temp = getLiteral("<"+ step +">", SCRIPT);
			if (!temp.equals(null)) {
				System.out.println("\n\nScript: " + temp);
			}
		} catch (Exception e) {
			
		}

		try {
			temp = getLiteral("<"+ step +">", COMMAND);
			if (!temp.equals(null)) {
				System.out.println("\n\nCommand: " + temp);
			}
		} catch (Exception e) {
			
		}
		
		
	}
	
	/*
	 * Getting properties of Parameters
	 */
	private void setStepParameter(String step, String tool){

		List<String> parameterList = getListResources("SELECT distinct ?parameters WHERE {"
				                                    + "\n  <"+ step +"> "+ PARAMETER + " ?parameters ."
				                                    + "\n  <"+ tool +"> "+ PARAMETER + " ?parameters ."
				                                    + "} ORDER BY ?parameters", "?parameters");
	    if (parameterList.size() > 0) {
	    	int countParameter = 0;
		    System.out.println("\nParameters and parameter's values:");
			while(countParameter < parameterList.size()) {
				String temp = parameterList.get(countParameter);
				if (!temp.equals(null)) {
					System.out.print("\n" + temp.substring(temp.lastIndexOf("/") + 1) + " : ");
					try {
						List<String> valueList = getListLiterals("\nSELECT distinct ?valor WHERE {"
								+ "\n  <"+ step +"> " + PARAMETERVALUE + " ?parameterValue ."
								+ "\n  <"+ tool +"> " + PARAMETERVALUE + " ?parameterValue ."
								+ "\n  <"+ temp +"> " + PARAMETERVALUE + " ?parameterValue ."
								+ "\n  ?parameterValue " + VALUE + " ?valor"
								+ "\n} ORDER BY ?valor", "?valor");
						System.out.println(valueList.get(0));
					} catch(Exception e) {
						System.out.println(e.toString());
					}
				}
				countParameter ++;
			}
	    }
		
	}

	
	/*
	 * Retrieving some literal from the Graph
	 */
	private String getLiteral(String subject, String predicate) {
		
		//System.out.println(PREFIX + "SELECT ?object WHERE {" + subject + " " + predicate + " ?object .}");
		com.hp.hpl.jena.query.Query query = QueryFactory.create( 
				PREFIX + "SELECT ?object WHERE {" + subject + " " + predicate + " ?object .}", GRAPH);
		QueryEngineHTTP qexec = new QueryEngineHTTP(Constantes.LOCAL_SPARQL, query);
		qexec.setTimeout(240000, 240000);
		ResultSet results = qexec.execSelect();
		QuerySolution solution = results.nextSolution();
		return (solution.get("?object").asLiteral().getValue().toString());
	}
	

	/*
	 * Retrieving some Date from the Graph
	 */
	private String getDate(String subject, String predicate) {
		
		//System.out.println(PREFIX + "SELECT ?object WHERE {" + subject + " " + predicate + " ?object .}");
		com.hp.hpl.jena.query.Query query = QueryFactory.create(
				  PREFIX + "SELECT ?object WHERE {" + subject + " " + predicate + " ?object .}", GRAPH);
		QueryEngineHTTP qexec = new QueryEngineHTTP(Constantes.LOCAL_SPARQL, query);
		qexec.setTimeout(240000, 240000);
		ResultSet results = qexec.execSelect();
		QuerySolution solution = results.nextSolution();
		String date = solution.get("?object").asLiteral().toString();
		return date.substring(0, date.indexOf("^"));
	}
	
	
	/*
	 * Retrieving some Resource from the Graph
	 */
	private String getResource(String subject, String predicate) {
		
		//System.out.println(PREFIX + "SELECT ?object WHERE {" + subject + " " + predicate + " ?object .}");
		com.hp.hpl.jena.query.Query query = QueryFactory.create(
				PREFIX + "SELECT ?object WHERE {" + subject + " " + predicate + " ?object .}", GRAPH);
		QueryEngineHTTP qexec = new QueryEngineHTTP(Constantes.LOCAL_SPARQL, query);
		qexec.setTimeout(240000, 240000);
		ResultSet results = qexec.execSelect();
		QuerySolution solution = results.nextSolution();
		return (solution.get("object").asResource().toString());
	}
	

	/*
	 * Retrieving a list of Resources from the Graph
	 */
	private List<String> getListResources(String query, String object) {

		//System.out.println(PREFIX + "\n" +query);
		com.hp.hpl.jena.query.Query sparqlQuery = QueryFactory.create( PREFIX + query, GRAPH);
		QueryEngineHTTP qexec = new QueryEngineHTTP(Constantes.LOCAL_SPARQL, sparqlQuery);
		qexec.setTimeout(240000, 240000);
		ResultSet results = qexec.execSelect();
		List<String> resourceList = new ArrayList<String>();
	    while(results.hasNext()) {
	    	QuerySolution solution = results.nextSolution();
	    	resourceList.add(solution.get(object).asResource().toString());
	    }
		return resourceList;
	}

	
	/*
	 * Retrieving a list of Literals from the Graph
	 */
	private List<String> getListLiterals(String query, String object) {

		//System.out.println(PREFIX + "\n" +query);
		com.hp.hpl.jena.query.Query sparqlQuery = QueryFactory.create( PREFIX + query, GRAPH);
		QueryEngineHTTP qexec = new QueryEngineHTTP(Constantes.LOCAL_SPARQL, sparqlQuery);
		qexec.setTimeout(240000, 240000);
		ResultSet results = qexec.execSelect();
		List<String> literalList = new ArrayList<String>();
	    while(results.hasNext()) {
	    	QuerySolution solution = results.nextSolution();
	    	literalList.add(solution.get(object).asLiteral().getValue().toString());
	    }
		return literalList;
	}

}
