import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_finder/models/login_model.dart';
import 'package:pet_finder/state/get/getx_login_controller.dart';
import 'package:pet_finder/ui/pages/home/home.dart';
import 'package:pet_finder/ui/utils/colors.dart';
import '../../utils/utils.dart';

import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();

  static String pageName = '/login';
}

class _LoginPageState extends State<LoginPage> {
  String _imageLogo = "assets/images/WhiteLogo.svg";
  String _appLoginBackground = "assets/images/BackgroundLogin.svg";
  String _faceLogo = "assets/images/FacebookIcon.svg";
  String _googleLogo = "assets/images/GoogleIcon.svg";

  final _formKey = GlobalKey<FormState>();

  final GetxLoginController controller = Get.find<GetxLoginController>();

  String _emailLogin;
  String _passwordLogin;

  bool isObscure = true;

  void toogleVisible() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  void login() async {
    if (_formKey.currentState.validate()) {
      await controller
          .login(LoginModel(password: _passwordLogin, email: _emailLogin))
          .then((value) {
        Get.to(() => HomePage(), binding: HomePageBinding());
      }).onError((error, stackTrace) {
        print(error);
        Get.snackbar(
          'Erro',
          'Verifique seus dados!',
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
            Size.fromHeight(MediaQuery.of(context).size.height * 0.273),
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
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.width * 0.15,
              ),
              child: SvgPicture.asset(
                _imageLogo,
                width: 120,
                height: 120,
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
                  height: MediaQuery.of(context).size.height * 0.85,
                  padding: EdgeInsets.only(
                    top: 40,
                    left: 20,
                    right: 20,
                  ),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
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
                            _emailLogin = text;
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
                            _passwordLogin = text;
                          });
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: Text(
                              "Esqueceu sua senha?",
                              style: TextStyle(color: AppColors.grey[700]),
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: login,
                            child: Text(
                              'Entrar',
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
                      Row(
                        children: <Widget>[
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
                        ],
                      ),
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Não tem uma conta? ',
                            style: TextStyle(
                              color: AppColors.grey[700],
                            ),
                          ),
                          TextButton(
                            child: Text(
                              "Crie aqui",
                              style: TextStyle(color: AppColors.green),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/signup');
                            },
                          )
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
