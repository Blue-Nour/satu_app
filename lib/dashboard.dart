import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';
import 'package:satu_app/menu.dart';

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  var _instValue = 20.0;
  var _nextValue = 10.0;
  var _deviceName = 'Saturometre';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_deviceName),
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
      body: Row(
        children: [
          Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 30, right: 30, left: 80),
              padding: const EdgeInsets.only(
                  top: 5.0, left: 31.5, right: 31.5, bottom: 5.0),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: Text('Valeur affichée',
                  style: TextStyle(
                    fontSize: 16.0,
                  )),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 30, right: 30, left: 80),
                padding: const EdgeInsets.all(5.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Text(sprintf("%04.1f %", [_instValue]),
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold))),
          ]),
          Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
              padding: const EdgeInsets.only(
                  top: 5.0, left: 15.5, right: 15.5, bottom: 5.0),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: Text('Prochaine valeur',
                  style: TextStyle(
                    fontSize: 10.0,
                  )),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
                padding: const EdgeInsets.all(5.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Text(sprintf("%04.1f %", [_nextValue]),
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
          ])
        ],
      ),
    );
  }
}

//Creer un widget AffichVal(petit, valeur)
//Creer une liste
