import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:intl/intl.dart';
import 'package:pet_finder/models/post_model.dart';
import 'package:pet_finder/state/get/getx_post_controller.dart';
import 'package:pet_finder/state/get/getx_user_controller.dart';
import 'package:pet_finder/ui/utils/colors.dart';
import '../../utils/utils.dart';

import 'package:flutter_svg/flutter_svg.dart';

class IncludePage extends StatefulWidget {
  static String pageName = 'include-page';

  IncludePage({Key key}) : super(key: key);

  @override
  _IncludePageState createState() => _IncludePageState();
}

class _IncludePageState extends State<IncludePage> {
  final String _appBarBackground = "assets/images/BackgroundAppBarHome.svg";

  final _formKey = GlobalKey<FormState>();

  final GetxPostController controller = Get.find<GetxPostController>();
  final GetxUserController userController = Get.find<GetxUserController>();

  final _picker = ImagePicker();

  String _image;
  String _name;
  String _breed;
  String _sex;
  String _lsAddress;
  DateTime _lsDateTime = DateTime.now();
  String _observation;

  void createPost() async {
    if (_formKey.currentState.validate()) {
      await controller
          .createPost(PostModel(
              image: _image,
              name: _name,
              breed: _breed,
              sex: _sex,
              lsAddress: _lsAddress,
              lsDateTime: _lsDateTime,
              observation: _observation,
              userId: await userController.getCurrentUserId()))
          .then((value) {
        Navigator.of(context).pushNamed('/');
        Get.snackbar(
          'Sucesso',
          'Postagem criada!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
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
      _image = _pickedFile.path;
    });
  }

  Future<void> selectDate(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    final DateTime picked = await showDatePicker(
        context: context,
        locale: Locale('pt', 'BR'),
        initialDate: _lsDateTime,
        firstDate: DateTime(2021),
        lastDate: DateTime(2100));
    if (picked != null && picked != _lsDateTime) {
      setState(() {
        _lsDateTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.18),
        child: AppBar(
          automaticallyImplyLeading: false,
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Nova Postagem",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 8,
                        ),
                      ],
                      fontSize: 30,
                      color: AppColors.white,
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
        physics: ScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Container(
                  height: MediaQuery.of(context).size.height,
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: getImage,
                            icon: Icon(Icons.camera_alt),
                            label: Text(
                              'Selecionar Imagem do Pet',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.purple,
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                Size(
                                  MediaQuery.of(context).size.width * 0.1,
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
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.white[600],
                          labelText: "Nome do Pet",
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
                            _name = text;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.white[600],
                          labelText: "Raça",
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
                            _breed = text;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DropDownFormField(
                        value: _sex,
                        titleText: 'Sexo',
                        hintText: 'Selecione o sexo',
                        textField: 'display',
                        valueField: 'value',
                        dataSource: [
                          {"display": "Macho", "value": "Macho"},
                          {"display": "Fêmea", "value": "Fêmea"},
                        ],
                        onChanged: (value) {
                          FocusScope.of(context).requestFocus(FocusNode());
                          setState(() {
                            _sex = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.white[600],
                          labelText: "Local",
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
                            _lsAddress = text;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.088,
                            width: MediaQuery.of(context).size.width * 0.88,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: AppColors.white[600],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Data: ' +
                                      DateFormat(
                                        DateFormat.YEAR_MONTH_DAY,
                                        'pt_Br',
                                      ).format(_lsDateTime),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                  child: Icon(
                                    Icons.calendar_today,
                                    color: AppColors.white,
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      AppColors.blue,
                                    ),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                      Size(
                                        MediaQuery.of(context).size.width *
                                            0.08,
                                        MediaQuery.of(context).size.height *
                                            0.08,
                                      ),
                                    ),
                                  ),
                                  onPressed: () => selectDate(context),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.white[600],
                          labelText: "Observações",
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
                            _observation = text;
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
                              'Postar',
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
}
