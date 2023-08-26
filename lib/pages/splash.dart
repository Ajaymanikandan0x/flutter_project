import 'dart:async';

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
    Timer(
      Duration(seconds: 3),
      () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    Setstore(context);
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.teal, Colors.white54],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
        ),
        child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.network_check,
                size: 50,
                color: Colors.blue,
              ),
              Text('Loading',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      wordSpacing: 1)),
            ]),
      ),
    );
  }
}

Future<void> Setstore(BuildContext context) async {
  final sharprif = await SharedPreferences.getInstance();
  final saveValue = sharprif.getString('Save_value');
  if (saveValue != null) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => home()));
  }
}
