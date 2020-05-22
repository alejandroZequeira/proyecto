import 'package:flutter/material.dart';
import 'package:holasoftware/database.dart';
import 'database.dart';
import 'main.dart';
lengDatabase db = lengDatabase();
List<String> _lenguaje=[];
inter i = inter();
class segunda_pantalla extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body:FutureBuilder(
        future: db.initDB(),
        builder: (BuildContext, snapshot){
          if(snapshot.connectionState== ConnectionState.done){
            return _datos(i.sql, context);
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
  _datos(String sql, BuildContext context){
    return FutureBuilder(
        future: db.getDatabase(sql),
        builder: (BuildContext context, AsyncSnapshot<List<lenguaje>> snapshot){
          if(snapshot.hasData){
            return ListView(
              children: <Widget>[
                for (lenguaje len in snapshot.data) ListTile(title: Text(sql))
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
  consulta(String sql){
    if(sql.length>1){
      return db.getDatabase(sql);
    }else{
      return db.getAllDatabase(sql);
    }
  }
}
