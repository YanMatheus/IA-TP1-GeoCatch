/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package geocatch.model;
import geocatch.model.Functions;
import java.util.ArrayList;

import java.util.Random;
import java.util.TreeMap;
import javax.swing.JButton;
import javax.swing.JLabel;

/**
 *
 * @author yan
 */
public class Questions {
     ArrayList<String> statename = new ArrayList<>();
     TreeMap<String, String> quiz;
     ArrayList<String> alternatives = new ArrayList<>();
     String RANS ="";
     Integer nota = 0;
     Integer nquestion = 0;
     
    Functions Funcs = new Functions();
    
    public Questions(){
        statename.add("'Acre'");
        statename.add("'Alagoas'");
        statename.add("'Amapá'");
        statename.add("'Amazonas'");
        statename.add("'Bahia'");
        statename.add("'Distrito Federal'");
        statename.add("'Espírito Santo'");
        statename.add("'Goiás'");
        statename.add("'Maranhão'");
        statename.add("'Mato Grosso'");
        statename.add("'Mato Grosso do Sul'");
        statename.add("'Minas Gerais'");
        statename.add("'Pará'");
        statename.add("'Paraíba'");
        statename.add("'Paraná'");
        statename.add("'Pernambuco'");
        statename.add("'Piauí'");
        statename.add("'Rio de Janeiro'");
        statename.add("'Rio Grande do Norte'");
        statename.add("'Rio Grande do Sul'");
        statename.add("'Rondônia'");
        statename.add("'Roraima'");
        statename.add("'Santa Catarina'");
        statename.add("'São Paulo'");
        statename.add("'Sergipe'");
        statename.add("'Tocantins'");
        this.RANS = new String();
        this.nota = nota;
        this.nquestion = nquestion;
        
    }
    
