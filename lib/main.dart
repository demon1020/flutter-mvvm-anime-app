import 'package:flutter/material.dart';
import 'package:mvvm_dartz/utils/global.dart';
import 'package:mvvm_dartz/utils/providers/providers.dart';
import 'package:mvvm_dartz/utils/routes/routes.dart';
import 'package:mvvm_dartz/utils/routes/routes_name.dart';
import 'package:mvvm_dartz/utils/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: Providers.getAllProviders(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: RoutesName.wrapper,
      onGenerateRoute: Routes.generateRoute,
      navigatorKey: navigatorKey,
    );
  }
}
