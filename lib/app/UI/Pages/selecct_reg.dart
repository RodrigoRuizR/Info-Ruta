import 'package:flutter/material.dart';
import 'package:integrador/app/UI/Pages/Routes/routes.dart';
import 'package:integrador/app/UI/Pages/colors/colors.dart';

import '../widgets/drawer.dart';

class transportista extends StatelessWidget {
  const transportista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(padding: EdgeInsets.only(right: 10),
          child: Row(
            children: const[
              Text("¿Que haras el dia de hoy?")
              ,
            ],
          ),)
          ],
          backgroundColor: const Color.fromARGB(255, 0, 79, 183)
        ),
        drawer: const DrawerWidget(),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children:[
              Container(  
                //width: double.infinity,
                height: size.height * 0.424,
                color: const Color(0XFF09BAA6),
                child: Center(
                  child: (SizedBox(
                  width: size.width - 70,
                  height: 50,
                  child: ElevatedButton(
                      child: const Text(
                        'Agregar Ruta',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.Map1);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: ColorSelect.tema,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                  )),
                ),
                

              ),
              Container(
                //width: double.infinity,
                height: size.height * 0.424,
                color: ColorSelect.tema,
                child: Center(
                  child: (SizedBox(
                  width: size.width - 70,
                  height: 50,
                  child: ElevatedButton(
                      child: const Text(
                        'Agregar Transportista',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.RegistroT);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0XFF09BAA6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                  )),
                ),

              )
            ],
          ),
        ) ,
    );
  }
}