    public void GenerateFuncName(JLabel Q,JButton A, JButton B, JButton C, JButton D){
        nquestion++;
        Random rand = new Random();
        int randn = rand.nextInt(26);
        int code  = rand.nextInt(4);
        int randstate = rand.nextInt(8);
        int randalternate = rand.nextInt(3);
        System.out.println(randalternate+" randalternate");
        System.out.println(code+" code");
        System.out.println(randstate+" randstate");
        System.out.println(randn+" randn");
        
        String question = "";
        
        Funcs.CreateDB(Funcs.getFunctionsName(0), Funcs.getDBCapital());
        Funcs.CreateDB(Funcs.getFunctionsName(1), Funcs.getDBFu());
        Funcs.CreateDB(Funcs.getFunctionsName(2), Funcs.getDBPopulation());
        Funcs.CreateDB(Funcs.getFunctionsName(3), Funcs.getDBCountryBorder());
        Funcs.CreateDB(Funcs.getFunctionsName(4), Funcs.getDBFrontier());
        Funcs.CreateDB(Funcs.getFunctionsName(5), Funcs.getDBRegion());
        Funcs.CreateDB(Funcs.getFunctionsName(6), Funcs.getDBArea());
        Funcs.CreateDB(Funcs.getFunctionsName(7), Funcs.getDBCoastalState());
        Funcs.CreateDB(Funcs.getFunctionsName(8), Funcs.getDBCuriosity());
        
        switch(code){
            
            case 0:
                Q.setText(Funcs.getDBCapital().get(statename.get(randn))+" é a capital de qual estado?");
                
                
                switch(rand.nextInt(3)){
                    case 0:
                        RANS = "A";
                        A.setText(statename.get(randn));
                        B.setText(statename.get(rand.nextInt(26)));
                        C.setText(statename.get(rand.nextInt(26)));
                        D.setText(statename.get(rand.nextInt(26)));
                        break;
                    case 1:
                        RANS = "B";
                        B.setText(statename.get(randn));
                        A.setText(statename.get(rand.nextInt(26)));
                        C.setText(statename.get(rand.nextInt(26)));
                        D.setText(statename.get(rand.nextInt(26)));
                        break;
                    case 2:
                        RANS = "C";
                        C.setText(statename.get(randn));
                        B.setText(statename.get(rand.nextInt(26)));
                        A.setText(statename.get(rand.nextInt(26)));
                        D.setText(statename.get(rand.nextInt(26)));
                        break;
                    case 3:
                        RANS = "D";
                        D.setText(statename.get(randn));
                        B.setText(statename.get(rand.nextInt(26)));
                        C.setText(statename.get(rand.nextInt(26)));
                        A.setText(statename.get(rand.nextInt(26)));
                        break;
                }
                 break;
            case 1:
                Q.setText(Funcs.getDBFu().get(statename.get(randn))+" se refere a:");  
                switch(rand.nextInt(3)){
                    case 0:
                        RANS = "A";
                        A.setText(statename.get(randn));
                        B.setText(statename.get(rand.nextInt(26)));
                        C.setText(statename.get(rand.nextInt(26)));
                        D.setText(statename.get(rand.nextInt(26)));
                        break;
                    case 1:
                        RANS = "B";
                        B.setText(statename.get(randn));
                        A.setText(statename.get(rand.nextInt(26)));
                        C.setText(statename.get(rand.nextInt(26)));
                        D.setText(statename.get(rand.nextInt(26)));
                        break;
                    case 2:
                        RANS = "C";
                        C.setText(statename.get(randn));
                        B.setText(statename.get(rand.nextInt(26)));
                        A.setText(statename.get(rand.nextInt(26)));
                        D.setText(statename.get(rand.nextInt(26)));
                        break;
                    case 3:
                        RANS = "D";
                        D.setText(statename.get(randn));
                        B.setText(statename.get(rand.nextInt(26)));
                        C.setText(statename.get(rand.nextInt(26)));
                        A.setText(statename.get(rand.nextInt(26)));
                        break;
                }
                break;
                
            case 2:
                Q.setText(Funcs.getDBPopulation().get(statename.get(randn))+" é o número de habitantes de qual estado?");  
                switch(rand.nextInt(3)){
                    case 0:
                        RANS = "A";
                        A.setText(statename.get(randn));
                        B.setText(statename.get(rand.nextInt(26)));
                        C.setText(statename.get(rand.nextInt(26)));
                        D.setText(statename.get(rand.nextInt(26)));
                        break;
                    case 1:
                        RANS = "B";
                        B.setText(statename.get(randn));
                        A.setText(statename.get(rand.nextInt(26)));
                        C.setText(statename.get(rand.nextInt(26)));
                        D.setText(statename.get(rand.nextInt(26)));
                        break;
                    case 2:
                        RANS = "C";
                        C.setText(statename.get(randn));
                        B.setText(statename.get(rand.nextInt(26)));
                        A.setText(statename.get(rand.nextInt(26)));
                        D.setText(statename.get(rand.nextInt(26)));
                        break;
                    case 3:
                        RANS = "D";
                        D.setText(statename.get(randn));
                        B.setText(statename.get(rand.nextInt(26)));
                        C.setText(statename.get(rand.nextInt(26)));
                        A.setText(statename.get(rand.nextInt(26)));
                        break;
                }
                
                break;
            case 3:
                Q.setText(Funcs.getDBCuriosity().get(statename.get(randn))+" a frase pertence a:");  
                switch(rand.nextInt(3)){
                    case 0:
                        RANS = "A";
                        A.setText(statename.get(randn));
                        B.setText(statename.get(rand.nextInt(26)));
                        C.setText(statename.get(rand.nextInt(26)));
                        D.setText(statename.get(rand.nextInt(26)));
                        break;
                    case 1:
                        RANS = "B";
                        B.setText(statename.get(randn));
                        A.setText(statename.get(rand.nextInt(26)));
                        C.setText(statename.get(rand.nextInt(26)));
                        D.setText(statename.get(rand.nextInt(26)));
                        break;
                    case 2:
                        RANS = "C";
                        C.setText(statename.get(randn));
                        B.setText(statename.get(rand.nextInt(26)));
                        A.setText(statename.get(rand.nextInt(26)));
                        D.setText(statename.get(rand.nextInt(26)));
                        break;
                    case 3:
                        RANS = "D";
                        D.setText(statename.get(randn));
                        B.setText(statename.get(rand.nextInt(26)));
                        C.setText(statename.get(rand.nextInt(26)));
                        A.setText(statename.get(rand.nextInt(26)));
                        break;
                }
                
                break;
            case 4:
                Q.setText(Funcs.getDBArea().get(statename.get(randn))+"km² é a área equivalente a qual estado?");  
                switch(rand.nextInt(3)){
                    case 0:
                        RANS = "A";
                        A.setText(statename.get(randn));
                        B.setText(statename.get(rand.nextInt(26)));
                        C.setText(statename.get(rand.nextInt(26)));
                        D.setText(statename.get(rand.nextInt(26)));
                        break;
                    case 1:
                        RANS = "B";
                        B.setText(statename.get(randn));
                        A.setText(statename.get(rand.nextInt(26)));
                        C.setText(statename.get(rand.nextInt(26)));
                        D.setText(statename.get(rand.nextInt(26)));
                        break;
                    case 2:
                        RANS = "C";
                        C.setText(statename.get(randn));
                        B.setText(statename.get(rand.nextInt(26)));
                        A.setText(statename.get(rand.nextInt(26)));
                        D.setText(statename.get(rand.nextInt(26)));
                        break;
                    case 3:
                        RANS = "D";
                        D.setText(statename.get(randn));
                        B.setText(statename.get(rand.nextInt(26)));
                        C.setText(statename.get(rand.nextInt(26)));
                        A.setText(statename.get(rand.nextInt(26)));
                        break;
                }
                break;
        }
       
        
    }
    
    
    public boolean ClickParser(String alternative){
        
        boolean ans = false;
        
       if(alternative == RANS){
           ans = true;
           System.out.println(ans);
            System.out.println("ACERTOU");
            nota++;
       }else{
           ans = false;
            System.out.println("ERROU");
       }
      
        return ans;
    }
    
    
     public Integer getNQuestion() {
       return nquestion;
   }
   
    
   public Integer getNota(){
       return nota;
   }
           
