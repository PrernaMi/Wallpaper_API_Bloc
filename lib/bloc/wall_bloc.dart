import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task7_wallpaper/bloc/wall_events.dart';
import 'package:task7_wallpaper/bloc/wall_states.dart';
import 'package:task7_wallpaper/model/wallpaper_model.dart';

import '../data/repos/wallpaper_repo.dart';

class WallPaperBloc extends Bloc<BlocEvent, BlocState> {
  WallpaperRepo? repo;

  WallPaperBloc({required this.repo}) : super(InitialState()) {
    on<GetTrendingwallpaper>((event, emit) async {
      emit(LoadingState());
      try {
        var trendingData = await repo!.getTrendingWallRepo();
        var data = WallpaperModel.fromJson(trendingData);
        emit(TrendingLoadedState(trendingWall: data));
      } catch (e) {
        print(e.toString());
        emit(ErrorState(errorMsg: e.toString()));
      }
    });

    on<GetSearchedWallpaper>((event, emit) async {
      emit(LoadingState());
      try {
        if(event.color == null){
          event.color = "";
        }
        var searchingData = await repo!.getSearchedWallRepo(
            search: event.search,color: event.color!);
        var data = WallpaperModel.fromJson(searchingData);
        emit(SearchedLoadedState(searchWall: data));
      } catch (e) {
        emit(ErrorState(errorMsg: e.toString()));
      }
    });
  }
}
