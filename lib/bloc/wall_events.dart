abstract class BlocEvent{}

class GetSeachedWallpaper extends BlocEvent{
  String search;
  GetSeachedWallpaper({required this.search});
}
class GetTrendingwallpaper extends BlocEvent{

}