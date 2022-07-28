import 'package:flutter/material.dart';
import 'package:integrador/app/UI/Pages/Routes/routes.dart';
import 'package:integrador/service/register_service.dart';

import 'colors/colors.dart';
//import 'package:flutter_application_1/src/splash/styles/colors/colors_views.dart';

//import '../models/register_service.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  bool mostrar = true;
  bool ver = false;
  String? name = '';
  String? username = '';
  String? email = '';
  int? userType = 0;
  String? password = '';
  late String _dropdownvalue = 'Administrador de ruta';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Regístrate'),
        iconTheme: const IconThemeData(color: ColorSelect.tema),
        backgroundColor: ColorSelect.tema,
      ),
      body: Container(
        color: ColorSelect.tema,
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            SizedBox(
              height: 200,
              child: Image.asset('lib/app/assets/images/info.png'),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              //padding: EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(right: 310),
              child: const Text(
                'Nombre',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
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
                      borderSide: BorderSide(color: Colors.white, width: 0)),
                  hintText: 'Nombre completo',
                ),
                onChanged: (text) {
                  name = text;
                },
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              margin: const EdgeInsets.only(right: 250),
              child: const Text(
                'Correo electrónico',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
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
                      borderSide: BorderSide(color: Colors.white, width: 0)),
                  hintText: 'Dirección de correo',
                ),
                onChanged: (text) {
                  email = text;
                },
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              margin: const EdgeInsets.only(right: 310),
              child: const Text(
                'Username',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
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
                      // borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.white, width: 0)),
                  hintText: 'Username',
                ),
                onChanged: (text) {
                  username = text;
                },
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              margin: const EdgeInsets.only(right: 290),
              child: const Text(
                'Contraseña',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.only(right: 20, left: 20),
              child: TextField(
                obscureText: mostrar,
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 18, color: Colors.black),
                autofocus: true,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon:
                        Icon(mostrar ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        mostrar = !mostrar;
                      });
                    },
                  ),
                  border: const OutlineInputBorder(
                      //borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.white, width: 0)),
                  hintText: 'Contraseña',
                ),
                onChanged: (text) {
                  password = text;
                },
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              margin: const EdgeInsets.only(right: 250),
              child: const Text(
                'Tipo de usuario',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20),
              // child: DropdownButton(items: const [
              //   DropdownMenuItem(child: Text("Administrador de ruta"), value: 1,),
              //   DropdownMenuItem(child: Text("Pasajero"), value: 2,),

              // ],

              // iconEnabledColor: Colors.white,
              // dropdownColor: Colors.white,
              // isExpanded: true,
              // onChanged: dropdowncallback),
              child: DropdownButton(
                value: _dropdownvalue,
                onTap: () {},
                onChanged: (String? value) {
                  setState(() {
                    _dropdownvalue = value!;
                  });
                },
                items: <String>['Administrador de ruta', 'Pasajero']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 16,color: Colors.black, fontWeight: FontWeight.bold ),
                    ),
                    value: value,
                  );
                }).toList(),
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
                        'Crear Cuenta',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        if (name == '' || email == '' || username == '' || password == '' || _dropdownvalue == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Llene todo los campos"),
                              duration: Duration(milliseconds: 3000),
                            ),
                          );
                        } else {
                          Navigator.pushReplacementNamed(context, Routes.Login);
                        //   print('entra aqui todo lleno');
                        //   if (_dropdownvalue == 'Pasajero') {
                        //   userType = 2;
                        // } else {
                        //   userType = 1;
                        // }
                        // register(userType!, name!, email!, username!, password!).then((value) {
                        //   if (value['status'] == 'success') {
                        //     Navigator.pushReplacementNamed(context, Routes.Login);
                        //   }
                        // });
                        // // print('usertype:' + userType.toString());
                        // }
                      }
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

  void dropdowncallback(String? selectValue) {
    if (selectValue is String) {
      setState(() {
        _dropdownvalue = selectValue;
      });
    }
  }
}
