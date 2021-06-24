import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_finder/models/register_model.dart';
import 'package:pet_finder/state/get/getx_register_controller.dart';
import 'package:pet_finder/ui/pages/login/login_binding.dart';
import 'package:pet_finder/ui/pages/login/login_page.dart';

import 'package:pet_finder/ui/utils/colors.dart';
import '../../utils/utils.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);
  static String pageName = '/signup';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  final String _imageLogo = "assets/images/WhiteLogo.svg";
  final String _appLoginBackground = "assets/images/BackgroundLogin.svg";
  final String _faceLogo = "assets/images/FacebookIcon.svg";
  final String _googleLogo = "assets/images/GoogleIcon.svg";

  final _formKey = GlobalKey<FormState>();

  final GetxRegisterController controller = Get.find<GetxRegisterController>();

  String _nameRegister;
  String _phoneRegister;
  String _emailRegister;
  String _passwordRegister;

  bool isObscure = true;

  void toogleVisible() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  void register() async {
    if (_formKey.currentState.validate()) {
      await controller
          .register(RegisterModel(
              name: _nameRegister,
              phone: _phoneRegister,
              email: _emailRegister,
              password: _passwordRegister))
          .then((value) {
        Get.to(() => LoginPage(), binding: LoginBinding());
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.272),
        child: AppBar(
          flexibleSpace: Container(
            child: SvgPicture.asset(
              _appLoginBackground,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.green,
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                        Size(60, 60),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.width * 0.15,
                      left: MediaQuery.of(context).size.width * 0.13,
                    ),
                    child: SvgPicture.asset(
                      _imageLogo,
                      width: 120,
                      height: 120,
                    ),
                  ),
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
              Form(
                key: _formKey,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.90,
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
                      TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.white[600],
                          labelText: "Nome",
                          labelStyle: TextStyle(color: AppColors.grey[700]),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                            borderSide: BorderSide(
                                color: AppColors.white[600], width: 0.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                          ),
                        ),
                        onChanged: (text) {
                          setState(() {
                            _nameRegister = text;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.white[600],
                          labelText: "Celular",
                          labelStyle: TextStyle(color: AppColors.grey[700]),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                          ),
                        ),
                        onChanged: (text) {
                          setState(() {
                            _phoneRegister = text;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.white[600],
                          labelText: "Email",
                          labelStyle: TextStyle(color: AppColors.grey[700]),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                          ),
                        ),
                        onChanged: (text) {
                          setState(() {
                            _emailRegister = text;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isObscure,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.white[600],
                          labelText: "Senha",
                          labelStyle: TextStyle(color: AppColors.grey[700]),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.visibility),
                            onPressed: toogleVisible,
                            autofocus: isObscure,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.5),
                          ),
                        ),
                        onChanged: (text) {
                          setState(() {
                            _passwordRegister = text;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: register,
                            child: Text(
                              'Cadastrar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.green,
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                Size(
                                  MediaQuery.of(context).size.width * 0.888,
                                  MediaQuery.of(context).size.height * 0.1,
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
                      SizedBox(
                        height: 10,
                      ),
                      Row(children: <Widget>[
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              child: Divider(
                                color: AppColors.grey[700],
                                height: 50,
                              )),
                        ),
                        Text(
                          "ou",
                          style: TextStyle(
                            color: AppColors.grey[700],
                          ),
                        ),
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              child: Divider(
                                color: AppColors.grey[700],
                                height: 36,
                              )),
                        ),
                      ]),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Center(
                              child: SvgPicture.asset(_faceLogo),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                Size(100, 60),
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Center(
                              child: SvgPicture.asset(_googleLogo),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                Size(100, 60),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
