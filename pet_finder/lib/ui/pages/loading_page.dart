import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/utils.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();

  static String pageName = '/loading';
}

class _LoadingPageState extends State<LoadingPage> {
  final String imageLogo = "assets/images/WhiteLogo.svg";
  @override
  Widget build(BuildContext context) {
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
}
