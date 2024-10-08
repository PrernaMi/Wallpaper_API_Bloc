import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task7_wallpaper/bloc/wall_events.dart';
import 'package:task7_wallpaper/bloc/wall_states.dart';
import 'package:task7_wallpaper/model/wallpaper_model.dart';

import '../data/repos/wallpaper_repo.dart';

class WallPaperBloc extends Bloc<BlocEvent,BlocState>{
  WallpaperRepo? repo;

  WallPaperBloc({required this.repo}) : super(InitialState()) {
    on<GetTrendingwallpaper>((event, emit) async {
      emit(LoadingState());
      try {
        var trendingData = await repo!.getTrendingWallRepo();
        var data = WallpaperModel.fromJson(trendingData);
        emit(LoadedState(trendingWall: data));
      } catch (e) {
        emit(ErrorState(errorMsg: e.toString()));
      }
    });

  }
}
