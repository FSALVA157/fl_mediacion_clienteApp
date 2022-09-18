import 'package:flutter/material.dart';

class BackgroundLogin extends StatelessWidget {
  final Widget child;   
  const BackgroundLogin({Key? key, required this.child}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.grey[300],
          width: double.infinity,
          height: double.infinity,
          child: Stack(
                    children:  [
                      Cinta1(),
                      Cinta2(),
                      Logo(),
                      this.child          
                    ],
          ),
        )),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: double.infinity,
      height: 100,
       child: const Center(                            
         child: ClipOval(
              child: Image(
              fit: BoxFit.fill,
            image: AssetImage(
            'assets/mediacion_logo.png'
            )),
         ),
       )
    );
  }
}

class Cinta2 extends StatelessWidget {
  const Cinta2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
    right: 0,
    bottom: 0,
    child: Image(
      image: AssetImage('assets/cinta_sin_fondo_2.png'),
    )
    );
  }
}

class Cinta1 extends StatelessWidget {
  const Cinta1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      left: 0,
      top: 0,
      child: Image(
        image: AssetImage('assets/cinta_sin_fondo_1.png'),
      )
      );
  }
}