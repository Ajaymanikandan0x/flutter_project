import 'package:flutter/material.dart';
import 'package:world_clock/Pages/home.dart';
import 'package:world_clock/pages/choose_location.dart';
import 'package:world_clock/pages/loading.dart';
import 'package:world_clock/pages/splash.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.blueGrey),
    // initialRoute: '/',
    routes: {
      '/': (context) => splsh(),
      '/home': (context) => home(),
      // '/choose_location': (context) => choose_location()
    },
  ));
}
