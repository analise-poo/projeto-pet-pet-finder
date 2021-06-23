import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

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
      getPages: [
        GetPage(
          name: HomePage.pageName,
          page: () => HomePage(),
          binding: HomePageBinding(),
        ),
        GetPage(
          name: IncludePage.pageName,
          page: () => IncludePage(),
          binding: PostBinding(),
        ),
        GetPage(
          name: ProfilePage.pageName,
          page: () => ProfilePage(),
          binding: UserBinding(),
        ),
        GetPage(
          name: LoginPage.pageName,
          page: () => LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: SignUpPage.pageName,
          page: () => SignUpPage(),
          binding: RegisterBinding(),
        ),
        GetPage(
          name: PostDetails.pageName,
          page: () => PostDetails(),
          binding: PostBinding(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
