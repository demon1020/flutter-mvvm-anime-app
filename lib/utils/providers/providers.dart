import 'package:mvvm_dartz/view_model/home_view_model.dart';

import '../../core.dart';
import 'package:provider/single_child_widget.dart';

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