    public String getRANS(){
        return RANS;
    }
    
     public String getStateName(int n){ //N max = 26
        return statename.get(n);
    }
}/*
NomeEstado.setText("Você escolheu o  Amazonas !");
        Funcs.CreateDB(Funcs.getFunctionsName(0), Funcs.getDBCapital());
        Funcs.CreateDB(Funcs.getFunctionsName(1), Funcs.getDBFu());
        Funcs.CreateDB(Funcs.getFunctionsName(2), Funcs.getDBPopulation());
        Funcs.CreateDB(Funcs.getFunctionsName(3), Funcs.getDBCountryBorder());
        Funcs.CreateDB(Funcs.getFunctionsName(4), Funcs.getDBFrontier());
        Funcs.CreateDB(Funcs.getFunctionsName(5), Funcs.getDBRegion());
        Funcs.CreateDB(Funcs.getFunctionsName(6), Funcs.getDBArea());
        Funcs.CreateDB(Funcs.getFunctionsName(7), Funcs.getDBCoastalState());
        Funcs.CreateDB(Funcs.getFunctionsName(8), Funcs.getDBCuriosity());

        FUlabel.setText(Funcs.getDBFu().get("'Amazonas'"));
        CapitalLabel.setText(Funcs.getDBCapital().get("'Amazonas'"));
        PopulationLabel.setText(Funcs.getDBPopulation().get("'Amazonas'"));
        RegionLabel.setText(Funcs.getDBRegion().get("'Amazonas'"));
        if(Funcs.getDBCoastalState().get("'Amazonas'")!= "null"){
            CoastalLabel.setText("Não");
        }else{
            CoastalLabel.setText("Sim");
        }
        AreaLabel.setText(Funcs.getDBArea().get("'Amazonas'"));
        FrontierLabel.setText(Funcs.getDBFrontier().get("'Amazonas'"));
        CuriosityLabel.setText(Funcs.getDBCuriosity().get("'Amazonas'"));

        System.out.println(  Funcs.getDBPopulation().get("Amazonas"));*/