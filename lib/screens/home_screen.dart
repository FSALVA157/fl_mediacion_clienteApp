
import 'package:fl_cliente_mediacion/providers/login_provider.dart';
import 'package:fl_cliente_mediacion/ui/input_decorations.dart';
import 'package:flutter/material.dart';

import 'package:fl_cliente_mediacion/widget/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  static const route = "home";
  
  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Scaffold(
        drawer: SideMenu(),
        appBar: _appBarFijo(),
        body: const _SliverHome(),
      ),
    );
  }

  AppBar _appBarFijo() {
    return AppBar(
        elevation: 0,
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
        toolbarHeight: 70,
        backgroundColor: Color(0xff94273E),
        centerTitle: true,
        //title: const Icon(Icons.workspaces_filled, size: 50),
        title: const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.black,
          backgroundImage: AssetImage('assets/logo_m.png'),
        ),
        // leading: IconButton(
        //   onPressed: (){},
        //   icon: const Icon(Icons.menu), color: Colors.white,),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.notification_add, color: Colors.white,)
            )            
        ],
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
             ExpansionPanelList.radio(
               animationDuration: Duration(milliseconds: 500),
              expandedHeaderPadding: EdgeInsets.all(10),
              elevation: 3,
              children: [
                _expansionPanelEdition(),
                _expansionPanelEstadoTramite(),
                _historialTramites()
              ],
            )
            
            
          ])
          )

      ],
    );
  }

  ExpansionPanelRadio _expansionPanelEdition() {
    return ExpansionPanelRadio(
                canTapOnHeader: true,
                value: "formulario",
                headerBuilder: (context, isExpanded){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ListTile(
                      leading: Icon(Icons.edit_note_outlined),
                      title: Text('Edición de Trámite en Curso', style: Theme.of(context).textTheme.headline6),                      
                    ),
                  );
                } ,
                body: ListTile(
                    title: Text('Ut consectetur laborum ut velit nostrud tempor. Esse officia minim exercitation Lorem in magna cupidatat. Minim elit veniam ex ex ad ullamco mollit nulla reprehenderit non aliquip ut.',
                     style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),                      
                  )
                );
  }


ExpansionPanelRadio _expansionPanelEstadoTramite() {
    return ExpansionPanelRadio(
                canTapOnHeader: true,
                value: "detalle",
                headerBuilder: (context, isExpanded){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ListTile(
                      leading: Icon(Icons.stacked_bar_chart_outlined),
                      title: Text('Estado del Trámite', style: Theme.of(context).textTheme.headline6),                      
                    ),
                  );
                } ,
                body: ListTile(
                    title: Text('Excepteur officia labore fugiat reprehenderit reprehenderit. Lorem laboris aliquip ipsum labore nisi eiusmod nostrud sit enim id. Do nulla est officia consequat in qui consequat irure labore magna nulla. Sit velit fugiat dolor aliquip culpa ipsum ut occaecat ex anim aute ipsum ullamco officia. Eiusmod ad exercitation dolore eu aliqua exercitation enim est eiusmod in. Laborum ut sit officia id eu incididunt proident. Elit ut ex aliqua officia consequat elit in ullamco ut ullamco.Elit sunt magna reprehenderit ad et et nisi aliquip elit consequat. Irure sunt nostrud sit voluptate mollit cillum Lorem est laboris quis. Sint deserunt in quis ad laborum. Id sint cillum aute ut duis veniam fugiat. Mollit laboris ea consequat id id. Laborum enim magna anim nulla eu incididunt et.Anim esse amet id laboris sit sunt. Cupidatat et duis nulla adipisicing sint. Occaecat exercitation laboris voluptate dolore id incididunt nulla. Qui magna consectetur laboris elit deserunt.Ut consectetur laborum ut velit nostrud tempor. Esse officia minim exercitation Lorem in magna cupidatat. Minim elit veniam ex ex ad ullamco mollit nulla reprehenderit non aliquip ut.',
                     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),                      
                  )
                );
  }

  ExpansionPanelRadio _historialTramites() {
    return ExpansionPanelRadio(
                canTapOnHeader: true,
                value: "historial",
                headerBuilder: (context, isExpanded){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ListTile(
                      leading: Icon(Icons.history),
                      title: Text('Historial de Trámites', style: Theme.of(context).textTheme.headline6),                      
                    ),
                  );
                } ,
                body: ListTile(
                    title: Text('Excepteur officia labore fugiat reprehenderit reprehenderit. Lorem laboris aliquip ipsum labore nisi eiusmod nostrud sit enim id. Do nulla est officia consequat in qui consequat irure labore magna nulla. Sit velit fugiat dolor aliquip culpa ipsum ut occaecat ex anim aute ipsum ullamco officia. Eiusmod ad exercitation dolore eu aliqua exercitation enim est eiusmod in. Laborum ut sit officia id eu incididunt proident. Elit ut ex aliqua officia consequat elit in ullamco ut ullamco.Elit sunt magna reprehenderit ad et et nisi aliquip elit consequat. Irure sunt nostrud sit voluptate mollit cillum Lorem est laboris quis. Sint deserunt in quis ad laborum. Id sint cillum aute ut duis veniam fugiat. Mollit laboris ea consequat id id. Laborum enim magna anim nulla eu incididunt et.Anim esse amet id laboris sit sunt. Cupidatat et duis nulla adipisicing sint. Occaecat exercitation laboris voluptate dolore id incididunt nulla. Qui magna consectetur laboris elit deserunt.Ut consectetur laborum ut velit nostrud tempor. Esse officia minim exercitation Lorem in magna cupidatat. Minim elit veniam ex ex ad ullamco mollit nulla reprehenderit non aliquip ut.',
                     style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),                      
                  )
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
    return maxExtent != oldDelegate.maxExtent ||
            minExtent != oldDelegate.minExtent;
          //  child != oldDelegate.child;
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
    final String nombre = "Fernando Javier";
    
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
      margin: const EdgeInsets.only(bottom: 20),
      width: _currentImageSize,
      height: _currentImageSize,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black38,
        image:  DecorationImage(
          image: AssetImage('assets/launch_cohete.png'),
          fit: BoxFit.fill
          ),
          ),       
        alignment: Alignment.lerp(
          Alignment.bottomCenter,
          Alignment.topCenter,
          progress),             
      );
  }
}