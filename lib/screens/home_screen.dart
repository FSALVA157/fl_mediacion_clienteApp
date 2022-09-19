import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  static const route = "home";
  
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: _SliverHome(),
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
    
    return Container(
          color: Colors.black,
    );
  }

  
    

  @override
  // TODO: implement maxExtent
  double get maxExtent => this.max;

  @override
  // TODO: implement minExtent
  double get minExtent => this.min;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
  
}