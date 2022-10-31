
import 'dart:convert';

import 'package:fl_cliente_mediacion/models/ciudadano_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthServiceProvider extends ChangeNotifier{
  String _base_url = "api-mediacion.onrender.com";

Future<dynamic>  loginUser(String user, String pass)async{
    final Map<String, dynamic> authData = {
      "user": user.toString(),
      "password": pass.toString()
    };
    
    //final url = Uri.https(this._base_url, "/auth/login?user=32505430&password=123456");
    final url = Uri.https(this._base_url, "/auth/login");
   
    //final response = await http.post(url, body: json.encode(authData));
    final response = await http.post(url, body: authData);
    print(response.statusCode);

    
    //final Map<String, dynamic> responseDecoded = json.decode(response.body);
    final responseDecoded = json.decode(response.body);
    final dataCiudadano = CiudadanoModel.fromMap(responseDecoded);
   // print(dataCiudadano.apellido);
    return dataCiudadano;
  }

  registerUser(CiudadanoModel dataCiudadano) async{
    final url = Uri.https(this._base_url, "/ciudadanos");
    final response = await http.post(url, body: dataCiudadano.toMap());
    print(response.statusCode);
    // final dataDecoded = json.decode(response.body);
    // final dataFinal = CiudadanoModel.fromMap(dataDecoded);
    // return dataFinal;
    
    //final dataDecoded = json.decode(response.body)
    //final respData = CiudadanoModel.fromMap(json)

  }




}