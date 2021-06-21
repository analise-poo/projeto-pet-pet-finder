import 'package:flutter/material.dart';

import 'ui/pages/pages.dart';

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
        '/': (context) => PetDetails(),
        IncludePage.pageName: (context) => IncludePage(),
        ProfilePage.pageName: (context) => ProfilePage(),
        LoginPage.pageName: (context) => LoginPage(),
        SignUpPage.pageName: (context) => SignUpPage()
      },
      // home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
