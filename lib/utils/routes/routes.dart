import '/core.dart';

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