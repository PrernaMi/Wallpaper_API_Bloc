import 'package:task7_wallpaper/data/remote/api_helper.dart';
import 'package:task7_wallpaper/data/remote/api_urls.dart';

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

  Future<dynamic> getSearchedWallRepo(
      {required String search, String color = "",int mPage=1}) async {
    try {
      var data = await apiHelper.getApi(
          url: '${ApiUrls.search_url}?query=$search&color=$color&page=$mPage');
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
