import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task7_wallpaper/bloc/wall_bloc.dart';
import 'package:task7_wallpaper/bloc/wall_events.dart';
import 'package:task7_wallpaper/bloc/wall_states.dart';
import 'package:task7_wallpaper/screens/expanded_wall.dart';
import 'package:task7_wallpaper/screens/home_page.dart';

class WallpaperScreen extends StatelessWidget {
  String search;
  String color;

  WallpaperScreen({required this.search,this.color = ""});

  @override
  Widget build(BuildContext context) {
    context
        .read<WallPaperBloc>()
        .add(GetSearchedWallpaper(search: search,color: color));
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 215, 236, 237),
        title: IconButton(icon: Icon(Icons.arrow_back_ios_new),onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return DashBoardPage();
          }));
        },),
      ),
      backgroundColor: Color.fromARGB(255, 215, 236, 237),
      body: BlocBuilder<WallPaperBloc, BlocState>(
        builder: (_, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ErrorState) {
            return Center(child: Text(state.errorMsg));
          }
          if (state is SearchedLoadedState) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        search,
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Total Wallpaper: ${state.searchWall.photos!.length+1}',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                    GridView.builder(
                        itemCount: state.searchWall.photos!.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          childAspectRatio: 9 / 15,
                          maxCrossAxisExtent: 200,
                        ),
                        itemBuilder: (_, Index) {
                          var data = state.searchWall.photos!;
                          return Padding(
                            padding: EdgeInsets.all(15),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return ExplorePage(img: data[Index].src!.original!);
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
            );
          }
          return Container();
        },
      ),
    );
  }
}
