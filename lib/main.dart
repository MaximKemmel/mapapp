import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapapp/ui/navigation/navigation.dart';

import 'core/injections/injection.dart';

void main() async {
  await initInjection();
  runApp(const MyApp());
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MapApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: mainNavigation.routes,
      initialRoute: MainNavigationRouteNames.homeScreen,
    );
  }
}
