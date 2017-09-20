%Area in Km²

/* http://www.ibge.gov.br/home/geociencias/cartografia/default_territ_area.shtm */

/*Country something*/
area('Brazil', 8515759.090).%Brazil area


/*NORTH*/
area('Acre', 164123.737).%Acre area
area('Amazonas', 1559146.876).%Amazonas area
area('Amapá',  142828.521).%Amapa area
area('Pará', 1247955.238).%Para area
area('Rondonia', 237765.293).%Rondonia area
area('Roraima',  224300.805).%Roraima area
area('Tocantins', 277720.412).%Tocantins area
/*NORTHEAST*/
area('Alagoas', 27848.140).%Alagoas area
area('Bahia', 564732.450 ).%Bahia area
area('Ceará', 148887.633).%Ceara area
area('Maranhão', 331936.949).%Maranhao area
area('Paraíba', 56468.435).%Paraiba area
area('Pernambuco', 98076.021).%Pernambuco area
area('Piauí', 251611.929).%Piaui area
area('Rio Grande do Norte',  52811.107).%Rio_Grande_do_Norte area
area('Sergipe', 21918.443 ).%Sergipe area
/*SOUTHEAST*/
area('Espírito Santo', 46086.907).%Espirito_Santo area
area('Minas Gerais', 586520.732).%Minas_Gerais area
area('Rio de Janeiro', 43781.588).%Rio_de_Janeiro area
area('São Paulo', 248219.627).%Sao_Paulo area
/*SOUTH*/
area('Paraná', 199307.939).%Parana area
area('Rio Grande do Sul', 281737.888 ).%Rio_Grande_do_Sul area
area('Santa Catarina', 95737.954 ).%Santa_Catarina area
/*CENTRALWEST*/
area('Distrito Federal', 5779.997).%Distrito_Federal area
area('Goiás', 340106.492).%Goias area
area('Mato Grosso do Sul', 357145.531).%Mato_Grosso_do_Sul area
area('Mato Grosso', 903202.446).%Mato_Grosso area

%Capitals

/*https://www.estadosecapitaisdobrasil.com/ */

/*Country capital*/
capital('Brazil', 'Brasilia').%Brazil capital


/*NORTH*/
capital('Acre', 'Rio Branco').%Acre capital
capital('Amazonas', 'Manaus').%Amazonas capital
capital('Amapá', 'Macapá').%Amapa capital
capital('Pará', 'Belém').%Para capital
capital('Rondonia', 'Porto Velho').%Rondonia capital
capital('Roraima', 'BoaVista').%Roraima capital
capital('Tocantins', 'Palmas').%Tocantins capital
/*NORTHEAST*/
capital('Alagoas', 'Mació').%Alagoas capital
capital('Bahia', 'Salvador').%Bahia capital
capital('Ceará', 'Fortaleza').%Ceara capital
capital('Maranhão', 'São Luís').%Maranhao capital
capital('Paraíba', 'João Pessoa').%Paraiba capital
capital('Pernambuco', 'Recife').%Pernambuco capital
capital('Piauí', 'Teresina').%Piaui capital
capital('Rio Grande do Norte', 'Natal').%Rio_Grande_do_Norte capital
capital('Sergipe', 'Aracaju').%Sergipe capital
/*SOUTHEAST*/
capital('Espírito Santo', 'Vitória').%Espirito_Santo capital
capital('Minas Gerais', 'Belo Horizonte').%Minas_Gerais capital
capital('Rio de Janeiro', 'Rio de Janeiro').%Rio_de_Janeiro capital
capital('São Paulo', 'São Paulo').%Sao_Paulo capital
/*SOUTH*/
capital('Paraná', 'Curitiba').%Parana capital
capital('Rio Grande do Sul', 'Porto Alegre').%Rio_Grande_do_Sul capital
capital('Santa Catarina', '').%Santa_Catarina capital
/*CENTRALWEST*/
capital('Distrito Federal', 'Brasília').%Distrito_Federal capital
capital('Goiás', 'Goiânia').%Goias capital
capital('Mato Grosso do Sul', 'Campo Grande').%Mato_Grosso_do_Sul capital
capital('Mato Grosso', 'Cuiabá').%Mato_Grosso capital


%Costal states

