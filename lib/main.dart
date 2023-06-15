import 'package:flutter/material.dart';
import 'package:flutter_world_time/pages/choose_location.dart';
import 'package:flutter_world_time/pages/home.dart';
import 'package:flutter_world_time/pages/loading.dart';

void main() {
  // routes используется для навигации
  // initialRoute - экран старта
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation(),
    },
  ));
}
