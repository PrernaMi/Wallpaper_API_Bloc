abstract class BlocEvent{}

class GetSearchedWallpaper extends BlocEvent{
  String search;
  String? color ;
  int? page;
  GetSearchedWallpaper({required this.search,this.color,this.page});
}
class GetTrendingwallpaper extends BlocEvent{

}