

import 'package:flutter/material.dart';
import 'package:providerdemo/utils/routes/routes_name.dart';
import 'package:providerdemo/view/login_screen.dart';

import '../../view/home_screen.dart';
import '../../view/signp_view.dart';
import '../../view/splash_view.dart';

class Routes{
  static Route<dynamic> generateRoutes(RouteSettings settings){

    switch(settings.name){
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashView());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=>HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=>LoginScreen());
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (BuildContext context) => const SignUpView());
      default :
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(child: Text("No Routes define")),
          );
        });
    }
  }
}