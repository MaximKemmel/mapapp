import 'package:flutter/material.dart';

import '../../domain/factories/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const homeScreen = '/';
}

class MainNavigation {
  static final ScreenFactory screenFactory = ScreenFactory();

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.homeScreen: (_) => screenFactory.makeHomeScreen(),
  };
}
