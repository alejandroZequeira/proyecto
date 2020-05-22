import 'package:flutter/material.dart';
import 'main.dart';
class menu_appbar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
  }
  ListView menu (){
   return ListView(
          padding: EdgeInsets.zero,
          children:const <Widget>[
            DrawerHeader(decoration: BoxDecoration(color: Colors.blue),
            child:Text('Menu',style: TextStyle(color: Colors.white,fontSize:40))
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title:Text('opciones'),
        )
      ],
    );
  }
}