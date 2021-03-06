import 'package:flutter/material.dart';
import 'package:integrador/app/UI/Pages/Routes/routes.dart';
import 'package:integrador/app/UI/Pages/colors/colors.dart';


import '../../../service/login_service.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email = '';
  int? userType = 0;
  String? password = '';
  bool mostrar = true;
  bool ver = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorSelect.tema,
      appBar: AppBar(
        
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Info Ruta'),
        iconTheme: const IconThemeData(color: ColorSelect.tema),
        actions: [
          Container(
            padding: const EdgeInsets.only(left: 90),
            height: 60,
            width: 170,
          )
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        
        margin: const EdgeInsets.only(left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 400,
                child: Image.asset('lib/app/assets/images/info.png'),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                // color: Colors.amber,
                child: const Text(
                  'Correo electrónico ',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                color: Colors.white,
                
                //width: double.infinity,
                margin: EdgeInsets.only(top: 10,left: 10, right: 10),
                child: TextField(
                  
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: 'Dirección de correo',
                  ),
                  onChanged: (text) {
                    email= text;  
                  },
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10,right: 10, left: 10),
                child: const Text(
                  'Contraseña',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                color: Colors.white,
                margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
                child: TextField(
                  obscureText: mostrar,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 18),
                  autofocus: true,
                  decoration: 
                  
                  InputDecoration(
                  
                    suffixIcon: IconButton(
                      icon:
                          Icon(mostrar ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          mostrar = !mostrar;
                        });
                      },
                    ),

                    hintText: 'Contraseña',
                  ),
                  onChanged: (text) {
                    password = text;
                  },
                ),
              ),
                  //const Padding(padding: EdgeInsets.only(top:160)),
                  Container(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: size.width - 70,
                  height: 50,
                  child: ElevatedButton(
                      child: const Text(
                        'Iniciar sesión',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        if (email == '' && password == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 1000),
                              content: Text('Rellene los campos'),
                            ),
                          );
                        } else {
                          if(email == '1'){
                            Navigator.pushReplacementNamed(context, Routes.Transportista);
                          }else{
                            Navigator.pushReplacementNamed(context, Routes.Home);
                          }
                          // login(email!, password!).then((value) {
                          //   print('value: '+value.toString());
                          //   print('value: '+value['userType'].toString());
                          //       if (value['status'] == 'success') {

                          //         if(value['userType'] == 1){
                          //           // print('entra a transportista');
                          //           Navigator.pushReplacementNamed(
                          //             context, Routes.Transportista);
                          //         }else{
                          //           // print('entra a pasajero');
                          //           Navigator.pushReplacementNamed(
                          //             context, Routes.Home);
                          //         }
                          //       } else {
                          //         ScaffoldMessenger.of(context).showSnackBar(
                          //           const SnackBar(
                          //             duration: Duration(milliseconds: 1000),
                          //             content: Text('Contraseña incorrecta'),
                          //           ),
                          //         );
                          //       }
                          //     }
                          //   );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: ColorSelect.tema,
                          shape: RoundedRectangleBorder(
                              //borderSide: const BorderSide(color: Colors.white, width: 0),
                              borderRadius: BorderRadius.circular(20)))),
                ),
              ),
              Container(
                  width: 300,
                  margin: const EdgeInsets.only(top: 0, left: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, Routes.Register);
                        },
                        child: const Text(
                          'Regístrate',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ],
          ),
        ),

      ),
    );
  }
}