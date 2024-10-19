import 'package:task7_wallpaper/model/wallpaper_model.dart';

abstract class BlocState{}
class InitialState extends BlocState{}
class LoadingState extends BlocState{}
class TrendingLoadedState extends BlocState{
  WallpaperModel trendingWall;
  TrendingLoadedState({required this.trendingWall});
}
class SearchedLoadedState extends BlocState{
  WallpaperModel searchWall;
  SearchedLoadedState({required this.searchWall});
}
class ErrorState extends BlocState{
  String errorMsg;
  ErrorState({required this.errorMsg});
}