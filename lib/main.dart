import 'package:flutter/material.dart';
import 'package:integrador/app/UI/Pages/home_page.dart';
import 'package:integrador/app/UI/Pages/login.dart';
import 'package:integrador/app/UI/Pages/register_trans.dart';
import 'package:integrador/app/UI/Pages/selecct_reg.dart';
import 'app/UI/Pages/registro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Info Ruta v1',
      debugShowCheckedModeBanner: false,
      initialRoute: 'registroT',
      routes: {
      'home': (BuildContext context) =>  HomePage(),
      'login': (BuildContext context) =>  const LoginPage(),
      'register': (BuildContext context) =>  const Registro(),
      'transportista': (BuildContext context) =>  const transportista(),
      'registroT': (BuildContext context) =>  const RegistroTransportes(),
      }
    );
  }
}

