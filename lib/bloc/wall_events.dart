abstract class BlocEvent{}

class GetSearchedWallpaper extends BlocEvent{
  String search;
  String? color ;
  GetSearchedWallpaper({required this.search,this.color});
}
class GetTrendingwallpaper extends BlocEvent{

}