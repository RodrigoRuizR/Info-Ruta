import 'dart:html';

import 'package:permission_handler/permission_handler.dart';

class requestPermissionsController {

  final Permission _locationPermission;

  requestPermissionsController(this._locationPermission);

  request () async {
    final status = await _locationPermission.request();

    // if(status = PermissionStatus.granted){
      
    //   PermissionStatus.denied;
    // }
  }
  
  
}