import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:integrador/app/UI/Pages/Routes/routes.dart';
import 'package:integrador/app/UI/Pages/home_controller.dart';
import 'package:provider/provider.dart';

import 'colors/colors.dart';

class EndPoint extends StatefulWidget {

  const EndPoint({Key? key}) : super(key: key);

  @override
  State<EndPoint> createState() => _EndPointState();
}

class _EndPointState extends State<EndPoint> {

  late final LatLng latlon2;

  final Map<MarkerId, Marker> _markers = {};
  Set<Marker> get markers => _markers.values.toSet();

  final _markersController = StreamController<String>.broadcast();
  Stream<String> get onMarkerTap => _markersController.stream;

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    LatLng posision1 = arguments['posi1'];

    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<HomeController>(
      create: (_){
        final controller =  HomeController();
        controller.onMarkerTap.listen((String id) {
          print("Termina aqui por $id");
        });
        return controller;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Registrar ruta"),
          backgroundColor: const Color.fromARGB(255, 0, 79, 183)
        ),
        body: Column(
          children:<Widget> [
            const Text(
              '¿En donde Termina la ruta?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25,color: ColorSelect.tema, fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            SizedBox(
                height: 150,
                child: Image.asset('lib/app/assets/images/mapicon.jpg'),
              ),
            const Padding(padding: EdgeInsets.only(top: 20)),  
            SizedBox(
            width: 400,
            height: size.height *.44,
            child: Consumer<HomeController>(
              builder: (_, controller, __ )=> GoogleMap(
              onTap: onTap,
              markers: markers,
              initialCameraPosition: CameraPosition(target: LatLng(16.6180951,-93.0927738) ,zoom: 13),
              
              ),
              )
            ),
            Center(
              child: Container(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: SizedBox(
                    width: size.width - 70,
                    height: 50,
                    child: ElevatedButton(
                        child: const Text(
                          'Siguiente',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Routes.RegistroR3, arguments: {'posi1': posision1, 'posi2':latlon2});
                        },
                        style: ElevatedButton.styleFrom(
                            primary: ColorSelect.tema,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)))),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }

    void onTap(LatLng position){
    setState(() {
    print('entro aqui');
    final id = _markers.length.toString();
    final markerId = MarkerId(id);
    
    final marker = Marker(
      
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      markerId: markerId,
      position: position,
      anchor: const Offset(0.5,1),
      onTap: (){
        _markersController.sink.add(id);
      },
      draggable: true,
      onDragEnd: (newPosition){
        //print("el marcador se puso en las longitudes $newPosition");
        print("latitud ");
        print(newPosition);

        latlon2=newPosition;

        //print(puntos);
      },


      );

    _markers[markerId]=marker;
    });
    
    
  }
}





// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:integrador/app/UI/Pages/Routes/routes.dart';
// import 'package:integrador/app/UI/Pages/home_controller.dart';
// import 'package:provider/provider.dart';

// import 'colors/colors.dart';

// class EndPoint extends StatelessWidget {

//   EndPoint({Key? key}) : super(key: key);

//   late final LatLng LatLng2;

//   final List<double> puntosLat = [];
//   final List<double> puntosLon = [];


//   final Map<MarkerId, Marker> _markers = {};
//   Set<Marker> get markers => _markers.values.toSet();

//   final _markersController = StreamController<String>.broadcast();
//   Stream<String> get onMarkerTap => _markersController.stream;

//   @override
//   Widget build(BuildContext context) {
    
//     final arguments = ModalRoute.of(context)!.settings.arguments as Map;
//     LatLng posision1 = arguments['posi1'];
//     Size size = MediaQuery.of(context).size;
//     return ChangeNotifierProvider<HomeController>(
//       create: (_){
//         final controller =  HomeController();
//         controller.onMarkerTap.listen((String id) {
//           print("Termina aqui por $id");
//         });
//         return controller;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Registrar ruta"),
//           backgroundColor: const Color.fromARGB(255, 0, 79, 183)
//         ),
//         body: Column(
//           children:<Widget> [
//             const Text(
//               '¿En donde Termina la ruta?',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 25,color: ColorSelect.tema, fontWeight: FontWeight.bold),
//             ),
//             const Padding(padding: EdgeInsets.only(top: 20)),
//             SizedBox(
//                 height: 150,
//                 child: Image.asset('lib/app/assets/images/mapicon.jpg'),
//               ),
//             const Padding(padding: EdgeInsets.only(top: 20)),  
//             SizedBox(
//             width: 400,
//             height: size.height *.44,
//             child: Consumer<HomeController>(
//               builder: (_, controller, __ )=> GoogleMap(
//               //onTap: controller.onTap ,
//               markers: controller.markers,
//               initialCameraPosition: CameraPosition(target: LatLng(16.6180951,-93.0927738), zoom: 13 ),
              
//               ),
//               )
//             ),
//             Center(
//               child: Container(
//                   padding: const EdgeInsets.only(top: 30, bottom: 20),
//                   child: SizedBox(
//                     width: size.width - 70,
//                     height: 50,
//                     child: ElevatedButton(
//                         child: const Text(
//                           'Siguiente',
//                           style: TextStyle(fontSize: 18),
//                         ),
//                         onPressed: () {
//                           Navigator.pushReplacementNamed(context, Routes.RegistroR3, arguments: {'posi1':posision1,'posi2':LatLng2},);
//                         },
//                         style: ElevatedButton.styleFrom(
//                             primary: ColorSelect.tema,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20)))),
//                   ),
//                 ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   void onTap(LatLng position){
    
//     final id = _markers.length.toString();
//     final markerId = MarkerId(id);
    
//     final marker = Marker(
      
//       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
//       markerId: markerId,
//       position: position,
//       anchor: const Offset(0.5,1),
//       onTap: (){
//         _markersController.sink.add(id);
//       },
//       draggable: true,
//       onDragEnd: (newPosition){
//         //print("el marcador se puso en las longitudes $newPosition");
//         print("latitud ");
//         print(newPosition);
//         LatLng2=newPosition;

//         // puntosLat.add(newPosition.latitude);
//         // puntosLon.add(newPosition.longitude);

//         // print("LONGITUD WEY DE: $puntosLat");
//         // print("LONGITUD WEY DE: $puntosLon");

//         //print(puntos);
//       },


//       );

//     _markers[markerId]=marker;
//   }
// }