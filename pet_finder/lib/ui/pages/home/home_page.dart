import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:pet_finder/state/get/getx_post_controller.dart';
import 'package:pet_finder/ui/pages/post/include_page.dart';
import 'package:pet_finder/ui/pages/post/post_details.dart';
import 'package:pet_finder/ui/pages/user/profile_page.dart';
import 'package:pet_finder/ui/utils/colors.dart';
import '../../utils/utils.dart';

import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  static String pageName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _appBarBackground = "assets/images/BackgroundAppBarHome.svg";
  final List _imageOfPets = [
    "https://images.unsplash.com/photo-1561754050-9a1ee0470c73?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80",
    "https://images.unsplash.com/photo-1592754862816-1a21a4ea2281?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
    "https://images.unsplash.com/photo-1568572933382-74d440642117?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80",
    "https://images.unsplash.com/photo-1598991712061-3132295b5d7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=555&q=80",
    "https://images.unsplash.com/photo-1561754050-9a1ee0470c73?ixid=MwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80",
    "https://images.unsplash.com/photo-1568572933382-74d440642117?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80",
    "https://images.unsplash.com/photo-1598991712061-3132295b5d7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=555&q=80",
    "https://images.unsplash.com/photo-1592754862816-1a21a4ea2281?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
    "https://images.unsplash.com/photo-1568572933382-74d440642117?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80",
  ];

  final GetxPostController controller = Get.find<GetxPostController>();

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
            label: 'Criar Postagem',
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
      return FutureBuilder<List>(
        future: Future.value(controller.details()),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              decoration: BoxDecoration(color: AppColors.green),
              child: Center(
                child: Text(
                  'Carregando...',
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
            else {
              var _itemCount;
              if (snapshot.data.length <= 4)
                _itemCount = snapshot.data.length;
              else
                _itemCount = 4;

              return Center(
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(
                        MediaQuery.of(context).size.height * 0.18),
                    child: AppBar(
                      automaticallyImplyLeading: false,
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
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.075,
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
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
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.075,
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.075,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.075,
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
                                        fontSize: 17,
                                        color: AppColors.grey[900],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.22,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: _itemCount,
                                    itemBuilder: (context, index) {
                                      return new GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => PostDetails(
                                                postId: snapshot.data[index]
                                                    ['id'],
                                              ),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 1),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: AppColors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: const Offset(1, 1),
                                                    blurRadius: 2,
                                                    spreadRadius: 0,
                                                    color: AppColors.grey),
                                              ],
                                            ),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.35,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.15,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.35,
                                                  child: ClipRRect(
                                                    child: Image.network(
                                                      _imageOfPets[index],
                                                      fit: BoxFit.cover,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            snapshot.data[index]
                                                                ['name'],
                                                            style: TextStyle(
                                                                fontSize: 16),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            snapshot.data[index]
                                                                ['breed'],
                                                            style: TextStyle(
                                                                fontSize: 12),
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
                                  top: 25,
                                  left: 20,
                                  right: 20,
                                  bottom: 20,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Pets que se perderam hoje",
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: AppColors.grey[800],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  child: GridView.builder(
                                    physics: ScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                      mainAxisSpacing: 20,
                                      maxCrossAxisExtent:
                                          MediaQuery.of(context).size.height *
                                              0.35,
                                    ),
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return new GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => PostDetails(
                                                postId: snapshot.data[index]
                                                    ['id'],
                                              ),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: AppColors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset:
                                                          const Offset(1, 1),
                                                      blurRadius: 2,
                                                      spreadRadius: 0,
                                                      color: AppColors.grey),
                                                ]),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.35,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.195,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.45,
                                                  child: ClipRRect(
                                                    child: Image.network(
                                                      // snapshot.data[index]
                                                      //     ['image'],
                                                      _imageOfPets[index],
                                                      fit: BoxFit.cover,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 5),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            snapshot.data[index]
                                                                ['name'],
                                                            style: TextStyle(
                                                                fontSize: 16),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            snapshot.data[index]
                                                                ['breed'],
                                                            style: TextStyle(
                                                                fontSize: 12),
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
                ),
              );
            }
          }
        },
      );
    } else if (index == 1) {
      return IncludePage();
    } else if (index == 2) {
      return ProfilePage();
    }
  }
}
