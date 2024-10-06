import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App",
      home: ExplorePage(),
    );
  }
}

class ExplorePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset("assets/images/part1/img_12.png",fit: BoxFit.cover,),
              ),
              Positioned(
                bottom: 50,
                left: 100,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Icon(Icons.info_outline,color: Colors.white,),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text("info",style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic),)
                      ],
                    ),
                    SizedBox(width: 50,),
                    Column(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Icon(Icons.download,color: Colors.white,),
                          decoration: BoxDecoration(
                            color: Colors.white60.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text("Save",style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic),)
                      ],
                    ),
                    SizedBox(width: 50,),
                    Column(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Icon(Icons.brush,color: Colors.white,),
                          decoration: BoxDecoration(
                            color: CupertinoColors.activeBlue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text("Apply",style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic),)
                      ],
                    ),
                  ],
                ),
              ),
            ],
      ),
    );
  }

}