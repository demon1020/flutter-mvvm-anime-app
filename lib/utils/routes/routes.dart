import 'package:flutter/material.dart';
import 'package:mvvm_dartz/utils/routes/routes_name.dart';

import '../../features/auth/view/auth_view.dart';
import '../../features/home/view/home_view.dart';
import '../../features/user/view/user_view.dart';


class Routes {

  static Route<dynamic>  generateRoute(RouteSettings settings){

    switch(settings.name){

      case RoutesName.wrapper:
        return MaterialPageRoute(builder: (BuildContext context) => const UserView());

        case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const AuthView());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeView());

      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });

    }
  }
}