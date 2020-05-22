
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:holasoftware/menu_appbar.dart';
import 'segunda_pantalla.dart';
import 'package:holasoftware/database.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hi Software',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Hi Software'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  menu_appbar m =new menu_appbar();
  lengDatabase db = lengDatabase();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      drawer:Drawer(
        child: m.menu()
      ),
      body: Center(
        child: inter()
    )
    );
  }
}
class inter extends StatelessWidget{
  String sql;
  @override
  Widget build(BuildContext context) {
      segunda_pantalla s = new segunda_pantalla();
      return Center(child: Container(
          alignment: Alignment.center,
           child: Column(
             children: <Widget>[
               Row(children: <Widget>[
                 Column(
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset('recursos/iconoCiclo.png'),onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>s));
                      sql="ciclo";
                    }, iconSize: 90,
                    ),
                    Container(
                      child: Text ('Ciclos'),
                      )
                    ],
                ),
                  Column(
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset('recursos/iconoCondicion.png'),onPressed: (){
                          sql="condicional";
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>s));
                      }, iconSize: 90,
                      ),
                      Container(
                        child: Text ('Condiciones'),
                      )],
                  ),
                  Column(
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset('recursos/iconoEntrada.png'),onPressed: (){
                          sql="entrada";
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>s));
                      }, iconSize: 90,
                      ),
                      Container(
                        child: Text ('Entradas'),
                      )],
                  )]
      ),
               Row(
                 children: <Widget>[
                   Column(
                     children: <Widget>[
                     IconButton(
                     icon: Image.asset('recursos/iconoSalida.png'),onPressed: (){
                       sql="salida";
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>s));
                     }, iconSize: 90,
                     ),
                       Container(
                         child: Text ('Salidas'),
                       )],
                   ),
                   Column(
                     children: <Widget>[
                       IconButton(
                         icon: Image.asset('recursos/iconoSintaxis.png'),onPressed: (){
                           sql="sintaxis";
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>s));
                       }, iconSize: 90,
                       ),
                       Container(
                         height: 30,
                         child: Text ('Sintaxis'),
                       )],
                   )
                 ],
               )
           ])
    ));
  }
}