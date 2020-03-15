import 'package:Newzz/viewmodels/newsArticleViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsArticleDetailsPage extends StatelessWidget{
  
  final NewsArticleViewModel article;

  NewsArticleDetailsPage({this.article});

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: this.article.url,
      appBar: new AppBar(
        title: new Text("${this.article.title}"),
      ),
    );
  }
}