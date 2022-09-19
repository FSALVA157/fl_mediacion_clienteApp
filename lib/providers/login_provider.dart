


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class LoginProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String correo = "";
  String password = "";



  bool isValidForm(){
    print('correo: $correo + pass: $password');
         return formKey.currentState?.validate() ?? false;
  }

}