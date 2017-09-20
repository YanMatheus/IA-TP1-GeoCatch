/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package geocatch.model;

import java.util.ArrayList;
import java.util.Map;
import java.util.Scanner;
import java.util.TreeMap;
import org.jpl7.Atom;
import org.jpl7.PrologException;
import org.jpl7.Query;
import org.jpl7.Term;
import org.jpl7.Variable;

/**
 *
 * @author yan
 */
public class Functions {
    ArrayList<String> functionsname = new ArrayList<String>();
     TreeMap<String,String> DBCapital ;
     TreeMap<String,String> DBFu ;
     TreeMap<String,String> DBPopulation ;
     TreeMap<String,String> DBCountryBorder;
     TreeMap<String,String> DBFrontier ;
     TreeMap<String,String> DBRegion ;
     TreeMap<String,String> DBArea ;
     TreeMap<String,String> DBCoastalState;
     TreeMap<String,String> DBCuriosity;

    public Functions(){
        
        functionsname.add("capital");
        functionsname.add("fu");
        functionsname.add("population");
        functionsname.add("countryborder");
        functionsname.add("frontier");
        functionsname.add("region");
        functionsname.add("area");
        functionsname.add("coastalstate");
        functionsname.add("curiosity");
        
        this.DBCapital =  new TreeMap<>();
        this.DBFu =  new TreeMap<>();
        this.DBPopulation =  new TreeMap<>();
        this.DBCountryBorder =  new TreeMap<>();
        this.DBFrontier =  new TreeMap<>();
        this.DBRegion =  new TreeMap<>();
        this.DBArea =  new TreeMap<>();
        this.DBCoastalState =  new TreeMap<>();
        this.DBCuriosity =  new TreeMap<>();
    }
    
    
    
    
    public String getFunctionsName(int n){
        return functionsname.get(n);
    }
    
    public TreeMap<String, String> getDBCapital(){
    
        return DBCapital;
    
    }
    
    public TreeMap<String, String> getDBCuriosity(){
    
        return DBCuriosity;
    
    }
    public TreeMap<String, String> getDBFu() {

        return DBFu;
    }
    
    public TreeMap<String, String> getDBPopulation(){

        return DBPopulation;
    }
    
    public TreeMap<String, String> getDBFrontier() {

        return DBFrontier;
    
    }
    
    public TreeMap<String, String> getDBRegion() {

        return DBRegion;
        
    }
    
    public TreeMap<String, String> getDBArea() {
        
        return DBArea;
    
    }
    
    public TreeMap<String, String> getDBCoastalState() {

        return DBCoastalState;
        
    }
     public TreeMap<String, String> getDBCountryBorder() {

        return DBCountryBorder;
        
    }
    
    
    public  TreeMap<String,String> CreateDB(String prolog, TreeMap<String,String> DB){
        // TODO code application logic here
           // Query query = new Query("consult", new Term[]{ new Atom("/home/yan/Documentos/GeoCatch/prologfiles/" + prolog +  ".pl")});
           Query query = new Query("consult", new Term[]{ new Atom("src/geocatch/prologfiles/" + prolog +  ".pl")});
          
    try{
        query.hasSolution();
        Variable Y = new Variable("Y");
        Variable X= new Variable("X");
        Query consult = new Query(prolog ,new Term[]{Y,X});
        //TreeMap<String,String> array = new TreeMap<>() ;
        System.out.println("-------------");
        while(consult.hasMoreElements()){
            Map<String, Term> tabela = consult.nextSolution();
            DB.put(tabela.get(Y.name()).toString(), tabela.get(X.name()).toString() );
           
            
        }
    
}catch(PrologException pe){
        System.out.println("/src/geocatch/prologfiles/ >>" + prolog +  ".pl << not found");
         pe.printStackTrace();
}
   


return DB;
}
}
  
        