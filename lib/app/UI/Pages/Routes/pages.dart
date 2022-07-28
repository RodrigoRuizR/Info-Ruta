import 'package:flutter/widgets.dart';
import 'package:integrador/app/UI/Pages/Routes/routes.dart';
import 'package:integrador/app/UI/Pages/home_page.dart';
import 'package:integrador/app/UI/Pages/infoMap.dart';
import 'package:integrador/app/UI/Pages/login.dart';
import 'package:integrador/app/UI/Pages/map.dart';
import 'package:integrador/app/UI/Pages/map2.dart';
import 'package:integrador/app/UI/Pages/poli.dart';
import 'package:integrador/app/UI/Pages/register_ruta.dart';
import 'package:integrador/app/UI/Pages/register_trans.dart';
import 'package:integrador/app/UI/Pages/registro.dart';
import 'package:integrador/app/UI/Pages/request_permission/request_permission.dart';
import 'package:integrador/app/UI/Pages/search.dart';
import 'package:integrador/app/UI/Pages/selecct_reg.dart';
import 'package:integrador/app/UI/Pages/splash/splash_page.dart';


Map<String, Widget Function(BuildContext)> appRoutes(){
  return {
    Routes.Splash: (_)=> const SplashPage(),
    Routes.Permission: (_)=> RequestPermissionPage(),
    Routes.Home:(_) => const HomePage(),
    Routes.Login:(_) => const LoginPage(),
    // Routes.Map1:(_) => const FirstPoint(),
    Routes.Map2:(_) => const EndPoint(),
    Routes.Register:(_) => const Registro(),
    Routes.Transportista:(_) => const transportista(),
    Routes.RegistroT:(_) => const RegistroTransportes(),
    Routes.RegistroR3:(_) => const RegistroRutas3(),
    Routes.Infomap:(_)=> const InfoMap(),
    Routes.Poly :(_)=> Poly(),
    Routes.Search:(_)=> buscar()
  };
}