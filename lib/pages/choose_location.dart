import 'package:flutter/material.dart';

class choose_location extends StatefulWidget {
  final String name;

  const choose_location({super.key, required this.name});
  @override
  State<choose_location> createState() => _choose_locationState();
}

class _choose_locationState extends State<choose_location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(widget.name),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Text('ha'),
            )
          ],
        ),
      ),
    );
  }
}
