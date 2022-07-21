


import 'dart:async';

import 'package:flutter/widgets.dart' show ChangeNotifier, Offset;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends ChangeNotifier{
  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();
  final _markersController = StreamController<String>.broadcast();
  Stream<String> get onMarkerTap => _markersController.stream;

  final initialCameraPosition = const CameraPosition(
    zoom: 15,
    target: LatLng(16.6180951,-93.0927738),
  );

  void onTap(LatLng position){
    final id = _markers.length.toString();
    final markerId = MarkerId(id);
    
    final marker = Marker(
      
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      markerId: markerId,
      position: position,
      anchor: const Offset(5.0,1),
      onTap: (){
        _markersController.sink.add(id);
      },
      draggable: true,
      onDragEnd: (newPosition){
        //print("el marcador se puso en las longitudes $newPosition");
        print("latitud ");
        print(newPosition.latitude);
      },


      );

    _markers[markerId]=marker;
    notifyListeners();
  }

  @override
  void dispose() {
    _markersController.close();
    super.dispose();
  }
}