import 'package:task7_wallpaper/data/remote/api_helper.dart';
import 'package:task7_wallpaper/utils/api_urls.dart';

import '../../model/wallpaper_model.dart';

class WallpaperRepo {
  ApiHelper apiHelper;

  WallpaperRepo({required this.apiHelper});

  Future<dynamic> getTrendingWallRepo() async {
    try {
      var data = await apiHelper.getApi(url: ApiUrls.trending_url);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  // Future<dynamic> getSearchedWallRepo({required String search})async{
  //   try{
  //     ApiUrls apiUrl = ApiUrls(search: search);
  //     var data = await apiHelper.getApi(url: apiUrl.search_url);
  //     return data;
  //   }catch(e){
  //     rethrow;
  //   }
  // }
}
