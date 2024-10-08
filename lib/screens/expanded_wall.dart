import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ExplorePage extends StatefulWidget {
  Image img;
  ExplorePage({required this.img});
  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  Color mTappedColor = Colors.white.withOpacity(0.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: widget.img
          ),
          Positioned(
            bottom: 40,
            left: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {

                    },
                    child: mColumn(
                      text: "info",
                      icon: Icons.info_outline,
                    )),
                SizedBox(
                  width: 50,
                ),
                InkWell(
                    onTap: () {

                    },
                    child: mColumn(text: "Save", icon: Icons.download)),
                SizedBox(
                  width: 50,
                ),
                InkWell(
                    onTap: () {

                    },
                    child: mColumn(text: "Apply", icon: Icons.brush)),
              ],
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
