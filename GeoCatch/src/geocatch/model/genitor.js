Query query = newQ uery("consult",

  new Term[] {
    new Atom("../../recursos/prolog/parentes.pl")
  });

try {
  query.hasSolution();

  Variable X = new Variable("X");

  Query consultaPessoas = new Query("pessoa", new Term[] {
    X
  });

  System.out.println("Listagemdegenitores");

  while (consultaPessoas.hasMoreElements()) {

    Hashtable tabela = consultaPessoas.nextSolution();


    Term pessoa = (Term) tabela.get(X.name());

    Variable Pai = new Variable("Pai");

    Query consultaPais = new Query("genitor",

      new Term[] {
        Pai,
        pessoa
      });

    if (consultaPais.hasSolution()) {

      int cont = 0;

      while (consultaPais.hasMoreElements()) {

        if (cont++ != 0) System.out.print("e");

        Hashtable tabelaPai = consultaPais.nextSolution();

        System.out.print(tabelaPai.get(Pai.name()));

      }

      System.out.print("sãoosgenitoresde");

      System.out.println(pessoa.name());

    }

  }

} catch (PrologExceptionpe) {

  System.out.println("OarquivoProlognãofoiencontrado.");

  pe.printStackTrace();

}

}
}
