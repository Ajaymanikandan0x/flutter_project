import 'dart:async';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_clock/Pages/home.dart';

class splsh extends StatefulWidget {
  const splsh({super.key});

  @override
  State<splsh> createState() => _splshState();
}

class _splshState extends State<splsh> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Setstore(context);
    Timer((Duration(seconds: 3)), () {
      Navigator.pushNamed(context, '/loading');
    });
  }

  @override
  Widget build(BuildContext context) {
    Setstore(context);
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // stops: [0.5, .10],
            colors: [Colors.blue, Colors.redAccent]),
      ),
      child: Center(
          child: SpinKitWaveSpinner(
        color: Colors.white,
        size: 50.0,
      )),
    ));
  }
}

Future<void> Setstore(BuildContext context) async {
  final sharprif = await SharedPreferences.getInstance();
  final saveValue =
      '${sharprif.getString('password')}${sharprif.getString('username')}';
  if (saveValue.isNotEmpty) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => home()));
  }
}
