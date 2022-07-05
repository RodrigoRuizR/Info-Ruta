import 'package:flutter/material.dart';


import '../../../service/login_service.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email = '';
  String? password = '';
  bool mostrar = true;
  bool ver = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 0, 79, 183) ,
      appBar: AppBar(
        
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Info Ruta'),
        iconTheme: const IconThemeData(color: Colors.blueAccent),
        actions: [
          Container(
            padding: const EdgeInsets.only(left: 90),
            height: 60,
            width: 170,
            //child: Image.asset('assets/images/splash.png'),
          )
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        
        margin: const EdgeInsets.only(left: 10),
        // width: size.width,
        // height: size.height,
        child: SingleChildScrollView(
          child: Column(
            
            //mainAxisAlignment: MainAxisAlignment.end,
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
                //color: Colors.white,
                
                //width: double.infinity,
                padding: EdgeInsets.only(top: 10,left: 10, right: 10),
                child: TextField(
                  
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                  autofocus: true,
                  decoration: const InputDecoration(
                    
                    border: OutlineInputBorder(

                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.white, width: 1)),
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
                margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
                child: TextField(
                  obscureText: mostrar,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 18),
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
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    hintText: 'Contraseña',
                  ),
                  onChanged: (text) {
                    password = text;
                  },
                ),
              ),
             Padding(
               padding: const EdgeInsets.only(right: 10),
               child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:  [
                        TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, 'recuperar');
                          },
                          child: const Text(
                            '¿Has olvidado tu contraseña? ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
             ),
                  const Padding(padding: EdgeInsets.only(top:160)),
                  Container(
                padding: const EdgeInsets.only(top: 90),
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
                          login(email!, password!).then((value) {
                                print(value);
                                if (value['status'] == 'success') {
                                  Navigator.pushReplacementNamed(
                                      context, 'homepage');
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      duration: Duration(milliseconds: 1000),
                                      content: Text('Contraseña incorrecta'),
                                    ),
                                  );
                                }
                              });
                        }
                      },
                      
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF1083E7),
                          shape: RoundedRectangleBorder(
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
                          Navigator.pushNamed(context, 'registro');
                        },
                        child: const Text(
                          'Regístrate',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(256, 16, 131, 231),
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