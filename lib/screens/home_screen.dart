
import 'package:fl_cliente_mediacion/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  static const route = "home";
  
  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
          toolbarHeight: 70,
          backgroundColor: Color(0xff94273E),
          centerTitle: true,
          title: const Icon(Icons.workspaces_filled, size: 50),
          leading: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.menu), color: Colors.white,),
          actions: [
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.notification_add, color: Colors.white,)
              )            
          ],
        ),
        body: const _SliverHome(),
      ),
    );
  }
}

class _SliverHome extends StatelessWidget {
  const _SliverHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double maximo = size.height  * 0.25;
    double minimo = size.height  * 0.10;

    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [                
        SliverPersistentHeader(
          delegate: _MySliverPersistenHeader(max: maximo, min: minimo),
          pinned: true,
          ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              color: Colors.amberAccent,
            ),
            Container(
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              color: Colors.redAccent,
            ),
            Container(
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              color: Colors.greenAccent,
            ),
                  Container(
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              color: Colors.amberAccent,
            ),
            Container(
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              color: Colors.redAccent,
            ),
            Container(
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              color: Colors.greenAccent,
            )
          ])
          )

      ],
    );
  }
}

class _MySliverPersistenHeader  extends SliverPersistentHeaderDelegate {
  //final Size size;
  final double max;
  final double min;

  _MySliverPersistenHeader({required this.max, required this.min}){
    // final this.max = size.height * 0.25;
    // final this.min = size.height * 0.10;
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final size = MediaQuery.of(context).size;
    final progress = shrinkOffset/maxExtent;

    return Material(
      color: Color(0xff94273E),
      //width: double.infinity,
      child: Stack(
        //fit: StackFit.expand,
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          _TituloAnimated(progress: progress,),
          Positioned(
            child: Transform.rotate(
              angle: vector.radians(360 * progress),
              child: _IconoAnimated(progress: progress),
              )
            ),
          
          Positioned(
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text('INICIAR TRAMITE', style: TextStyle(color: Colors.white),)))
          
        ],
      ),
      
    );
  }

  
    

  @override
  // TODO: implement maxExtent
  //double get maxExtent => this.max;
  double get maxExtent => 180;

  @override
  // TODO: implement minExtent
 // double get minExtent => this.min;
 double get minExtent => 120;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
  
}

class _TituloAnimated extends StatelessWidget {
final double progress;

  const _TituloAnimated({
    Key? key, required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final String nombre = loginProvider.correo;
    
    //print(nombre);
    return AnimatedContainer(
      duration:const Duration(milliseconds: 100),
       alignment: Alignment.lerp(
          Alignment.topCenter,
          Alignment.topLeft,
          progress),
        child: Text(
              'hola $nombre',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle.lerp(
                Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white, overflow: TextOverflow.clip),
                Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white, fontSize: 0),
                progress,
              ),
        ),
      
      );
  }
}

class _IconoAnimated extends StatelessWidget {
final double progress;

  const _IconoAnimated({
    Key? key, required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _currentImageSize = (120 * (1 - this.progress)).clamp(95, 120);
        //print(nombre);
    return AnimatedContainer(
      duration:const Duration(milliseconds: 100),
      margin: EdgeInsets.only(bottom: 20),
      width: _currentImageSize,
      height: _currentImageSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black38,
        image: new DecorationImage(
          image: AssetImage('assets/launch_cohete.png'),
          fit: BoxFit.fill
          ),
        //borderRadius: BorderRadius.circular(30)
      ), 
      // padding: EdgeInsets.lerp(
      //   EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      //    EdgeInsets.only(bottom: 2),
      //    progress 
      //   ),
        alignment: Alignment.lerp(
          Alignment.bottomCenter,
          Alignment.topCenter,
          progress),       
      
      );
  }
}