import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:location_permissions/location_permissions.dart';
import 'package:trust_location/trust_location.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final _initialCameraPosition = const CameraPosition(
    zoom: 15,
    target: LatLng(16.6180951,-93.0927738),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 79, 183),
      appBar: AppBar(
        title: const Center( child:  Text("Inicio"),),
        backgroundColor: Color.fromARGB(255, 0, 79, 183),
      ),
      body: Column(
        
        children: [
          Container( color: Color.fromARGB(215, 48, 31, 155),child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(height:50 ,width: 50 ,child: Icon(Icons.menu),),
              Container(margin: EdgeInsets.only(right: 20),child: Row( children: <Widget> [Text("Bienvenido, Rodrigo"), Container(margin: EdgeInsets.only(left: 10),child:  Icon(Icons.face),)],))
            ],
          ),),Container(height: 80,color: Colors.orange,),          const Center(
            child: Padding(
              
              padding: EdgeInsets.only(bottom: 200)),
          ),
          SizedBox(
            

            width: 400,
            height: 400,
            child: GoogleMap(
              initialCameraPosition: _initialCameraPosition,)),
        ],
      ),
    );
  }
}