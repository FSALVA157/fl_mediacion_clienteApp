import 'package:fl_cliente_mediacion/providers/theme_provider.dart';
import 'package:fl_cliente_mediacion/shared_prefences/preferences.dart';
import 'package:fl_cliente_mediacion/ui/input_decorations.dart';
import 'package:fl_cliente_mediacion/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
   
  const SettingsScreen({Key? key}) : super(key: key);
  static const route = "settings";

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      drawer: SideMenu(),
       appBar: AppBar(
           centerTitle: true,
           title: const Text('Settings Screen'),
             ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
        child: SingleChildScrollView(
          //controller: controller,
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children:  [                
               const Text('Ajustes', style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300), textAlign: TextAlign.center,),
               const Divider(),
               SwitchListTile.adaptive(
                title: const Text('DarkMode', style: TextStyle(fontWeight: FontWeight.bold),),
                value: Preferences.isDarkMode,
                 onChanged: (value){
                  setState(() {
                    Preferences.isDarkMode = value;
                    value? themeProvider.setDarkMode(): themeProvider.setLightMode();
                  });
                 }
                 ),
                 const Divider(),
                 RadioListTile<int>(
                  title: const Text('Femenino', style: TextStyle(fontWeight: FontWeight.bold),),
                  value: 1,
                  groupValue: Preferences.genero,
                  onChanged: (value){
                    setState(() {
                      Preferences.genero = value ?? 1;
                    });
                  }
                  ),
                  RadioListTile<int>(
                  title: const Text('Masculino', style: TextStyle(fontWeight: FontWeight.bold),),
                  value: 2,
                  groupValue: Preferences.genero,
                  onChanged: (value){
                    Preferences.genero = value ?? 2;
                  }
                  ),
                   TextFormField(
                      initialValue: Preferences.name,
                          decoration: InputDecorations.customInputDecoration(
                            labelText: "nombre",
                            hint_text: "nombre del usuario"),
                          onChanged: (value){
                                setState(() {
                                  Preferences.name = value;
                                  
                                });
                            },
                  )
            ],
          ),
        ),
      ),
    );
  }
}