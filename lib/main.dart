import 'package:fl_cliente_mediacion/providers/login_provider.dart';
import 'package:fl_cliente_mediacion/providers/theme_provider.dart';
import 'package:fl_cliente_mediacion/screens/screens.dart';
import 'package:fl_cliente_mediacion/shared_prefences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  
  runApp(const AppState());
}  
  

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),          
          lazy: false,
          ),
        ChangeNotifierProvider(
          create: (context)=>ThemeProvider(isDarkMode: Preferences.isDarkMode),)
      ],
      child: const MyApp(),
      );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      theme: themeProvider.currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: RegisterScreen.route,
      routes:{
        HomeScreen.route: (context) => const HomeScreen(),
        SettingsScreen.route:(context) => const SettingsScreen(),
        LoginScreen.route:(context) => const LoginScreen(),
        RegisterScreen.route: (context)=> const RegisterScreen()
      },
 
    );
  }
}