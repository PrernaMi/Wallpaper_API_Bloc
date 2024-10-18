import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ExplorePage extends StatefulWidget {
  List<String> imgData;

  ExplorePage({required this.imgData});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  MediaQueryData? mqData;

  Color mTappedColor = Colors.white.withOpacity(0.5);

  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          /*------------Image--------*/
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: mqData!.orientation == Orientation.portrait
                  ? Image.network(
                      widget.imgData[0],
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      widget.imgData[1],
                    )),
          /*------------Bottom Menu--------*/
          Positioned(
            bottom: 10,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {},
                      child: mColumn(
                        text: "info",
                        icon: Icons.info_outline,
                      )),
                  SizedBox(
                    width: 50,
                  ),
                  InkWell(
                      onTap: () {},
                      child: mColumn(text: "Save", icon: Icons.download)),
                  SizedBox(
                    width: 50,
                  ),
                  InkWell(
                      onTap: () {},
                      child: mColumn(text: "Apply", icon: Icons.brush)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mColumn({required String text, required IconData icon}) {
    return Column(
      children: [
        Container(
          height: 40,
          width: 40,
          child: Icon(
            icon,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            color: mTappedColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        )
      ],
    );
  }
}
