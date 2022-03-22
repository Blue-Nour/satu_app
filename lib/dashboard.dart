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
      //Page
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
        //Ligne du dashboard
        children: [
          Column(children: [
            //1ere colonne : Valeur actuelle
            Container(
              //Container "titre"
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
                //Container avec val
                margin: const EdgeInsets.only(bottom: 5, right: 30, left: 80),
                padding: const EdgeInsets.all(5.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Text(sprintf("%04.1f %", [_instValue]),
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold))),
            GestureDetector(
                child: Container(
                  //Container bouton vlaidation prchaine valeur
                  margin:
                      const EdgeInsets.only(bottom: 30, right: 30, left: 80),
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                  ),
                  width: 170, //MediaQuery.of(context).size.height * 0.50,
                  height: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Passer à la prochaine valeur",
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Amatic',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
                  setState(
                    () {
                      _instValue = _nextValue;
                    },
                  );
                })
          ]),
          Column(children: [
            //2eme colonne : prochaine val
            Container(
              //Container 'titre'
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
                //Container val
                margin: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
                padding: const EdgeInsets.all(5.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Text(sprintf("%04.1f %", [_nextValue]),
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
            Container(
                //Container boutons
                margin: const EdgeInsets.only(bottom: 30, right: 30, left: 30),
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    GestureDetector(
                        child: Container(
                          //Bouton +1
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            border: Border.all(color: Colors.blueAccent),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          width: MediaQuery.of(context).size.height * 0.05,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "+1",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Amatic',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(
                            () {
                              _nextValue++;
                            },
                          );
                        }),
                    GestureDetector(
                        child: Container(
                          //Bouton -1
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            border: Border.all(color: Colors.blueAccent),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          width: MediaQuery.of(context).size.height * 0.05,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "-1",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Amatic',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(
                            () {
                              _nextValue--;
                            },
                          );
                        })
                  ],
                ))
          ])
        ],
      ),
    );
  }
}

//Creer un widget AffichVal(petit, valeur)
//Creer une liste
