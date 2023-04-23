import 'package:flutter/material.dart';
import 'package:mapapp/ui/screens/home/home_screen.dart';
import 'package:mapapp/ui/screens/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  Widget makeHomeScreen() {
    return ChangeNotifierProvider(
      create: (_) => HomeViewmodel(),
      child: const HomeScreen(),
    );
  }
}
