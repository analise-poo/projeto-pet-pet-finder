import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  List _newLostPets = ['pet1', 'pet2', 'pet3', 'pet4', 'pet5'];

  List _todayLostPets = ['pet1', 'pet2', 'pet3', 'pet4', 'pet5', 'pet 6'];

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
            label: 'Pesquisar',
            icon: Icon(Icons.search),
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
    debugPrint("$index");

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
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _newLostPets.length,
                          itemBuilder: (context, index) {
                            return Padding(
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
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      child: ClipRRect(
                                        child: Image.network(
                                          'https://images.unsplash.com/photo-1583512603805-3cc6b41f3edb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Zezin do pagode',
                                        ),
                                        Text(
                                          'Pitbull',
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ],
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
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
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
      return SearchPage();
    } else if (index == 2) {
      return ProfilePage();
    }
  }
}
