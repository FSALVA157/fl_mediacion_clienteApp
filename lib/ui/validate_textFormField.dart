import 'package:flutter/material.dart';

class ValidateTExtFormField{

  static String? validateEmail(value){
      String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'; 
      RegExp regExp  = new RegExp(pattern);
      return regExp.hasMatch(value ?? '')? null : "el correo no es válido";
  }

  static String? validatePassword(value){
      return (value != null && value.length>5)? null: "la clave es obligatoria";
  }

}