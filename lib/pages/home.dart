import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_clock/pages/choose_location.dart';
import 'package:world_clock/pages/loading.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('person$index'),
                  leading: CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage('assets/image/walpapper.jpg')),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return choose_location(name: 'person$index');
                    }));
                  },
                );
              },
              separatorBuilder: (context, index) => Divider(height: 5.0),
              itemCount: 20),
        ),
      ),
    );
  }

  sigout(BuildContext context) async {
    final _sherdprif = await SharedPreferences.getInstance();
    await _sherdprif.remove('password');
    await _sherdprif.remove('username');
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => loading()), (route) => false);
  }
}
