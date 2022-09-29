import 'package:fl_cliente_mediacion/providers/theme_provider.dart';
import 'package:fl_cliente_mediacion/shared_prefences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
   
  const CardContainer({Key? key, required this.child}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final themeProvider = Provider.of<ThemeProvider>(context);
    Color cardColor = (Preferences.isDarkMode)? Colors.black: Colors.white;

    return Center(
      child: Container(
        width: size.width * 0.8,
        decoration: _cardDecoration(color: cardColor),
        child: this.child,
      ),
    );
  }

  BoxDecoration _cardDecoration({required Color color}) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
        boxShadow:const [
           BoxShadow(
          blurRadius: 15,
          color: Colors.black12,
          offset: Offset(0,5),
        )
        ]
      );
  }
}