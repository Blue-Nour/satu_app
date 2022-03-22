import 'package:flutter/material.dart';
import 'package:satu_app/datajson.dart';
import 'package:satu_app/menu.dart';

class Devices extends StatelessWidget {
  @override
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
        body: Center(
          child: FutureBuilder<List>(
              future: fetchjson(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasError) {
                      return Text('Error');
                    } else {
                      var items = snapshot.data as List<ListDevices>;
                      return DevList(
                        listAppareils: items,
                      );
                    }
                }
              }),
        ));
  }
}

class DevList extends StatelessWidget {
  final List<ListDevices> listAppareils;

  DevList({Key? key, required this.listAppareils}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: listAppareils == null ? 0 : listAppareils.length,
        itemBuilder: (context, int index) {
          return ListTile(
            title: Text(listAppareils[index].name),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        });
  }
}
