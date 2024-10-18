import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task7_wallpaper/bloc/wall_bloc.dart';
import 'package:task7_wallpaper/bloc/wall_events.dart';
import 'package:task7_wallpaper/bloc/wall_states.dart';
import 'package:task7_wallpaper/screens/expanded_wall.dart';
import 'package:task7_wallpaper/screens/home_page.dart';

import '../model/wallpaper_model.dart';

class WallpaperScreen extends StatefulWidget {
  String search;
  String color;
  int page;

  WallpaperScreen({required this.search, this.color = "", this.page = 1});

  @override
  State<WallpaperScreen> createState() => _WallpaperScreenState();
}

class _WallpaperScreenState extends State<WallpaperScreen> {
  ScrollController? scrollController;
  dynamic totalWallCount = 0;
  int totalPageCount = 0;

  List<Photos> allWallpapers = [];
  int pageCount = 1;

  @override
  void initState() {
    context
        .read<WallPaperBloc>()
        .add(GetSearchedWallpaper(search: widget.search, color: widget.color));
    scrollController = ScrollController();
    scrollController!.addListener(() {
      if (scrollController!.position.pixels ==
          scrollController!.position.maxScrollExtent) {
        //let's assume total wallpaper is 100
        //and in one page there are 15 wallpaper
        //then total pages will be 100/15 in int
        //total page will be 7
        totalPageCount = totalWallCount ~/ 15 + 1;
        //7 > 1 pageCount++ = 2 and continue till our
        //totalWallpaper(total page count) does not end
        //and then we will not increase pageCount
        // bcz wallpaper ends
        if (totalPageCount > pageCount) {
          pageCount++;
          context.read<WallPaperBloc>().add(GetSearchedWallpaper(
              search: widget.search, color: widget.color, page: pageCount));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:
                  Text("You\'ve reached the end of this wallpaper screen!!")));
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 215, 236, 237),
        title: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return DashBoardPage();
            }));
          },
        ),
      ),
      backgroundColor: Color.fromARGB(255, 215, 236, 237),
      //we are using listener so that UI does't rebuild again and again
      body: BlocListener<WallPaperBloc, BlocState>(
        listener: (_, state) {
          if (state is LoadingState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: pageCount != 1
                    ? Text("Page Loading..")
                    : Text("Loading...")));
          }
          if (state is ErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMsg)));
          }
          if (state is SearchedLoadedState) {
            totalWallCount = state.searchWall.totalResults;
            allWallpapers.addAll(state.searchWall.photos!);
            setState(() {});
          }
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: scrollController,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    widget.search,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Total Wallpaper: ${allWallpapers.length}',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
                GridView.builder(
                    itemCount: allWallpapers.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 9 / 15,
                      maxCrossAxisExtent: 200,
                    ),
                    itemBuilder: (_, Index) {
                      var data = allWallpapers;
                      return Padding(
                        padding: EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ExplorePage(imgData: [
                                data[Index].src!.portrait!,
                                data[Index].src!.landscape!
                              ]);
                            }));
                          },
                          child: Container(
                            child: ClipRRect(
                              child: Image.network(
                                data[Index].src!.original!,
                                fit: BoxFit.cover,
                                height: data[Index].height!.toDouble(),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
