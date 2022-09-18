import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  static const route = "home";
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('Home Screen'),
      ),
      body: const Center(
         child: Text('HomeScreen'),
      ),
    );
  }
}