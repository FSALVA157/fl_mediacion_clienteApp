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
              //color: Colors.grey
            ),
            prefixIcon: (prefixIcon != null)? Icon(prefixIcon, color: Color(0xff94273E),): null
            );    
  }


  static InputDecoration roundedInputDecoration({
    required String labelText,
    String? hint_text,
    IconData? prefixIcon
  }){
    return  InputDecoration(
          enabledBorder: const OutlineInputBorder(
               borderRadius: BorderRadius.all(Radius.circular(30)),
               borderSide:  BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
            ),
            focusedBorder:const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(
                  color: Colors.blueAccent,
                  width: 3.0,
                  style: BorderStyle.solid,
                     ),
                   ),
            //label: Text(labelText),
            labelText: labelText,
            hintText: (hint_text != null)? hint_text: null,
            labelStyle: const TextStyle(
              color: Colors.black
            ),
            //prefixIcon: (prefixIcon != null)? Icon(prefixIcon, color: Color(0xff94273E),): null
            );


  }

}
