import 'package:flutter/material.dart';
import 'package:satu_app/menu.dart';

class Devices extends StatefulWidget {
  @override
  DevicesState createState() => DevicesState();
}

class DevicesState extends State<Devices> {
  var _listAppareils = ['Saturometre', 'Saturometre2'];

  Widget _DevicesListView(BuildContext context) {
    return ListView.separated(
        itemCount: _listAppareils.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_listAppareils[index]),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Appareils'),
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Menu()),
              );
            },
            child: Icon(
              Icons.menu, // add custom icons also
            ),
          ),
        ),
        body: _DevicesListView(context));
  }
}
