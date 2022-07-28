import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Poly extends StatefulWidget{
  @override
  _PolyState createState() => _PolyState();
}

class _PolyState extends State<Poly> {
  
  GoogleMapController? mapController; //contrller for Google map
  PolylinePoints polylinePoints = PolylinePoints();

  String googleAPiKey = "AIzaSyDwp2T4ur90vOU4YxMONvMQ9yy0u8I4WnI";
  
  Set<Marker> markers = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction

  LatLng startLocation = LatLng(16.7475884, -93.1195974);  
  LatLng endLocation = LatLng(16.6180951, -93.0927738); 

  // 16.6180951,-93.0927738  
  // 16.7475884,-93.1195974
                            

  @override
  void initState() {

     markers.add(Marker( //add start location marker
        markerId: MarkerId(startLocation.toString()),
        position: startLocation, //position of marker
        infoWindow: InfoWindow( //popup info 
          title: 'Starting Point ',
          snippet: 'Start Marker',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add distination location marker
        markerId: MarkerId(endLocation.toString()),
        position: endLocation, //position of marker
        infoWindow: InfoWindow( //popup info 
          title: 'Destination Point ',
          snippet: 'Destination Marker',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      
      getDirections(); //fetch direction polylines from Google API
      
    super.initState();
  }

  getDirections() async {
      List<LatLng> polylineCoordinates = [];
     
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          googleAPiKey,
          PointLatLng(startLocation.latitude, startLocation.longitude),
          PointLatLng(endLocation.latitude, endLocation.longitude),
          travelMode: TravelMode.driving,
      );
      print("my points");
      print(result.status);

      if (result.points.isNotEmpty) {
            result.points.forEach((PointLatLng point) {
                polylineCoordinates.add(LatLng(point.latitude, point.longitude));
            });
      } else {
         print(result.errorMessage);
      }
      addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
          appBar: AppBar( 
             title: Text("Rutas"),
             backgroundColor: Colors.deepPurpleAccent,
          ),
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
                child: GoogleMap( //Map widget from google_maps_flutter package
                    zoomGesturesEnabled: true, //enable Zoom in, out on map
                    initialCameraPosition: CameraPosition( //innital position in map
                      target: startLocation, //initial position
                      zoom: 16.0, //initial zoom level
                    ),
                    markers: markers, //markers to show on map
                    polylines: Set<Polyline>.of(polylines.values), //polylines
                    mapType: MapType.normal, //map type
                    onMapCreated: (controller) { //method called when map is created
                      setState(() {
                        mapController = controller; 
                      });
                    },
              )
                ),
              
            ],
          ),
        ),
          // body: GoogleMap( //Map widget from google_maps_flutter package
          //           zoomGesturesEnabled: true, //enable Zoom in, out on map
          //           initialCameraPosition: CameraPosition( //innital position in map
          //             target: startLocation, //initial position
          //             zoom: 16.0, //initial zoom level
          //           ),
          //           markers: markers, //markers to show on map
          //           polylines: Set<Polyline>.of(polylines.values), //polylines
          //           mapType: MapType.normal, //map type
          //           onMapCreated: (controller) { //method called when map is created
          //             setState(() {
          //               mapController = controller; 
          //             });
          //           },
          //     ),
       );
  }
}