/* http://www.brasilazul.com.br/estadoslitoraneos.asp */

/*Country something*/
coastalstate('Brazil', ['Amapá', 'Pará', 'Alagoas',
  'Bahia', 'Ceará', 'Maranhão',
  'Paraíba', 'Pernambuco', 'Piauí',
  'Rio Grande do Norte','Sergipe',
  'Espírito Santo', 'Rio de Janeiro',
  'São Paulo', 'Paraná',
  'Rio Grande do Sul', 'Santa Catarina']).
  %Brazilian coastal states


/*NORTH*/
coastalstate('Brazil', 'Amapá').%Brazilian coastal state
coastalstate('Brazil', 'Pará').%Brazilian coastal state

/*NORTHEAST*/
coastalstate('Brazil', 'Alagoas').%Brazilian coastal state
coastalstate('Brazil', 'Bahia').%Brazilian coastal state
coastalstate('Brazil', 'Ceará').%Brazilian coastal state
coastalstate('Brazil', 'Maranhão').%Brazilian coastal state
coastalstate('Brazil', 'Paraíba').%Brazilian coastal state
coastalstate('Brazil', 'Pernambuco').%Brazilian coastal state
coastalstate('Brazil', 'Piauí').%Brazilian coastal state
coastalstate('Brazil', 'Rio Grande do Norte').%Brazilian coastal state
coastalstate('Brazil', 'Sergipe').%Brazilian coastal state

/*SOUTHEAST*/
coastalstate('Brazil', 'Espírito Santo').%Brazilian coastal state
coastalstate('Brazil', 'Rio de Janeiro').%Brazilian coastal state
coastalstate('Brazil', 'São Paulo').%Brazilian coastal state

/*SOUTH*/
coastalstate('Brazil', 'Paraná').%Brazilian coastal state
coastalstate('Brazil', 'Rio Grande do Sul').%Brazilian coastal state
coastalstate('Brazil', 'Santa Catarina').%Brazilian coastal state

%Contry border

/*font*/

/*Country something*/
countryborder('Brazil',['Acre','Amazonas','Amapá', 'Pará',
'Rondonia','Roraima','Alagoas',
 'Bahia','Ceará','Maranhão', 'Paraíba',
 'Pernambuco',  'Piauí', 'Rio Grande do Norte',
'Sergipe','Espírito Santo',
'Rio de Janeiro', 'São Paulo','Paraná',
'Rio Grande do Sul','Santa Catarina',
'Mato Grosso do Sul', 'Mato Grosso']).
%States in the country border


%Federative_Unit

/* https://www.estadosecapitaisdobrasil.com/ */

/*Country abbreviation*/

fu('Brazil', 'BR').%Brazil fu


/*NORTH*/
fu('Acre', 'AC').%Acre fu
fu('Amazonas', 'AM').%Amazonas fu
fu('Amapá', 'AP').%Amapa fu
fu('Pará', 'PA').%Para fu
fu('Rondonia', 'RO').%Rondonia fu
fu('Roraima', 'RR').%Roraima fu
fu('Tocantins', 'TO').%Tocantins fu
/*NORTHEAST*/
fu('Alagoas', 'AL').%Alagoas fu
fu('Bahia', 'BH').%Bahia fu
fu('Ceará', 'CE').%Ceara fu
fu('Maranhão', 'MA').%Maranhao fu
fu('Paraíba','PB').%Paraiba fu
fu('Pernambuco', 'PE').%Pernambuco fu
fu('Piauí', 'PI').%Piaui fu
fu('Rio Grande do Norte', 'RN').%Rio_Grande_do_Norte fu
fu('Sergipe', 'SE').%Sergipe fu
/*SOUTHEAST*/
fu('Espírito Santo', 'ES').%Espirito_Santo fu
fu('Minas Gerais', 'MG').%Minas_Gerais fu
fu('Rio de Janeiro', 'RJ').%Rio_de_Janeiro fu
fu('São Paulo', 'SP').%Sao_Paulo fu
/*SOUTH*/
fu('Paraná', 'PR').%Parana fu
fu('Rio Grande do Sul', 'RS').%Rio_Grande_do_Sul fu
fu('Santa Catarina', 'SC').%Santa_Catarina fu
/*CENTRALWEST*/
fu('Distrito Federal', 'DF').%Distrito_Federal fu
fu('Goiás', 'GO').%Goias fu
fu('Mato Grosso do Sul', 'MS').%Mato_Grosso_do_Sul fu
fu('Mato Grosso', 'MT').%Mato_Grosso fu


