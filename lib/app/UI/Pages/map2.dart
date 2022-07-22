import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:integrador/app/UI/Pages/home_controller.dart';
import 'package:provider/provider.dart';

import 'colors/colors.dart';

class EndPoint extends StatelessWidget {
  const EndPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                height: 200,
                child: Image.asset('lib/app/assets/images/mapicon.jpg'),
              ),
            SizedBox(
            width: 400,
            height: 400,
            child: Consumer<HomeController>(
              builder: (_, controller, __ )=> GoogleMap(
              onTap: controller.onTap ,
              markers: controller.markers,
              initialCameraPosition: controller.initialCameraPosition,
              
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
                          Navigator.pushReplacementNamed(context, 'registroR3');
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
}