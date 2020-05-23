import 'package:flutter/material.dart';
import 'main.dart';
import 'tercer_pantalla.dart';
import 'database2.dart';

class menu_appbar extends StatefulWidget {
  lengDatabase _db = lengDatabase();

  @override
  State<StatefulWidget> createState() {
  }
  ListView menu (BuildContext context) {
      return ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'lenguajes',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.cloud),
            title: Text('java Scrip'),
           onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>tercer_pantalla(1)));
              },
          ),

          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      );
    }
  }
