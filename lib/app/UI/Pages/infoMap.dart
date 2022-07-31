import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:integrador/app/UI/Pages/Routes/routes.dart';
import 'package:integrador/app/UI/Pages/home_controller.dart';
import 'package:provider/provider.dart';

import '../widgets/drawer.dart';
import 'colors/colors.dart';

class InfoMap extends StatelessWidget {
  const InfoMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return ChangeNotifierProvider<HomeController>(
      create: (_){
        final controller =  HomeController();
        controller.onMarkerTap.listen((String id) {
          print("incio aqui $id");
        });
        return controller;
      },
      child: Scaffold(
        backgroundColor: ColorSelect.tema,
        appBar: AppBar(
          title: const Text("Info Ruta"),
          backgroundColor: const Color.fromARGB(255, 0, 79, 183)
        ),
        drawer: const DrawerWidget(),
        body: Container(
          // alignment: MainAxisAlignment.spaceBetween,
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget> [
              //  SizedBox(width: 20,),
              SizedBox(
                height: size.height *0.27,
                width: size.width*0.93,
                child: Container(
                  // padding: EdgeInsets.only(top: 50),
                  color: const Color(0XFF09BAA6),
                  
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(child: Text('Suchiapa - Tuxtla',style: TextStyle(color: Colors.white),),),
                      Container(padding: EdgeInsets.only(left: 20),child: Text('Numero de ruta: 20 ',style: TextStyle(color: Colors.white),textAlign: TextAlign.start,),width: double.infinity,),
                      Container(padding: EdgeInsets.only(left: 20),child: Text('Marca y modelo:  Nisaan Urvan 2017',style: TextStyle(color: Colors.white),textAlign: TextAlign.start,),width: double.infinity,),
                      Container(padding: EdgeInsets.only(left: 20),child: Text('Conductor: Oscar Perez ',style: TextStyle(color: Colors.white),textAlign: TextAlign.start,),width: double.infinity,),
                      Container(padding: EdgeInsets.only(left: 20),child: Text('Telefono: 002135897421',style: TextStyle(color: Colors.white),textAlign: TextAlign.start,),width: double.infinity,),
                    ],

                  ),
                ),
              ),
              SizedBox(
                height: size.height *0.08,
                width: size.width*0.93,
                child: Container(
                  color: const Color(0XFF09BAA6),
                  child: Center(
                    child: Text('Suchiapa - Tuxtla',style: TextStyle(color: Colors.white)),
                  ),
                  
                ),
              ),
              SizedBox(
                height: size.height *0.08,
                width: size.width*0.93,
                child: Container(
                  color: const Color(0XFF09BAA6),
                  child: Center(
                    child: Text('Suchiapa - Tuxtla',style: TextStyle(color: Colors.white)),
                  ),
                  
                ),
              ),
             
             
             
              SizedBox(
                // width: 400,
                height: size.height *0.3,
                width: size.width*0.93,
                child: Consumer<HomeController>(
                  builder: (_, controller, __ )=> GoogleMap(
                  //onTap: controller.onTap ,
                  markers: controller.markers,
                  initialCameraPosition: CameraPosition(target: LatLng(16.6180951,-93.0927738) ) ,
              
                  ),
                  )
                ),
              
            ],
          ),
        ),
      ),
    );
  }
  // body: GoogleMap( //Map widget from google_maps_flutter package
  //                   zoomGesturesEnabled: true, //enable Zoom in, out on map
  //                   initialCameraPosition: CameraPosition( //innital position in map
  //                     target: startLocation, //initial position
  //                     zoom: 16.0, //initial zoom level
  //                   ),
  //                   markers: markers, //markers to show on map
  //                   polylines: Set<Polyline>.of(polylines.values), //polylines
  //                   mapType: MapType.normal, //map type
  //                   onMapCreated: (controller) { //method called when map is created
  //                     setState(() {
  //                       mapController = controller; 
  //                     });
  //                   },
  //             ),
}