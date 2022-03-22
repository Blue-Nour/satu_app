import 'package:flutter/material.dart';
import 'package:satu_app/dashboard.dart';
import 'package:satu_app/devices.dart';
import 'package:satu_app/scenarios.dart';

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';

var _data;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
      routes: <String, WidgetBuilder>{
        '/Dash': (BuildContext context) => Dashboard(),
        '/Dev': (BuildContext context) => Devices(),
        '/Scen': (BuildContext context) => Scenarios(),
      },
    );
  }
}
