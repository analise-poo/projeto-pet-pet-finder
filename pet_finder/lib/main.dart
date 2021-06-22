import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pet_finder/ui/pages/login/login_binding.dart';

import 'ui/pages/bindings/home_page_binding.dart';
import 'ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pet Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      initialRoute: LoginPage.pageName,
      // routes: {
      //   '/': (context) => HomePage(),
      //   IncludePage.pageName: (context) => IncludePage(),
      //   ProfilePage.pageName: (context) => ProfilePage(),
      //   LoginPage.pageName: (context) => LoginPage(),
      //   SignUpPage.pageName: (context) => SignUpPage()
      // },
      getPages: [
        GetPage(
          name: HomePage.pageName,
          page: () => HomePage(),
          binding: HomePageBinding(),
        ),
        GetPage(
          name: IncludePage.pageName,
          page: () => IncludePage(),
        ),
        GetPage(
          name: ProfilePage.pageName,
          page: () => ProfilePage(),
        ),
        GetPage(
          name: LoginPage.pageName,
          page: () => LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: SignUpPage.pageName,
          page: () => SignUpPage(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
