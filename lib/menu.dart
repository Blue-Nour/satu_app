import 'package:flutter/material.dart';
import 'package:satu_app/dashboard.dart';
import 'package:satu_app/devices.dart';
import 'package:satu_app/scenarios.dart';

class Menu extends StatelessWidget {
  var listMenu = ['Dashboard', 'Scenarios', 'Appareils'];
  @override
  Widget _buildRow(String word, String route, BuildContext context) {
    return ListTile(
      title: Text(
        word,
        style: TextStyle(fontSize: 18.0),
      ),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }

  Widget _buildListMenu(BuildContext context) {
    int i = 0;
    String word = listMenu[i];
    return ListView(padding: const EdgeInsets.all(16.0), children: [
      _buildRow(listMenu[0], '/Dash', context),
      Divider(),
      _buildRow(listMenu[1], '/Scen', context),
      Divider(),
      _buildRow(listMenu[2], '/Dev', context),
      Divider(),
    ]);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: _buildListMenu(context),
    );
  }
}
