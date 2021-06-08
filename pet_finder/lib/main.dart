import 'package:flutter/material.dart';

import 'ui/ui.dart';
import 'ui/pages/pages.dart';

import 'screens/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      initialRoute: HomePage.pageName,
      routes: {
        '/': (context) => HomePage(),
        SearchPage.pageName: (context) => SearchPage(),
        ProfilePage.pageName: (context) => ProfilePage()
      },
      // home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
