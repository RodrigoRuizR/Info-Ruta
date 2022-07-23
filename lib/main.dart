import 'package:flutter/material.dart';
import 'package:integrador/app/UI/Pages/Routes/pages.dart';
import 'package:integrador/app/UI/Pages/Routes/routes.dart';

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
      initialRoute: Routes.Splash,
      routes: appRoutes()
      // {
      // 'request': (BuildContext context) =>  RequestPermissionPage(),
      // 'map1': (BuildContext context) =>  const FirstPoint(),
      // 'map2': (BuildContext context) =>  const EndPoint (),
      // 'home': (BuildContext context) =>  const HomePage(),
      // 'login': (BuildContext context) =>  const LoginPage(),
      // 'register': (BuildContext context) =>  const Registro(),
      // 'transportista': (BuildContext context) =>  const transportista(),
      // 'registroT': (BuildContext context) =>  const RegistroTransportes(),
      // 'registroR3': (BuildContext context) =>  const RegistroRutas3(),
      // }
    );
  }
}

