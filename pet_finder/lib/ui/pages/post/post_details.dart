import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:pet_finder/state/get/getx_post_controller.dart';
import 'package:pet_finder/ui/utils/colors.dart';
import '../../utils/utils.dart';

class PostDetails extends StatefulWidget {
  static String pageName = '/pet-details';
  final int postId;

  PostDetails({this.postId});

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  final GetxPostController controller = Get.find<GetxPostController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.value(controller.getPost(widget.postId)),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            decoration: BoxDecoration(color: AppColors.blue),
            child: Center(
              child: Text(
                'Carregando Postagem...',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.white,
                ),
              ),
            ),
          );
        } else {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erro, tente novamente!',
              ),
            );
          } else {
            var iconSexColor;
            if (snapshot.data['sex'] == 'Fêmea')
              iconSexColor = AppColors.pink;
            else
              iconSexColor = AppColors.blue;

            return Center(
              child: Scaffold(
                body: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://images.unsplash.com/photo-1568572933382-74d440642117?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=375&q=80',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 200),
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: AppColors.green,
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.white,
                                  ),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                    Size(60, 60),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data['name'],
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.pets,
                                      color: AppColors.green,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        snapshot.data['breed'],
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: AppColors.grey[600]),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        color: iconSexColor,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          snapshot.data['sex'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: AppColors.grey[600]),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Visto pela última vez:',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.grey[900],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.room,
                                  color: AppColors.green,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    snapshot.data['ls_address'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.grey[600]),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  color: AppColors.green,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    DateFormat(
                                      DateFormat.YEAR_MONTH_DAY,
                                      'pt_Br',
                                    ).format(
                                      DateTime.parse(
                                        snapshot.data['ls_datetime'],
                                      ),
                                    ),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.grey[600]),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.message,
                                  color: AppColors.green,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    snapshot.data['observation'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.grey[600]),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Dono:',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.grey[900],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.075,
                                  width: MediaQuery.of(context).size.height *
                                      0.075,
                                  child: CircleAvatar(
                                    radius: 38.0,
                                    foregroundImage: NetworkImage(
                                      'https://uifaces.co/our-content/donated/1H_7AxP0.jpg',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    snapshot.data['user']['name'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: AppColors.grey[600]),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.sms,
                                    color: Colors.white,
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      AppColors.purple,
                                    ),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                      Size(55, 55),
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Encontrei',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      AppColors.green,
                                    ),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                      Size(
                                        MediaQuery.of(context).size.width * 0.7,
                                        MediaQuery.of(context).size.height *
                                            0.1,
                                      ),
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        }
      },
    );
  }
}
