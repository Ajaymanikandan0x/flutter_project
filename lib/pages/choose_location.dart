import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_clock/pages/loading.dart';

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
        backgroundColor: Colors.teal,
        title: Text('Home'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.settings),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text('settings'),
              ),
              PopupMenuItem(
                child: const Row(
                  children: [
                    Text('Logout'),
                    Icon(
                      Icons.logout,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ],
                ),
                onTap: () {
                  sigout(context);
                },
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    Text('Exit'),
                    IconButton(
                      icon: const Icon(
                        Icons.exit_to_app,
                        size: 30,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                    ),
                  ],
                ),
              )
            ],
          )
        ],
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

  sigout(BuildContext context) async {
    final _sherdprif = await SharedPreferences.getInstance();
    await _sherdprif.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => loading()), (route) => false);
  }
}
