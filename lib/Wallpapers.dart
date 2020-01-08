import 'package:flutter/material.dart';

import 'DartObject.dart';

class Wallpapers extends StatefulWidget {

  final DartObject obj;
  Wallpapers(this.obj);

  @override
  _WallpapersState createState() => _WallpapersState();
}

class _WallpapersState extends State<Wallpapers> {
  @override
  Widget build(BuildContext context) {
    return Material(
       child: ListView.builder(
           itemBuilder: (context,index){
              return Image.network(widget.obj.photos[index].src.landscape);
           },
           itemCount: widget.obj.photos.length
       )

    );
  }
}
