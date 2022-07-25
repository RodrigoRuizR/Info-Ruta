import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier, Offset;
import 'package:google_maps_flutter/google_maps_flutter.dart';


class HomeController extends ChangeNotifier{

  final Map<MarkerId, Marker> _markers = {};
  Set<Marker> get markers => _markers.values.toSet();
  
  final _markersController = StreamController<String>.broadcast();
  Stream<String> get onMarkerTap => _markersController.stream;

  final initialCameraPosition = const CameraPosition(
    zoom: 11,
    target: LatLng(16.6180951,-93.0927738),
  );

  Position? _initialPosition;
  Position? get initialPosition => _initialPosition;

  
  bool _loading = true;
  bool get loading => _loading;

  late bool _gpsEnable;
  bool get gpsEnable => _gpsEnable;

  StreamSubscription? _gpsSubscription;

  HomeController(){
    _init();
  }

  Future<void> _init() async{
    
    _gpsEnable = await Geolocator.isLocationServiceEnabled();
    _loading = false;

    _gpsSubscription = Geolocator.getServiceStatusStream().listen(
      (status) async{
        _gpsEnable = status == ServiceStatus.enabled;
        _initialPosition = await Geolocator.getCurrentPosition();
        notifyListeners();
      }
    );
    if(_gpsEnable){
      _initialPosition = await Geolocator.getCurrentPosition();
      print("initial position $initialPosition");
    }
    
    notifyListeners();

  }

  Future<void> turnOnGPS()=>
    Geolocator.openLocationSettings();
  


  void onTap(LatLng position){
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
        print(newPosition.latitude);
      },


      );

    _markers[markerId]=marker;
    notifyListeners();
  }

  @override
  void dispose() {
    _gpsSubscription?.cancel();
    _markersController.close();
    super.dispose();
  }
}