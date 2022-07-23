import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Routes/routes.dart';
import 'colors/colors.dart';

class RegistroRutas3 extends StatefulWidget {
  const RegistroRutas3({Key? key}) : super(key: key);

  @override
  State<RegistroRutas3> createState() => _RegistroRutas3State();
}

class _RegistroRutas3State extends State<RegistroRutas3> {
  bool mostrar = true;
  bool ver = false;
  String? driverName = '';
  String? driveLastName = '';
  String? model = '';
  String? company = '';
  String? phone = '';
  String? numberRoute = '';
  int? route_id = 0;

  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Registrar Ruta'),
        iconTheme: const IconThemeData(color: ColorSelect.tema),
        backgroundColor: ColorSelect.tema,
      ),
      body: Container(
        color: ColorSelect.tema,
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end, 
            children: [
            SizedBox(
              height: 300,
              child: Image.asset('lib/app/assets/images/info.png'),
            ),

            const Padding(padding: EdgeInsets.only(top: 20)),

             Container(
              //padding: EdgeInsets.symmetric(horizontal: 10),
              //margin: const EdgeInsets.only(right: 310),
              child: const Text(
                'Numero de la ruta',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 5)),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.only(right: 20, left: 20),
              child: TextField(
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 18, color: Colors.black),
                autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      //borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.white, width: 0  )),
                  hintText: '#',
                ),
                onChanged: (text) {
                  driveLastName = text;
                },
              ),
            ),

            const Padding(padding: EdgeInsets.only(top: 20)),

             Container(
              //padding: EdgeInsets.symmetric(horizontal: 10),
              //margin: const EdgeInsets.only(right: 250),
              child: const Text(
                'Descripcion',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 5)),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.only(right: 20, left: 20),
              child: TextField(
                
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 18, color: Colors.black, height: 2),
                autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      //borderRadius: BorderRadius.all(Radius.circular(15)),
                      //borderSide: BorderSide(color: Colors.white, width: 0  )),
                  ),
                  hintText: 'Inicio y salida de la ruta',
                ),
                onChanged: (text) {
                  numberRoute = text;
                },
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Center(
              child: Container(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: SizedBox(
                    width: size.width - 70,
                    height: 50,
                    child: ElevatedButton(
                        child: const Text(
                          'Agregar',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Routes.Transportista);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: ColorSelect.tema,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)))),
                  ),
                ),
            ),
          ]),
        ),
      ),
    );
  }
  
  
}