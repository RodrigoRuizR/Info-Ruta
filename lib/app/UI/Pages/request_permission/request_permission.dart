import 'dart:async';

import 'package:flutter/material.dart';
import 'package:integrador/app/UI/Pages/Routes/routes.dart';
import 'package:integrador/app/UI/Pages/request_permission/request_permission_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestPermissionPage extends StatefulWidget {
  RequestPermissionPage({Key? key}) : super(key: key);

  @override
  State<RequestPermissionPage> createState() => _RequestPermissionPageState();
}

class _RequestPermissionPageState extends State<RequestPermissionPage> {
  final _controller = RequestPermissionController(Permission.locationWhenInUse);
  late StreamSubscription _subscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _subscription = _controller.onStatusChanged.listen((status) { 
      if(status == PermissionStatus.granted){
        Navigator.pushReplacementNamed(context, Routes.Login);
      }
    },);
  }
  @override
  void dispose() {
    _subscription.cancel();
    _controller.Dispose();
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: ElevatedButton(
            child: const Text("Permitir"),
            onPressed: (){
              _controller.request();
            },
          ),
        )
      ),

    );
  }
}