import 'package:task7_wallpaper/model/wallpaper_model.dart';

abstract class BlocState{}
class InitialState extends BlocState{}
class LoadingState extends BlocState{}
class LoadedState extends BlocState{
  WallpaperModel trendingWall;
  LoadedState({required this.trendingWall});
}
class ErrorState extends BlocState{
  String errorMsg;
  ErrorState({required this.errorMsg});
}