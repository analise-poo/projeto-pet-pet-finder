import 'package:flutter/material.dart';
import '../utils/utils.dart';

import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  static String pageName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String appBarBackground = "assets/images/BackgroundAppBarHome.svg";

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
              child: SvgPicture.asset(appBarBackground),

              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage("assets/images/BackgroundAppBarHome.png"),
              //     fit: BoxFit.fill,
              //   ),
              // ),
            ),
            bottom: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
              child: Padding(
                padding: EdgeInsets.only(
                  right: 20,
                  left: 20,
                  bottom: 40,
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
                                size: 30,
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
                              height: 60,
                              width: 60,
                              child: Image.network(
                                'https://uifaces.co/our-content/donated/1H_7AxP0.jpg',
                              ),
                            )),
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
      );
    } else if (index == 1) {
      return Text('oi');
    } else if (index == 2) {
      return Text('oi');
    }
  }
}



// int _currentIndex = 0;

// class BottomBar extends StatefulWidget {
//   BottomBar({Key key}) : super(key: key);

//   @override
//   _BottomBarState createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: _currentIndex,
//       selectedItemColor: AppColors.green,
//       unselectedItemColor: AppColors.grey,
//       items: [
//         BottomNavigationBarItem(
//           label: 'Home',
//           icon: Icon(Icons.home),
//         ),
//         BottomNavigationBarItem(
//           label: 'Pesquisar',
//           icon: Icon(Icons.search),
//         ),
//         BottomNavigationBarItem(
//           label: 'Perfil',
//           icon: Icon(Icons.person),
//         ),
//       ],
//       onTap: (index) {
//         setState(() {
//           _currentIndex = index;
//           _buildBody(index);
//         });
//       },
//     );
//   }
// }
