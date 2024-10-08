import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task7_wallpaper/bloc/wall_bloc.dart';
import 'package:task7_wallpaper/data/remote/api_helper.dart';
import 'package:task7_wallpaper/screens/home_page.dart';

import 'data/repos/wallpaper_repo.dart';

void main(){
  runApp(BlocProvider(create: (context){
    return WallPaperBloc(repo: WallpaperRepo(apiHelper: ApiHelper()));
  },child: MyApp(),));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My App",
      home: DashBoardPage(),
    );
  }
}
