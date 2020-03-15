class Constants {
  static const String TOP_HEADLINES_URL = 
    "http://newsapi.org/v2/top-headlines?country=us&apiKey=6aba3f4ba4194489bd42b8fd3168203b";

  static String headlinesFor(String keyword) {
    return 
      "http://newsapi.org/v2/everything?q=$keyword&apiKey=6aba3f4ba4194489bd42b8fd3168203b";
  }
}
