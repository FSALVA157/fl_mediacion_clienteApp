import 'package:fl_cliente_mediacion/providers/login_provider.dart';
import 'package:fl_cliente_mediacion/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),          
          lazy: false,
          )
      ],
      child: const MyApp(),
      );
  }
}

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