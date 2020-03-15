import 'package:Newzz/pages/newsListPage.dart';
import 'package:Newzz/viewmodels/newsArticleListViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Newzz",
      home: ChangeNotifierProvider(
        create: (context) => NewsArticleListViewModel(),
        child: NewsListPage(),
      )
    );
  }
}