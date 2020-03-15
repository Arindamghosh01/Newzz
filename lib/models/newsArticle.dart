class NewsArticle {

  final String title;
  final String decription;
  final String urlToImage;
  final String url;

  NewsArticle({this.title, this.decription, this.urlToImage, this.url});

  factory NewsArticle.fromJSON(Map<String, dynamic> json) {
    return NewsArticle(
      title: json["title"],
      decription: json["description"],
      urlToImage: json["urlToImage"],
      url: json["url"]
    );
  }
}