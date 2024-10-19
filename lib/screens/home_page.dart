import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task7_wallpaper/bloc/wall_bloc.dart';
import 'package:task7_wallpaper/bloc/wall_events.dart';
import 'package:task7_wallpaper/bloc/wall_states.dart';
import 'package:task7_wallpaper/screens/expanded_wall.dart';
import 'package:task7_wallpaper/screens/search_wall.dart';
import 'package:task7_wallpaper/widget_const/color_const.dart';

class DashBoardPage extends StatefulWidget {
  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  void initState() {
    context.read<WallPaperBloc>().add(GetTrendingwallpaper());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    List<Image> listImage2 = [
      Image.asset(
        "assets/images/img_11.png",
        fit: BoxFit.cover,
      ),
      Image.asset(
        "assets/images/img_1.png",
        fit: BoxFit.cover,
      ),
      Image.asset(
        "assets/images/img_2.png",
        fit: BoxFit.cover,
      ),
      Image.asset(
        "assets/images/img_3.png",
        fit: BoxFit.cover,
      ),
      Image.asset(
        "assets/images/img_4.png",
        fit: BoxFit.cover,
      ),
      Image.asset(
        "assets/images/img_5.png",
        fit: BoxFit.cover,
      ),
      Image.asset(
        "assets/images/img_7.png",
        fit: BoxFit.cover,
      ),
      Image.asset(
        "assets/images/img_8.png",
        fit: BoxFit.cover,
      ),
    ];
    List<String> text = [
      "Sport",
      "Forest",
      "Cloud",
      "Mountain",
      "Hill",
      "Bird",
      "Village",
      "Nature",
    ];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 215, 236, 237),
      body: BlocBuilder<WallPaperBloc, BlocState>(builder: (_, state) {
        if (state is LoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is ErrorState) {
          return Center(child: Text(state.errorMsg));
        }
        if (state is TrendingLoadedState) {
          var trendingData = state.trendingWall.photos;
          return Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 50),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  /*-----------Search Bar--------------*/
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: searchController,
                      onEditingComplete: () {
                        String search = searchController.text.toString();
                        search != ""
                            ? Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                return WallpaperScreen(
                                  search: search,
                                );
                              }))
                            : ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text("Please enter any category!!!")));
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Find Wallpapers...",
                        hintStyle: TextStyle(color: Colors.black12),
                        filled: true,
                        fillColor: Colors.white60,
                        suffixIcon: Icon(Icons.search_outlined),
                        suffixIconColor: Colors.black12,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Best of the Month",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      /*------------Trending ListView---------*/
                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                          itemCount: trendingData!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (Context, index) {
                            return Row(
                              children: [
                                /*----------Navigate to Expanded image------*/
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ExplorePage(
                                          imgData: [trendingData[index]
                                              .src!
                                              .portrait!,trendingData[index]
                                              .src!
                                              .landscape!],photoModel: trendingData[index],);
                                    }));
                                  },
                                  child: SizedBox(
                                    width: 100,
                                    child: ClipRRect(
                                      child: Image.network(
                                        trendingData[index].src!.original!,
                                        fit: BoxFit.cover,
                                        height: trendingData[index]
                                            .height!
                                            .toDouble(),
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "The color tone",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      /*------------Color ListView---------*/
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: ColorConst.mColor.length,
                          itemBuilder: (_, Index) {
                            return Row(
                              children: [
                                InkWell(
                                  onTap:(){
                                    String search = searchController.text.toString();
                                    search != ""?Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return WallpaperScreen(search: searchController.text.toString(),color: ColorConst.mColor[Index]['color'],);
                                    })):ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please search anything to get this color theme!!")));
                            },
                                  child: Container(
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: ColorConst.mColor[Index]['shade'],
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      /*------------Categories ListView---------*/
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            child: GridView.builder(
                                itemCount: listImage2.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 250,
                                  childAspectRatio: 5 / 3,
                                ),
                                itemBuilder: (_, Index) {
                                  return Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 12, 12),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: listImage2[Index],
                                    ),
                                  );
                                }),
                          ),
                          Container(
                            width: double.infinity,
                            child: GridView.builder(
                                itemCount: text.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 250,
                                  childAspectRatio: 5 / 3,
                                ),
                                itemBuilder: (_, Index) {
                                  return Padding(
                                    padding: EdgeInsets.fromLTRB(0, 12, 12, 12),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                          return WallpaperScreen(search: text[Index]);
                                        }));
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Center(
                                            child: Text(
                                          text[Index],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      }),
    );
  }
}
