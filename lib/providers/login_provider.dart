import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class LoginProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String _correo = "";
  String _password = "";

  String get correo => correo;
  set correo(String value){
    this._correo = value;
  }

  String get password => _password;
  set password(String value){
    this._password = value;
  }

  bool isValidForm(){
    print('correo: $_correo + pass: $_password');
         return formKey.currentState?.validate() ?? false;
  }

}