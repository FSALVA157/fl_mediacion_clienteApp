import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class LoginProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String _dni = "";
  String _password = "";

  String _nombre = "";
  
  String get nombre => _nombre;

  set nombre(String value){
    this._nombre = value;
    notifyListeners();
  }

  String get dni => _dni;

  set dni(String value){
    this._dni = value;
  }

  String get password => _password;
  set password(String value){
    this._password = value;
  }

  bool isValidForm(){
             return formKey.currentState?.validate() ?? false;
  }

}