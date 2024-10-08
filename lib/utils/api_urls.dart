class ApiUrls{
  String search;
  ApiUrls({required this.search});
   static final String base_url = "https://api.pexels.com/v1/";
    String search_url = '${base_url}search';
   static final String trending_url = '${base_url}curated';
}