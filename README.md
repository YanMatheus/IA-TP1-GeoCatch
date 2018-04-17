# GeoCatch - Trabalho 1 da disciplina de Inteligência Artificial de 2017 #

![asd](https://github.com/YanMatheus/IA-TP1-GeoCatch/blob/master/GeoCatch/java.png "cass") 
![css](https://github.com/YanMatheus/IA-TP1-GeoCatch/blob/master/GeoCatch/prolog.png "css")                                              
## Descrição ##
O programa foi pensando a partir da premissa de ensino básico de geografia do
Brasil, podendo então ensinar tópicos do assunto de forma interativa e
divertida, além de testar os conhecimentos aprendidos através de um rápido
teste.

O desafio era criar um programa que fosse educativo e utilizasse base de dados e lógica a partir do Prolog.
Foi desenvolvido em java com o auxilio da biblioteca **`jpl.jar`**
                               
### Tópicos abordados ###
  > -  Capitais 
  > - Unidade Federativas 
  > - Fronteiras Internacionais
  > - Pontos Extremos
  > - Espaço Territorial
  > - Estado Litorâneos
  > - População
  > - Regiões
  > - Curiosidades sobre estados
  
  
#### Criação de novos tópicos  ####

A criação de um novo tópico de aprendizado deve ser inicialmente feita
através da criação dos dados em um arquivo **`.pl`**, construindo sua lógica, para
fins didáticos será chamado aqui de **`novotopico.pl.`**

```java
 public class Functions {
  ArrayList<String> functionsname = new ArrayList<String>();
  TreeMap<String,String> DBCapital;
  TreeMap<String,String> DBFu ;
  TreeMap<String,String> DBPopulation ;
  TreeMap<String,String> DBCountryBorder ;
  TreeMap<String,String> DBFrontier ;
  TreeMap<String,String> DBRegion ;
  TreeMap<String,String> DBArea ;
  TreeMap<String,String> DBCoastalState ;
  TreeMap<String,String> DBCuriosity ;
  TreeMap<String,String> DBNovoTopico ;
 }
```


#### Mapas ####
![preview](https://github.com/YanMatheus/IA-TP1-GeoCatch/blob/master/GeoCatch/mapageocatchdemo.gif  "css")
#### Quiz ####
![preview](https://github.com/YanMatheus/IA-TP1-GeoCatch/blob/master/GeoCatch/geocatchquizdemo.gif  "css")
#### Demo ####
![preview](https://github.com/YanMatheus/IA-TP1-GeoCatch/blob/master/GeoCatch/demogeocatch1.gif  "css")
