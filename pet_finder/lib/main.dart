import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pet_finder/ui/pages/home/home_.dart';
import 'package:pet_finder/ui/pages/login/login_binding.dart';
import 'package:pet_finder/ui/pages/post/include_page.dart';
import 'package:pet_finder/ui/pages/register/singup_binding.dart';
import 'package:pet_finder/ui/pages/post/post_binding.dart';
import 'package:pet_finder/ui/pages/user/user.dart';

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
          name: PetDetails.pageName,
          page: () => PetDetails(),
          binding: PostBinding(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
