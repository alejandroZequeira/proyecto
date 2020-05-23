
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:holasoftware/menu_appbar.dart';
import 'segunda_pantalla.dart';
import 'package:holasoftware/database2.dart';
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
        child: m.menu(context)
      ),
      body: Center(
        child: inter()
    )
    );
  }
}
class inter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

      return Center(child: Container(
          alignment: Alignment.center,
           child: Column(
             children: <Widget>[
               Row(children: <Widget>[
                 Column(
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset('recursos/iconoCiclo.png'),onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>segunda_pantalla("ciclo")));
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>segunda_pantalla("condicional")));
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>segunda_pantalla("entrada")));
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
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>segunda_pantalla("salida")));
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
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>segunda_pantalla("sintaxis")));
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