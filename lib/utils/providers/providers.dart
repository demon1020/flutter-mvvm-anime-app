import '/core.dart';

class Providers {
  static List<SingleChildWidget> getAllProviders() {
    List<SingleChildWidget> _providers = [
      ChangeNotifierProvider(create: (context) => AuthViewModel()),
      ChangeNotifierProvider(create: (context) => UserViewModel()),
      ChangeNotifierProvider(create: (context) => HomeViewViewModel()),
    ];
    return _providers;
  }
}
