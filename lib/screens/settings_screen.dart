import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
   
  const SettingsScreen({Key? key}) : super(key: key);
  static const route = "settings";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
           centerTitle: true,
           title: const Text('Settings Screen'),
             ),
      body: const Center(
         child: Text('SettingsScreen'),
      ),
    );
  }
}