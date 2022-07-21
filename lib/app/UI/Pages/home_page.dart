import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/retry.dart';
import 'package:integrador/app/UI/Pages/home_controller.dart';
import 'package:integrador/app/UI/Pages/location_provider.dart';
import 'package:integrador/app/UI/widgets/drawer.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';



class HomePage extends StatelessWidget {
  //final _location = LocationProvider();

  const HomePage({Key? key}) : super(key: key);
  //final _controller = HomeController();
  

  // @override
  // void initState() {
  //   _location.getLocation();
  //   print("este es un mensaje");
  //   print(_location.locationData);
  //   //super.initState();
    
  // }
  @override
  Widget build(BuildContext context) {
    
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<HomeController>(
      create: (_) {
        final controller =  HomeController();
        controller.onMarkerTap.listen((String id) {
          print("estas en el $id");
        });
        return controller;
      },
    child: Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 79, 183),
      appBar: AppBar(
        //title: const Text("Rod "),
        backgroundColor: Color.fromARGB(255, 0, 79, 183),
        actions: [
          Padding(padding: EdgeInsets.all(10),
          child: Row(
            children: const[
              Text("Bienvenido, Rodrigo"),
            ],
          ),)
          
        ],
      ),
      drawer: const DrawerWidget(),
      body: Column(
        
        children: [
          Container(
            width: size.width,
            child: IconButton(onPressed: (){
                showSearch(context: context, delegate: Search());
              }, icon: Icon(Icons.search)),     
            color: const Color(0XFF09BAA6),),          
            const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10)), 
          ),
          SizedBox(
            width: 400,
            height: 700,
            child: Consumer<HomeController>(
              builder: (_, controller, __ )=> GoogleMap(
              onTap: controller.onTap ,
              markers: controller.markers,
              initialCameraPosition: controller.initialCameraPosition,),)
            ),
        ],
      ),
    ));
    
  }
}


class Search extends SearchDelegate<String> {
  List moteles = [];
  final recientes = ["Up chiapas"];


  // final Stream<QuerySnapshot> _roomsS =
  //  FirebaseFirestore.instance.collection('rooms').snapshots();
  //unos ejemplos de listas para los resultados

  @override
  List<Widget> buildActions(BuildContext context) {
    // aqui se colocan las cosas que queremos que haga en este caso el boton

    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];

    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    //en este apartado se regresa al menu principal
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, "null");
      },
    );

    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // aqui se hace todo lo de las recomendaciones de busqueda
    return Center(
        child: Container(
      height: 100.0,
      width: 100.0,
      child: Card(
        color: Colors.red,
        child: Center(
          child: Text(query),
        ),
      ),
    ));

    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

   // getRomms();
    /*return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('rooms').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');

        final results =
            snapshot.data.docum.ents.where((a) => a['name'].contains(query));

        return ListView(
          children: results.map<Widget>((a) => Text(a['title'])).toList(),
        );
      },
    );*/

    
    final recomendacionList = query.isEmpty
        ? recientes
        : moteles.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.circle),
        title: RichText(
          text: TextSpan(
              text: recomendacionList[index].substring(0, query.length),
              style: TextStyle(
                  color: Colors.purpleAccent, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: recomendacionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: recomendacionList.length,
    );
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }

}