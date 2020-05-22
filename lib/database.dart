import 'dart:async';
import 'package:sqflite/sqflite.dart';


class lenguaje {
  String nom;
  String nom_fun;
  String nom_lib;
  String cod;
  String categoria;
  String desc;
  int id_len;


  lenguaje(this.nom, this.nom_fun, this.nom_lib, this.cod, this.categoria,
      this.desc, this.id_len);

  Map<String , dynamic> toMap() {
    return {
      "nom": nom,
      "nom_fun": nom_fun,
      "nom_lib": nom_lib,
      "cod": cod,
      "categoria": categoria,
      "desc": desc,
      "id_len": id_len
    };
  }
  lenguaje.fromMap(Map<String, dynamic> map){
    nom = map['nom'];
    nom_fun = map['nom_fun'];
    nom_lib = map['nom_lib'];
    cod = map['cod'];
    categoria = map['categoria'];
    desc = map['desc'];
    id_len = map['id_len'];
  }
}

class lengDatabase {
  Database _db;
  
  initDB()  async{
   _db = await openDatabase('lenguaje.db',
   version: 1,
   onCreate: (Database db, int version){
     db.execute("CREATE TABLE lenguajes (id_len INTEGER PRIMARY KEY, nom TEXT NOT NULL);");
     db.execute("CREATE TABLE sintaxis (id_len INTEGER , nom_fun TEXT NOT NULL, desc TEXT, cod TEXT, categoria TEXT);");
     db.execute("CREATE TABLE libreias (id_len INTEGER , nom_lib TEXT NOT NULL, desc TEXT, id_lib INTEGER PRIMARY KEY);");
     db.execute("CREATE TABLE codigo (id_lib INTEGER, nom_fun TEXT NOT NULL, sintax TEXT, cod TEXT);");
     //enlace de llaves
     db.execute("ALTER TABLE sintaxis ADD FOREIGN KEY(id_len) REFERENCES lenguajes(id_len);");
     db.execute("ALTER TABLE librerias ADD FOREIGN KEY(id_len) REFERENCES lenguajes(id_len);");
     db.execute("ALTER TABLE codigo ADD FOREIGN KEY(id_lib) REFERENCES librerias(id_lib);");
     //llenar bdd
     db.execute("INSERT INTO lenguajes(id_len,nom) VALUES(1,'java Script');");
     db.execute("INSERT INTO sintaxis(id_len,nom_fun,desc, cod, categoria) VALUES(1,'declaracion de variables','esta es la sintaxis para la declaracion de variables  inicialmente se pone el tipo de dato el cual va a almacenar nuestra variable y despues el identificador y se termina la sentencia en ;','var nombre; o  int num','declaracion');");
     db.execute("INSERT INTO sintaxis(id_len,nom_fun,desc, cod, categoria) VALUES(1,'declaracion de arreglos','los arreglos se declaran poniendo el nombre del identificador luego el simbolo = y depues las palabras reservadas new array();','nombre = new array();','declaracion');");
     db.execute("INSERT INTO sintaxis(id_len,nom_fun,desc, cod, categoria) VALUES(1,'declaracion del lenguaje','Aunque JavaScript se puede incluir directamente en un documento (X)HTML, ocurre como las hojas de estilo: suele ser más útil como un archivo independiente vinculado a cada documento que necesite de los comportamientos definidos en él; así sólo hay que mantener unos pocos archivos .js para actualizar los comportamiento de todo un sitio. Para ello habría que incluir en el head del documento una línea como ésta','<script type= text/javascript src= URL_de_archivo.js ></script>','declaracion');");
     db.execute("INSERT INTO sintaxis(id_len,nom_fun,desc, cod, categoria) VALUES(1,'operaciones','Los operadores son símbolos con los que, como su nombre indica, se pueden realizar operaciones con variables, valores constantes o variables y valores constantes. Hay muchos tipos de operadores','total = a + b;','sintaxis');");
     db.execute("INSERT INTO sintaxis(id_len,nom_fun,desc, cod, categoria) VALUES(1,'condicional if else','Por medio de if se puede indicar una condición que, de cumplirse, permite la ejecución de uno o más enunciados. Por medio de else se puede establecer una alternativa, aunque su uso es opcional.','if(condición) {enunciados a ejecutar si se cumple la condición } else { enunciados a ejecutar si NO se cumple la condición }','condicional');");
     db.execute("INSERT INTO sintaxis(id_len,nom_fun,desc, cod, categoria) VALUES(1,'condicional switch','Por medio de switch se puede listar una serie de bloques de enunciados que se ejecuten dependiendo del valor de una variable.','switch (variable){case(valor1): enunciados a ejecutar para ese valor… break; }','condicional');");
     db.execute("INSERT INTO sintaxis(id_len,nom_fun,desc, cod, categoria) VALUES(1,'ciclo for','Un bucle es la repetición de uno o varios enunciados un número determinado de veces.','for(contador;condición;variación_del_contador){ lineas de codigo a ejecutar }','cilo');");
     db.execute("INSERT INTO sintaxis(id_len,nom_fun,desc, cod, categoria) VALUES(1,'ciclo do while ','El comportamiento de do … while es similar al de for, con la diferencia de que primero se ejecutan los enunciados y luego se comprueba la codición.','do{ lineas de codigo } while (condición);','cilo');");
     db.execute("INSERT INTO sintaxis(id_len,nom_fun,desc, cod, categoria) VALUES(1,'comandos de salida','para poder mostara una salida a pantalla se utliliza  console.log ','console.log(mensage o variable);','salida');");
     db.execute("INSERT INTO sintaxis(id_len,nom_fun,desc, cod, categoria) VALUES(1,'comandos de salida','para poder mostara una salida a pantalla se utliliza  console.log ','console.log(mensage o variable);','salida');");
     print(db.execute("SELECT ALL FROM sintaxis").toString());
   },
   );
   print("bdd inicializada");
  }
  Future<List<lenguaje>> getAllDatabase(String sql) async{
     List<Map<String, dynamic>> results = await _db.rawQuery("SELECT ALL FROM lenguajes l, sintaxis  s, librerias li, codigo c WHERE (l.id_lem="+sql+");");
     return results.map((map) => lenguaje.fromMap(map));
  }

  Future<List<lenguaje>> getDatabase(String sql) async{
    List<Map<String, dynamic>> results = await _db.rawQuery("SELECT nom, nom_fun, cod, desc FROM lenguajes , sintaxis   WHERE categoria='"+sql+"';");
    print(results);
    return results.map((map) => lenguaje.fromMap(map));
  }

}