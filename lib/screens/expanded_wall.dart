import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper/wallpaper.dart';
import '../model/wallpaper_model.dart';

class ExplorePage extends StatefulWidget {
  List<String> imgData;
  Photos? photoModel;

  ExplorePage({required this.imgData, required this.photoModel});

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
                      fit: BoxFit.cover,
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
                      onTap: () {
                        _openDialogBox(context);
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
                        _saveImage(context);
                      },
                      child: mColumn(text: "Save", icon: Icons.download)),
                  SizedBox(
                    width: 50,
                  ),
                  InkWell(
                      onTap: () {
                        _openDialogBoxSetImage(context);
                      },
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

  void _openDialogBox(BuildContext context) async {
    return showDialog<void>(
        barrierDismissible: false,
        //Dialog can't be dismissed by tapping outside
        context: (context),
        builder: (BuildContext context) {
          return AlertDialog(
            icon: Icon(Icons.info_outline),
            content: SingleChildScrollView(
                child: ListBody(
              mainAxis: Axis.vertical,
              children: [
                Text('Photo Id: ${widget.photoModel!.id}'),
                Text("Photographer Name: ${widget.photoModel!.photographer!}"),
                Text('Photographer URL: ${widget.photoModel!.photographerUrl!}')
              ],
            )),
            actions: [
              InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK")),
            ],
          );
        });
  }

  void _openDialogBoxSetImage(BuildContext context) async {
    return showDialog<void>(
        barrierDismissible: true,
        //Dialog can't be dismissed by tapping outside
        context: (context),
        builder: (BuildContext context) {
          return AlertDialog(
           title: Center(child: Text("Set Wallpaper for")),
            content: Row(
              // mainAxis: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {
                      _applyImage(context, "Home");
                    },
                    child: Text("Home")),
                InkWell(
                    onTap: () {
                      _applyImage(context, "LockScreen");
                    },
                    child: Text("LockScreen")),
                InkWell(
                    onTap: () {
                      _applyImage(context, "Both");
                    },
                    child: Text("Both")),
              ],
            ),
          );
        });
  }

  void _saveImage(BuildContext context) {
    GallerySaver.saveImage(widget.photoModel!.src!.portrait!).then((value) =>
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Wallpaper saved successfully..."))));
  }

  void _applyImage(BuildContext context, String forWhichSet) {
    Wallpaper.imageDownloadProgress(
      widget.photoModel!.src!.portrait!,
    ).listen((event) {}, onDone: () {
      if (forWhichSet == "Home") {
        Wallpaper.homeScreen(
                height: mqData!.size.height,
                width: mqData!.size.width,
                options: RequestSizeOptions.RESIZE_FIT)
            .then((value) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content:
                        Text("Wallpaper set for HomeScreen successfully..."))));
      }
      if (forWhichSet == "LockScreen") {
        Wallpaper.lockScreen(
                height: mqData!.size.height,
                width: mqData!.size.width,
                options: RequestSizeOptions.RESIZE_FIT)
            .then((value) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content:
                        Text("Wallpaper set for LockScreen successfully..."))));
      }
      if (forWhichSet == "Both") {
        Wallpaper.bothScreen(
                height: mqData!.size.height,
                width: mqData!.size.width,
                options: RequestSizeOptions.RESIZE_FIT)
            .then((value) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content:
                        Text("Wallpaper set for BothScreen successfully..."))));
      }
    }, onError: (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error while downloading: $e")));
    });
  }
}
