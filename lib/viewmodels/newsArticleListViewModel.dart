import 'package:Newzz/models/newsArticle.dart';
import 'package:Newzz/services/webservice.dart';
import 'package:Newzz/viewmodels/newsArticleViewModel.dart';
import 'package:flutter/cupertino.dart';

enum LoadingStatus {
  completed,
  searching,
  empty
}

class NewsArticleListViewModel extends ChangeNotifier {

  var loadingStatus = LoadingStatus.searching;

  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  Future<void> populateTopHeadlines() async {
    this.loadingStatus = LoadingStatus.searching;
    // notifyListeners();
    List<NewsArticle> newsArticle = await Webservice().fetchTopHeadlines();
    this.articles = newsArticle.map((article) => NewsArticleViewModel(article: article)).toList();
    this.loadingStatus = this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  Future<void> search(String keyword) async {
    this.loadingStatus = LoadingStatus.searching;
    List<NewsArticle> newsArticles =  await Webservice().fetchHeadlinesByKeyword(keyword);
    this.articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();
    this.loadingStatus = this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

}