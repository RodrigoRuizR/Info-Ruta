import 'package:flutter/material.dart';
import 'package:integrador/app/UI/Pages/home_page.dart';
import 'package:integrador/app/UI/Pages/login.dart';
import 'package:integrador/app/UI/Pages/map.dart';
import 'package:integrador/app/UI/Pages/map2.dart';
import 'package:integrador/app/UI/Pages/register_trans.dart';
import 'package:integrador/app/UI/Pages/selecct_reg.dart';
import 'app/UI/Pages/register_ruta.dart';
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
      initialRoute: 'registroR3',
      routes: {
      'map1': (BuildContext context) =>  const FirstPoint(),
      'map2': (BuildContext context) =>  const EndPoint (),
      'home': (BuildContext context) =>  const HomePage(),
      'login': (BuildContext context) =>  const LoginPage(),
      'register': (BuildContext context) =>  const Registro(),
      'transportista': (BuildContext context) =>  const transportista(),
      'registroT': (BuildContext context) =>  const RegistroTransportes(),
      'registroR3': (BuildContext context) =>  const RegistroRutas3(),
      }
    );
  }
}

