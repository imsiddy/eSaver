import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/controls.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      print(token);
  runApp(MaterialApp(
      title: 'ESaver',
      home: token == null ? LoginScreen() : Controls(),
    ));
}


