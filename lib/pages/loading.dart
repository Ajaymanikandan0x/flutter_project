import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_clock/pages/home.dart';

class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

final _username = TextEditingController();
final _password = TextEditingController();

class _loadingState extends State<loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('sign in'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const CircleAvatar(
                  backgroundImage: AssetImage('assets/image/walpapper.jpg'),
                  radius: 40),
              Divider(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5.0, 5.0, 15.0),
                    child: SizedBox(
                      height: 30,
                      child: Text(
                        'User Name',
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: _username,
                decoration: InputDecoration(
                  hintText: AutofillHints.username,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              Divider(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5.0, 5.0, 15.0),
                    child: SizedBox(
                      height: 40,
                      child: Text('Password',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1)),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: AutofillHints.password,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black26,
                      minimumSize: const Size(
                        400.0,
                        30.0,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    DataStore();
                  },
                  child: Text('login')),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> DataStore() async {
    print(_username.text);

    final shareprif = await SharedPreferences.getInstance();
    await shareprif.setString('username', _username.text);
    await shareprif.setString('password', _password.text);

    if (_username.text.isNotEmpty && _password.text.isNotEmpty) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => home(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('user name and password note match'),
        ),
      );
    }
  }
}
