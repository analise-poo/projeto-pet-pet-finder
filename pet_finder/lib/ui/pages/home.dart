import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:pet_finder/state/get/getx_bottom_controller.dart';
import 'package:pet_finder/ui/pages/pages.dart';
import 'package:pet_finder/ui/utils/colors.dart';
import '../utils/utils.dart';

import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  static String pageName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _appBarBackground = "assets/images/BackgroundAppBarHome.svg";
  final GetxBottomController controller = Get.find<GetxBottomController>();

  List _nearlyLostPets = [
    {
      'name': "Billy",
      'breed': "BullDog",
      'photo':
          "https://images.unsplash.com/photo-1561754050-9a1ee0470c73?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80"
    },
    {
      'name': "Linux",
      'breed': "Golden Retrivier",
      'photo':
          "https://images.unsplash.com/photo-1592754862816-1a21a4ea2281?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80"
    },
    {
      'name': "Dora",
      'breed': "Yorkshire",
      'photo':
          "https://images.unsplash.com/photo-1591608971358-f93643d11763?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80"
    },
    {
      'name': "Pedroca",
      'breed': "Husky Siberiano",
      'photo':
          "https://images.unsplash.com/photo-1568572933382-74d440642117?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80"
    },
    {
      'name': "Pedroca",
      'breed': "Vira-lata",
      'photo':
          "https://images.unsplash.com/photo-1598991712061-3132295b5d7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=555&q=80"
    }
  ];

  List _todayLostPets = ['pet1', 'pet2', 'pet3', 'pet4', 'pet5'];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.green,
        unselectedItemColor: AppColors.grey,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Adicionar',
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: 'Perfil',
            icon: Icon(Icons.person),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _buildBody(index);
          });
        },
      ),
    );
  }

  Widget _buildBody(int index) {
    if (index == 0) {
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
                                Icons.room,
                                color: AppColors.green,
                                size: MediaQuery.of(context).size.width * 0.075,
                              ),
                              SizedBox(
                                child: Text(
                                  'Gleba Palhano',
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
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        children: [
                          Text(
                            "Pets que se perderam pertinho",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.grey[900],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.205,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _nearlyLostPets.length,
                          itemBuilder: (context, index) {
                            return new GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(1, 1),
                                          blurRadius: 2,
                                          spreadRadius: 0,
                                          color: AppColors.grey),
                                    ],
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.35,
                                        child: ClipRRect(
                                          child: Image.network(
                                            _nearlyLostPets[index]['photo'],
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _nearlyLostPets[index]
                                                      ['name'],
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _nearlyLostPets[index]
                                                      ['breed'],
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 40, left: 20, right: 20, bottom: 20),
                      child: Row(
                        children: [
                          Text(
                            "Pets que se perderam hoje",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.grey[900],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: GridView.builder(
                          physics: ScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  mainAxisSpacing: 20,
                                  maxCrossAxisExtent:
                                      MediaQuery.of(context).size.height *
                                          0.35),
                          itemCount: _nearlyLostPets.length,
                          itemBuilder: (context, index) {
                            return new GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(1, 1),
                                            blurRadius: 2,
                                            spreadRadius: 0,
                                            color: AppColors.grey),
                                      ]),
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.175,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        child: ClipRRect(
                                          child: Image.network(
                                            _nearlyLostPets[index]['photo'],
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _nearlyLostPets[index]
                                                      ['name'],
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  _nearlyLostPets[index]
                                                      ['breed'],
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    } else if (index == 1) {
      return IncludePage();
    } else if (index == 2) {
      return ProfilePage();
    }
  }
}
