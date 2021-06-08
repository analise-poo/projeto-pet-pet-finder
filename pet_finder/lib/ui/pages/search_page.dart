import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  static String pageName = 'search-page';

  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Search'),
    );
  }
}