%Population

/* https://pt.wikipedia.org/wiki/Unidades_federativas_do_Brasil 2014*/

/*Country something*/
population('Brazil', 2).%Brazil population


/*NORTH*/
population('Acre',795145).%Acre population
population('Amazonas',3893763).%Amazonas population
population('Amapá', 756500).%Amapa population
population('Pará', 8101180).%Para population
population('Rondonia', 1755015).%Rondonia population
population('Roraima', 500826).%Roraima population
population('Tocantins',1502759).%Tocantins population
/*NORTHEAST*/
population('Alagoas', 3327551).%Alagoas population
population('Bahia', 15150143).%Bahia population
population('Ceará', 8867448).%Ceara population
population('Maranhão', 6861924).%Maranhao population
population('Paraíba', 3950359).%Paraiba population
population('Pernambuco', 9297861).%Pernambuco population
population('Piauí', 3198185).%Piaui population
population('Rio Grande do Norte', 3419550).%Rio_Grande_do_Norte population
population('Sergipe', 2227294).%Sergipe population
/*SOUTHEAST*/
population('Espírito Santo', 3894899).%Espirito_Santo population
population('Minas Gerais', 20777672).%Minas_Gerais population
population('Rio de Janeiro', 16497395).%Rio_de_Janeiro population
population('São Paulo', 44169350).%Sao_Paulo population
/*SOUTH*/
population('Paraná', 11112062).%Parana population
population('Rio Grande do Sul', 11228091).%Rio_Grande_do_Sul population
population('Santa Catarina', 6734568).%Santa_Catarina population
/*CENTRALWEST*/
population('Distrito Federal', 2867869).%Distrito_Federal population
population('Goiás', 6551322).%Goias population
population('Mato Grosso do Sul', 2630098).%Mato_Grosso_do_Sul population
population('Mato Grosso', 3236578).%Mato_Grosso population


%Regions

/*https://www.estadosecapitaisdobrasil.com/ */

/*All the regions in the country*/
region('Brazil',['North', 'Northeast', 'Southeast', 'South', 'Central West']).%Brazil regions


/*NORTH*/
region('Acre', 'North'). %Acre region
region('Amazonas', 'North'). %Amazonas region
region('Amapá', 'North'). %Amapa region
region('Pará', 'North'). %Para region
region('Rondonia','North'). %Rondonia region
region('Roraima', 'North'). %Roraima region
region('Tocantins', 'North'). %Tocantins region
/*NORTHEAST*/
region('Alagoas', 'Northeast'). %Alagoas region
region('Bahia', 'Northeast'). %Bahia region
region('Ceará', 'Northeast'). %Ceara region
region('Maranhão', 'Northeast'). %Maranhao region
region('Paraíba', 'Northeast'). %Paraiba region
region('Pernambuco', 'Northeast'). %Pernambuco region
region('Piauí', 'Northeast'). %Piaui region
region('Rio Grande do Norte', 'Northeast'). %Rio_Grande_do_Norte region
region('Sergipe', 'Northeast'). %Sergipe region
/*SOUTHEAST*/
region('Espírito Santo', 'Southeast'). %Espirito_Santo region
region('Minas Gerais', 'Southeast'). %Minas_Gerais region
region('Rio de Janeiro', 'Southeast'). %Rio_de_Janeiro region
region('São Paulo', 'Southeast'). %Sao_Paulo region
/*SOUTH*/
region('Paraná', 'South'). %Parana region
region('Rio Grande do Sul', 'South'). %Rio_Grande_do_Sul region
region('Santa Catarina', 'South'). %Santa_Catarina region
/*CENTRAL WEST*/
region('Distrito Federal', 'Central West'). %Distrito_Federal region
region('Goiás', 'Central West'). %Goias region
region('Mato Grosso do Sul', 'Central West'). %Mato_Grosso_do_Sul region
region('Mato Grosso', 'Central West'). %Mato_Grosso region
