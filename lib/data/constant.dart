class Urls {
  static const String apiKey = '6bb1e0745f7c266629f56a6705908e0a';
  static const String baseurl = 'https://api.themoviedb.org/3/';
  static final getPopularMovie =
      'movie/popular?api_key=$apiKey&language=en-US&page=1';
  static final getNowPlaying =
      'movie/now_playing?api_key=$apiKey&language=en-US&page=1';
  static final getUpcoming =
      'movie/upcoming?api_key=$apiKey&language=en-US&page=1';
  static final tvPopular = "tv/popular?api_key=$apiKey&language=en-US&page=1";
  static final tvOnTheAir =
      "tv/on_the_air?api_key=$apiKey&language=en-US&page=1";
}
