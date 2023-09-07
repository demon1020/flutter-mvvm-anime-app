
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/auth/view_model/auth_view_model.dart';
import '../../features/home/view_model/home_view_model.dart';
import '../../features/user/view_model/user_view_model.dart';

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
