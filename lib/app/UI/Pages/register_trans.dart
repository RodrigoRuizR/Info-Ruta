import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'colors/colors.dart';

class RegistroTransportes extends StatefulWidget {
  const RegistroTransportes({Key? key}) : super(key: key);

  @override
  State<RegistroTransportes> createState() => _RegistroTransportesState();
}

class _RegistroTransportesState extends State<RegistroTransportes> {
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
        
        title: const Text('Registrar Trasnportista'),
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
              height: 200,
              child: Image.asset('lib/app/assets/images/conductor.png'),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              //padding: EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(right: 310),
              child: const Text(
                'Nombre',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
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
                  hintText: 'Nombre',
                ),
                onChanged: (text) {
                  driverName = text;
                },
              ),
            ),

            const Padding(padding: EdgeInsets.only(top: 20)),

             Container(
              //padding: EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(right: 310),
              child: const Text(
                'Apellidos',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
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
                  hintText: 'Apellidos',
                ),
                onChanged: (text) {
                  driveLastName = text;
                },
              ),
            ),

            const Padding(padding: EdgeInsets.only(top: 20)),

             Container(
              //padding: EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(right: 250),
              child: const Text(
                'Numero de la ruta',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
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
                  numberRoute = text;
                },
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),

             Container(
              //padding: EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(right: 235),
              child: const Text(
                'Numero de la unidad',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
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
                  route_id = text as int?;
                },
              ),
            ),

            const Padding(padding: EdgeInsets.only(top: 20)),

             Container(
              //padding: EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(right: 235),
              child: const Text(
                '¿a quien pertenece?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
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
                  hintText: 'Dueño o compañia',
                ),
                onChanged: (text) {
                  company = text;
                },
              ),
            ),

            const Padding(padding: EdgeInsets.only(top: 20)),

             Container(
              //padding: EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(right: 235),
              child: const Text(
                'Modelo de la unidad',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
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
                  hintText: 'Modelo del vehiculo',
                ),
                onChanged: (text) {
                  model = text;
                },
              ),
            ),

            const Padding(padding: EdgeInsets.only(top: 20)),

             Container(
              //padding: EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(right: 235),
              child: const Text(
                'Numero de telefono',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
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
                  hintText: 'Ej. 999 9999 999',
                ),
                onChanged: (text) {
                  phone = text;
                },
              ),
            ),
            
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