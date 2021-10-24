import 'package:flutter/material.dart';
import 'dart:math' as math;

class App extends StatefulWidget{
  createState(){
   return AppState();
 }
}

class AppState extends State<App> {
  int counter=0;
    Widget build(context) {
      return MaterialApp(
      home: Scaffold(
          body: Center(child: Text('$counter', textScaleFactor: 10,)),
          appBar: AppBar(
            centerTitle: true,
            title: Text("deez nuts"),
          ),
          floatingActionButton: Transform.scale(
            scale: 1.2,
              child: Transform.rotate(
                angle: math.pi / 2,
                child: FloatingActionButton(
                  
                  child: const Icon(Icons.autorenew, size: 45),
                  backgroundColor: Colors.redAccent[700], 
                  onPressed: () {    
                    setState(() {
                      counter+=1;
                    });
                  }
                ) 
              )
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            
  ));

    }
}