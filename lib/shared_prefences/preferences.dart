
import 'package:shared_preferences/shared_preferences.dart';

class Preferences{

  //propiedades privadas y en el caso del constructor le coloco
  //late porque sera inicializado de manera asincrona
  static late SharedPreferences _prefs;

  static String _name = '';
  static bool _isDarkMode = false;
  static int _genero = 1;

  static Future init() async{
     _prefs = await SharedPreferences.getInstance();
  }

  static String get name{
    return _prefs.getString('name') ?? _name;
  }

  static set name(String value){
    _name = value;
    _prefs.setString('name', value);
  }

  static bool get isDarkMode{
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set isDarkMode(bool value){
    _isDarkMode = value;
    _prefs.setBool('isDarkMode', value);
  }

  static int get genero{
    return _prefs.getInt('genero') ?? _genero;
  }

  static set genero(int value){
    _genero = value;
    _prefs.setInt('genero', value);
  }


}