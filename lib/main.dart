import 'package:flutter/material.dart';
import 'package:integrador/app/UI/Pages/home_page.dart';
import 'package:integrador/app/UI/Pages/login.dart';
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
      initialRoute: 'login',
      routes: {
      'home': (BuildContext context) =>  HomePage(),
      'login': (BuildContext context) =>  const LoginPage(),
      'register': (BuildContext context) =>  const Registro(),
      }
    );
  }
}

