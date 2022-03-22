import 'package:flutter/material.dart';
import 'package:satu_app/menu.dart';

var json;

class Scenarios extends StatefulWidget {
  @override
  ScenariosState createState() => ScenariosState();
}

class ScenariosState extends State<Scenarios> {
  var _listScenarios = ['Scenario1', 'Scenario2'];

  Widget _ScenariosListView(BuildContext context) {
    return ListView.separated(
        itemCount: _listScenarios.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_listScenarios[index]),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Scenarios'),
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
        body: _ScenariosListView(context));
  }
}
