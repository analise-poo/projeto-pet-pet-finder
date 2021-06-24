import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_finder/state/get/getx_user_controller.dart';
import '../../utils/utils.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatefulWidget {
  static String pageName = '/profile';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String _appBarBackground = "assets/images/BackgroundAppBarHome.svg";
  final GetxUserController controller = Get.find<GetxUserController>();

  String _nameProfile;
  num _phoneProfile;
  String _emailProfile;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.value(controller.getUser()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return new Container(
            decoration: new BoxDecoration(color: AppColors.pink),
            child: Center(
              child: Text(
                'Carregando Perfil...',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.white,
                ),
              ),
            ),
          );
        } else {
          if (snapshot.hasError)
            return Center(
              child: Text(
                'Error!',
              ),
            );
          else
            return Center(
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(
                      MediaQuery.of(context).size.height * 0.17),
                  child: AppBar(
                    flexibleSpace: Container(
                      child: SvgPicture.asset(
                        _appBarBackground,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(
                          MediaQuery.of(context).size.height * 0.1),
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.05,
                          left: MediaQuery.of(context).size.width * 0.05,
                          bottom: MediaQuery.of(context).size.width * 0.1,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        ),
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                ),
                body: SingleChildScrollView(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Seu Perfil",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: AppColors.grey[900],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: Image.network(
                                    'https://uifaces.co/our-content/donated/1H_7AxP0.jpg',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.075,
                                width: MediaQuery.of(context).size.width * 0.85,
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
                                      size: MediaQuery.of(context).size.width *
                                          0.06,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: SizedBox(
                                        child: Text(
                                          snapshot.data['name'],
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.075,
                                width: MediaQuery.of(context).size.width * 0.85,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.white[600],
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.email,
                                      color: AppColors.green,
                                      size: MediaQuery.of(context).size.width *
                                          0.06,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: SizedBox(
                                        child: Text(
                                          snapshot.data['email'],
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.075,
                                width: MediaQuery.of(context).size.width * 0.85,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.white[600],
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.phone_android,
                                      color: AppColors.green,
                                      size: MediaQuery.of(context).size.width *
                                          0.06,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: SizedBox(
                                        child: Text(
                                          snapshot.data['phone'],
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('/update-profile');
                                },
                                child: Container(
                                  padding:
                                      EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                                  decoration: BoxDecoration(
                                    color: AppColors.green,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                  child: Text(
                                    'Editar Perfil',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}
