

import 'package:Newzz/models/newsArticle.dart';

class NewsArticleViewModel {
  
  NewsArticle _newsArticle;
  NewsArticleViewModel({NewsArticle article}) : _newsArticle = article;
  String get title {
    return _newsArticle.title;
  }
  String get desciption {
    return _newsArticle.decription;
  }
  String get imageURL {
    return _newsArticle.urlToImage;
  }
  String get url {
    return _newsArticle.url;
  }
}