import 'package:Newzz/pages/newsArticleDetails.dart';
import 'package:Newzz/viewmodels/newsArticleListViewModel.dart';
import 'package:Newzz/viewmodels/newsArticleViewModel.dart';
import 'package:Newzz/widgets/newsList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context,listen: false).populateTopHeadlines();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _controller.dispose();
    super.dispose();
  }

  Widget _buildList(BuildContext context, NewsArticleListViewModel vm) {
    switch(vm.loadingStatus) {
      case LoadingStatus.searching :
        return Align(child: Center(child: CircularProgressIndicator()));

      case LoadingStatus.empty : 
        return Align(child: Center(child: Text("No result found !!")));

      case LoadingStatus.completed :
        return Expanded(child: NewsList(
          articles: vm.articles,
          onSelected: (article) {
            _showNewsArticleDetails(context, article);
          },
        ));
    }
  }

  void _showNewsArticleDetails(BuildContext context, NewsArticleViewModel article) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => NewsArticleDetailsPage(article: article),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Newzz"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            onSubmitted: (value) {
              //fetch all the news related to the searched keyword
              if(value.isNotEmpty) {
                vm.search(value);
              }
            },
            decoration: InputDecoration(
              labelText: "Enter search term",
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear), 
                onPressed: () {
                  vm.populateTopHeadlines();
                  _controller.clear();
                }
              )
            ),
          ),
          _buildList(context, vm)
          // Expanded(child: NewsList(articles: vm.articles))
        ],
      ),
    );
  }
}