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
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Column(
                    children: <Widget>[
                      Image.network(widget.obj.photos[index].src.landscape),
                      Container(
                        width: double.infinity,
                        child: Material(
                          color: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(widget.obj.photos[index].photographer,
                            textAlign: TextAlign.center,),
                          ),
                        ),
                      )
                    ],

                  ),
                ),
              );
           },
           itemCount: widget.obj.photos.length
       )

    );
  }
}
