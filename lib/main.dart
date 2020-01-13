import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mysecondflutterapp/SearchPage.dart';
import 'package:mysecondflutterapp/Wallpapers.dart';

import 'DartObject.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.transparent
  ));
  runApp(MyApp());
}

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


  Map<String,String> header = {
    "Authorization":"563492ad6f9170000100000157666921e3c64dfca5d145b86d173d22"
  };

  DartObject obj;
  int pageNo = 1;

  @override
  void initState() {
    super.initState();
    fetchData("wallpaper",20);
    controller = TabController(length: 2, vsync: this);
  }

  incPage(){
    pageNo++;
  }

  String url(String query, int pageNo, int perPage){
    return "https://api.pexels.com/v1/search?query=${query.trim()}+query&per_page=$perPage&page=${pageNo}";
  }

  Future<void> fetchData(String query, int perPage) async {
    var data = await http.get(url(query,pageNo,perPage),headers: header);
    incPage();
    var decodedJson = jsonDecode(data.body);
    obj = DartObject.fromJson(decodedJson);
    setState(() {

    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pexels App"),
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              child:Text("Wallpapers"),
              icon:Icon(Icons.image)
            ),
            Tab(
                child:Text("Search"),
                icon:Icon(Icons.search)
            )
          ],
        ),

      ),
      body: (obj==null)?Center(child: CircularProgressIndicator()): TabBarView(
        controller: controller,
          children: <Widget>[
              Wallpapers(obj,fetchData),
              SearchPage(obj)
          ]
      ),
    );
  }
}

