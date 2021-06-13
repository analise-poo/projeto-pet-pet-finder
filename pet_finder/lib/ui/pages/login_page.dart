import 'package:flutter/material.dart';
import '../utils/utils.dart';

import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String _imageLogo = "assets/images/WhiteLogo.svg";
  final String _appLoginBackground = "assets/images/BackgroundLogin.svg";

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
      body: Container(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: ListView(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white[600],
                  labelText: "Email",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                    borderSide:
                        BorderSide(color: AppColors.white[600], width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: Colors.white, width: 0.5),
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
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: Colors.white, width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: Colors.white, width: 0.5),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 40,
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    child: Text(
                      "Recuperar Senha",
                      textAlign: TextAlign.right,
                    ),
                    onPressed: () {},
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration())
            ],
          )),
    );
  }
}
