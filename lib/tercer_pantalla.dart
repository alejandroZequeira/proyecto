import 'package:flutter/material.dart';
import 'package:holasoftware/database2.dart';
import 'database2.dart';
import 'main.dart';
lengDatabase db = lengDatabase();
inter i = inter();
class tercer_pantalla  extends StatelessWidget{
  int sql;

  tercer_pantalla(this.sql);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("lenguaje"),
        ),
        body:FutureBuilder(
          future: db.initDB(),
          builder: (BuildContext, snapshot){
            if(snapshot.connectionState== ConnectionState.done){
              return _datos(context);
            }else{
              return  Center(
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Go back!'),
                ),
              );
            }
          },
        )
    );
  }
  _datos(BuildContext context){
    return FutureBuilder(
      future: db.getAllDatabase(),
      builder: (BuildContext context, AsyncSnapshot<List<lenguaje>> snapshot){
        print(snapshot.hasData);
        if(snapshot.hasData){
          return ListView(
            children: <Widget>[
              for (lenguaje len in snapshot.data) if(sql==len.id_len)ListTile(title: Text(len.nombre)),

            ],
          );
        }else{
          return Center(
            child:Text("404 not font"),
          );
        }
      },
    );
  }


}