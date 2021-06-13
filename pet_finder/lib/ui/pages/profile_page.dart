import 'package:flutter/material.dart';
import '../utils/utils.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  static String pageName = 'profile-page';

  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String _appBarBackground = "assets/images/BackgroundAppBarHome.svg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
        child: AppBar(
          flexibleSpace: Container(
            child: SvgPicture.asset(
              _appBarBackground,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
            child: Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.05,
                left: MediaQuery.of(context).size.width * 0.05,
                bottom: MediaQuery.of(context).size.width * 0.1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.075,
                        width: MediaQuery.of(context).size.width * 0.7,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.white[600],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: AppColors.green,
                              size: MediaQuery.of(context).size.width * 0.075,
                            ),
                            SizedBox(
                              child: Text(
                                'Lucas Magalhães Brest',
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.075,
                          width: MediaQuery.of(context).size.height * 0.075,
                          child: Image.network(
                            'https://uifaces.co/our-content/donated/1H_7AxP0.jpg',
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(),
        ),
      ),
    );
  }
}
