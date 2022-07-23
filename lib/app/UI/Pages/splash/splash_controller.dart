import 'package:flutter/widgets.dart' show ChangeNotifier;
import 'package:integrador/app/UI/Pages/Routes/routes.dart';
import 'package:integrador/main.dart';
import 'package:permission_handler/permission_handler.dart';


class SplashController extends ChangeNotifier {
  final Permission _locationPermission;
  String? _routName;
  String? get routName => _routName;

  SplashController(this._locationPermission);

  Future<void> checkPermission() async{
    final isGranted = await _locationPermission.isGranted;
    _routName = isGranted?Routes.Login:Routes.Permission;
    notifyListeners();


  }
}