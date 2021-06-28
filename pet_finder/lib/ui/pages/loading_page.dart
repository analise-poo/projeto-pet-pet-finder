import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_finder/ui/pages/home/home_page.dart';
import 'package:pet_finder/ui/pages/login/login.dart';
import '../utils/utils.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();

  static String pageName = '/loading';
}

class _LoadingPageState extends State<LoadingPage> {
  final String imageLogo = "assets/images/WhiteLogo.svg";

  Future<void> loading(BuildContext context) async {
    final FlutterSecureStorage storage = FlutterSecureStorage();

    await Future.delayed(Duration(seconds: 3), () {
      var token = storage.read(key: 'token');

      if (token == null) {
        Get.to(() => LoginPage(), binding: LoginBinding());
      } else {
        Navigator.of(context).pushReplacementNamed(HomePage.pageName);
      }
    });
  }

  Widget buildLoading() {
    return Container(
      color: AppColors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(imageLogo),
        ],
      ),
    );
  }

  Widget buildError() => Container(
        child: Center(
          child: Icon(
            Icons.error_outline,
            size: 48,
            color: Colors.red,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: loading(context),
      initialData: true,
      builder: (context, snapshot) {
        if (snapshot.hasError)
          return Container(
            child: Center(
              child: Text('Error'),
            ),
          );

        return buildLoading();
      },
    );
  }
}
