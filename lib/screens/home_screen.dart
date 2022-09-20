import 'package:fl_cliente_mediacion/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          title: Icon(Icons.workspaces_filled, size: 50),
          leading: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.menu), color: Colors.white,),
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.notification_add, color: Colors.white,)
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

    return Container(
      color: Color(0xff94273E),
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
             bottom: 70,
            // right: 30,
            child: IconButton(onPressed: (){}, icon: Icon(Icons.add_location_rounded, size: max * 0.6), color:Colors.white),
          ),
          // Positioned(
          //    bottom: 70,
          //    left: 30,
          //   //right: 1,
          //   child: IconButton(onPressed: (){}, icon: Icon(Icons.add_location_rounded, size: max * 0.6), color:Colors.white),
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.center,

            //   children: [
            //     //Container(margin: EdgeInsets.symmetric(horizontal: 30), child: IconButton(onPressed: (){}, icon: Icon(Icons.add_location_rounded, size: max * 0.6), color:Colors.white)),
            //     Container(margin: EdgeInsets.symmetric(horizontal: 30), child: IconButton(onPressed: (){}, icon: Icon(Icons.add_location_rounded, size: max * 0.6), color:Colors.white)),
            //     Container(margin: EdgeInsets.symmetric(horizontal: 30), child: IconButton(onPressed: (){}, icon: Icon(Icons.add_location_rounded, size: max * 0.6), color:Colors.white))
            //   ],
            // ),
            // child: ClipOval(
            //   child: Container(
            //     color: Colors.white,
            //     height: 50,
            //     width: 50,
            //     ),
            // )
          //  )
        ],
      ),
      // child: Column(
      //   children: [
      //     Text('Bienvenido: ${loginProvider.correo}'),
      //   ],
      // ),
    );
  }

  
    

  @override
  // TODO: implement maxExtent
  //double get maxExtent => this.max;
  double get maxExtent => 200;

  @override
  // TODO: implement minExtent
 // double get minExtent => this.min;
 double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
  
}