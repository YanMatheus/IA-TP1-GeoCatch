# GeoCatch - Trabalho 1 da disciplina de Inteligência Artificial de 2017 #

![asd](https://github.com/YanMatheus/IA-TP1-GeoCatch/blob/master/GeoCatch/java.png "cass") 
![css](https://github.com/YanMatheus/IA-TP1-GeoCatch/blob/master/GeoCatch/prolog.png "css")                                              
## Descrição ##
O programa foi pensando a partir da premissa de ensino básico de geografia do
Brasil, podendo então ensinar tópicos do assunto de forma interativa e
divertida, além de testar os conhecimentos aprendidos através de um rápido
teste.

O desafio era criar um programa que fosse educativo e utilizasse base de dados e lógica a partir do Prolog.
Foi desenvolvido em java com o auxilio da biblioteca jpl.jar
                               
#### Temas abordados ####
  > -  Capitais 
  > - Unidade Federativas 
  > - Fronteiras Internacionais
  > - Pontos Extremos
  > - Espaço Territorial
  > - Estado Litorâneos
  > - População
  > - Regiões
  > - Curiosidades sobre estados
  
  
#### Funções ####
É uma tabelinha que mostra qual será a próxima peça a cair

![preview](https://github.com/YanMatheus/IA-TP1-GeoCatch/blob/master/GeoCatch/mapageocatchdemo.gif width="400" "css")

#### Quiz ####
É a tabela onde o jogo é jogado, onde as peças caem, onde tem bug.
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

![preview](https://github.com/YanMatheus/Tetris-Souls/blob/master/tetris/tabuleiro.PNG "css")

####  Informações ####
É onde ficam as informações do jogo, sendo XP a quantidade de pontos que a pessoa tem, e cada level representa quantas camadas foram destruídas pelo jogador.
```html
 <div id="informacoes"></div>
```

![preview](https://github.com/YanMatheus/Tetris-Souls/blob/master/tetris/informacoes.PNG "css")

### DEMO ###
![bkgnd](https://github.com/YanMatheus/Tetris-Souls/blob/master/tetris/gifoso.gif "bkgnd")
