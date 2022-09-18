import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
   
  const CardContainer({Key? key, required this.child}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: size.width * 0.8,
        decoration: _cardDecoration(),
        child: this.child,
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
        color: Colors.white,
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