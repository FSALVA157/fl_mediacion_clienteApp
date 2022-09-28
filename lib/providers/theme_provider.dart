

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  late ThemeData currentTheme;

  ThemeProvider({required bool isDarkMode}){
    if(isDarkMode){
       currentTheme = ThemeData.dark();
    }else{
      currentTheme = ThemeData.light();
    }
  }


  setDarkMode(){
    this.currentTheme = ThemeData.dark();
    notifyListeners();
  }

  setLightMode(){
    this.currentTheme = ThemeData.light();
    notifyListeners();
  }



}