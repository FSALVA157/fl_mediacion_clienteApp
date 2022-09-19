import 'package:flutter/material.dart';

class InputDecorations{

  static InputDecoration customInputDecoration({
    required String labelText,
    required String hint_text,
    IconData? prefixIcon
  }){
    return  InputDecoration(
            enabledBorder: const  UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff94273E)                  
              )
            ),
            focusedBorder:const  UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff94273E),
                width: 2
              )
            ),
            label: Text(labelText),
            hintText: hint_text,
            labelStyle: const TextStyle(
              color: Colors.grey
            ),
            prefixIcon: (prefixIcon != null)? Icon(prefixIcon, color: Color(0xff94273E),): null
            );
  }
}
