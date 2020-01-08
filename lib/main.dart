import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'DartObject.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  TabController controller;
  String url = "https://api.pexels.com/v1/search?query=example+query&per_page=15&page=1";

  Map<String,String> header = {
    "Authorization":"563492ad6f9170000100000157666921e3c64dfca5d145b86d173d22"
  };

  DartObject obj;

  @override
  void initState() {
    super.initState();
    fetchData();
    controller = TabController(length: 2, vsync: this);
  }

  void fetchData() async {
    var data = await http.get(url,headers: header);
    var decodedJson = jsonDecode(data.body);
    obj = DartObject.fromJson(decodedJson);
    print(data.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

