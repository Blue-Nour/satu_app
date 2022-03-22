import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class ListDevices {
  final int id;
  final String name;
  final String ip;
  final String category;

  ListDevices(
      {required this.id,
      required this.name,
      required this.category,
      required this.ip});

  factory ListDevices.fromJson(Map<String, dynamic> json) {
    return ListDevices(
        id: json['devices']['id'] as int,
        name: json['devices']['name'] as String,
        category: json['devices']['category'] as String,
        ip: json['devices']['ip'] as String);
  }
}

List<ListDevices> analysejson(String responseBody) {
  final parsedJson = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsedJson
      .map<ListDevices>((json) => ListDevices.fromJson(json))
      .toList();
}

Future<List<ListDevices>> fetchjson() async {
  final response = await rootBundle.loadString('assets/Appareils.json');
  return compute(analysejson, response);
}
