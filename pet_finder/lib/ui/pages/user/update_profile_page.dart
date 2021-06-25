import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pet_finder/models/user_model.dart';
import 'package:pet_finder/state/get/getx_user_controller.dart';
import 'package:pet_finder/ui/pages/home/home_page.dart';
import 'package:pet_finder/ui/utils/colors.dart';

import '../../utils/utils.dart';

class UpdateProfilePage extends StatefulWidget {
  static String pageName = '/update-profile';

  UpdateProfilePage({Key key}) : super(key: key);

  @override
  _UpdateProfilePage createState() => _UpdateProfilePage();
}

class _UpdateProfilePage extends State<UpdateProfilePage> {
  final String _appBarBackground = "assets/images/BackgroundAppBarHome.svg";

  final _formKey = GlobalKey<FormState>();

  final GetxUserController controller = Get.find<GetxUserController>();

  final _picker = ImagePicker();

  String _avatar;
  String _name;
  int _phone;
  String _email;

  void createPost() async {
    if (_formKey.currentState.validate()) {
      await controller
          .updateUserProfile(UserModel(
              avatar: _avatar, name: _name, phone: _phone, email: _email))
          .then((value) {
        Navigator.of(context).pushReplacementNamed(HomePage.pageName);
      }).onError((error, stackTrace) {
        print(error);
        Get.snackbar(
          'Erro',
          'Dados inválidos!',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    }
  }

  Future getImage() async {
    final _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _avatar = _pickedFile.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.value(controller.getUser()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            decoration: BoxDecoration(color: AppColors.pink),
            child: Center(
              child: Text(
                'Carregando Formulário...',
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
                'Erro, tente novamente!',
              ),
            );
          else
            return Scaffold(
              appBar: PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuery.of(context).size.height * 0.18),
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
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              ),
              body: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: SafeArea(
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.75,
                          padding: EdgeInsets.only(
                            top: 20,
                            left: 20,
                            right: 20,
                          ),
                          child: ListView(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: getImage,
                                    icon: Icon(Icons.camera_alt),
                                    label: Text(
                                      'Selecionar Avatar',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        AppColors.purple,
                                      ),
                                      minimumSize:
                                          MaterialStateProperty.all<Size>(
                                        Size(
                                          MediaQuery.of(context).size.width *
                                              0.1,
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                        ),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.name,
                                initialValue: snapshot.data['name'],
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.white[600],
                                  labelText: "Nome",
                                  labelStyle: TextStyle(
                                    color: AppColors.grey[700],
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: AppColors.white[600],
                                        width: 0.5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0.5),
                                  ),
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    _name = text;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                initialValue: snapshot.data['email'],
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.white[600],
                                  labelText: "Email",
                                  labelStyle:
                                      TextStyle(color: AppColors.grey[700]),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0.5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0.5),
                                  ),
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    _email = text;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.phone,
                                initialValue: snapshot.data['phone'],
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.white[600],
                                  labelText: "Telefone",
                                  labelStyle:
                                      TextStyle(color: AppColors.grey[700]),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0.5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0.5),
                                  ),
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    _phone = int.parse(text);
                                  });
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: createPost,
                                    child: Text(
                                      'Salvar',
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
                                          MediaQuery.of(context).size.width *
                                              0.888,
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                        ),
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}
