import 'package:flutter/material.dart';
import 'package:pet_finder/ui/utils/colors.dart';
import '../utils/utils.dart';

import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String _imageLogo = "assets/images/WhiteLogo.svg";
  final String _appLoginBackground = "assets/images/BackgroundLogin.svg";
  final String _faceLogo = "assets/images/FacebookIcon.svg";
  final String _googleLogo = "assets/images/GoogleIcon.svg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.25),
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
              Container(
                height: MediaQuery.of(context).size.height,
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.white[600],
                        labelText: "Password",
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
                          onPressed: () {},
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
                              Size(350, 60),
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
                    Row(children: <Widget>[
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
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
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Divider(
                              color: AppColors.grey[700],
                              height: 36,
                            )),
                      ),
                    ]),
                    SizedBox(
                      height: 20,
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
                          'Não tem uma conta?',
                          style: TextStyle(
                            color: AppColors.grey[700],
                          ),
                        ),
                        TextButton(
                          child: Text(
                            "Crie aqui",
                            style: TextStyle(color: AppColors.green),
                          ),
                          onPressed: () {},
                        )
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
  }
}
