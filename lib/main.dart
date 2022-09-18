import 'package:fl_cliente_mediacion/screens/screens.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: LoginScreen.route,
      routes:{
        HomeScreen.route: (context) => const HomeScreen(),
        SettingsScreen.route:(context) => const SettingsScreen(),
        LoginScreen.route:(context) => const LoginScreen()
      },
 
    );
  }
}