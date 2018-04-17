# GeoCatch - Trabalho 1 da disciplina de Inteligência Artificial de 2017 #
![preview](https://github.com/YanMatheus/IA-TP1-GeoCatch/blob/master/GeoCatch/banner.PNG  "css")
\n
![asd](https://github.com/YanMatheus/IA-TP1-GeoCatch/blob/master/GeoCatch/java.png "cass") 
![css](https://github.com/YanMatheus/IA-TP1-GeoCatch/blob/master/GeoCatch/prolog.png "css")                                              
## Descrição ##
O programa foi pensando a partir da premissa de ensino básico de geografia do
Brasil, podendo então ensinar tópicos do assunto de forma interativa e
divertida, além de testar os conhecimentos aprendidos através de um rápido
teste.

O desafio era criar um programa que fosse educativo e utilizasse base de dados e lógica a partir do Prolog.
Foi desenvolvido em java com o auxilio da biblioteca **`jpl.jar`**
\n
**`Pra saber tudo direitinho tem a documentação aí em PDF`**

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

1. A criação de um novo tópico de aprendizado deve ser inicialmente feita
através da criação dos dados em um arquivo **`.pl`**, construindo sua lógica, para
fins didáticos será chamado aqui de **`novotopico.pl.`**

2. Para uso desse novo arquivo é necessário inseri-lo como TreeMap<String, String> na classe Functions

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
3. Há a necessidade de instanciá-lo no método construtor da classe e depois criar um método para obtê-lo
```java
 this.DBNovoTopico = new TreeMap<>();
 functionsname.add("novotopico");
```
#### Utilização de novos tópicos  ####

```java
 ObjetoFuncions.getDBNovoTopico().get(key);
```

#### Ex Mapas ####

![preview](https://github.com/YanMatheus/IA-TP1-GeoCatch/blob/master/GeoCatch/mapageocatchdemo.gif  "css")

#### Ex Quiz ####

![preview](https://github.com/YanMatheus/IA-TP1-GeoCatch/blob/master/GeoCatch/geocatchquizdemo.gif  "css")

#### Ranks do Quiz ####

![preview](https://github.com/YanMatheus/IA-TP1-GeoCatch/blob/master/GeoCatch/ribbons.PNG  "css")

#### Demo geral ####


![preview](https://github.com/YanMatheus/IA-TP1-GeoCatch/blob/master/GeoCatch/demogeocatch1.gif  "css")
