
import 'package:fl_cliente_mediacion/screens/home_screen.dart';
import 'package:fl_cliente_mediacion/screens/screens.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
   
  const SideMenu({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
        children: [
          _MyDrawerHeader(),
          ListTile(
          leading: const Icon(Icons.home_filled),
          title: const Text('Home'),
          onTap: (){
            Navigator.of(context).pushReplacementNamed(HomeScreen.route);
          },
        ),
        ListTile(
          leading: const Icon(Icons.build),
          title: const Text('Settings'),
          onTap: (){
            Navigator.of(context).pushReplacementNamed(SettingsScreen.route);
          },
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('People'),
          onTap: (){},
        )
        ],        
      ),
    );
  }
}

class _MyDrawerHeader extends StatelessWidget {
  const _MyDrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: const BoxDecoration(
        image: DecorationImage(
           image: AssetImage('assets/bandera_salta.jpg'),
           fit: BoxFit.cover
           )
      ),
      );
  }
}