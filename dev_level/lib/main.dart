import 'package:flutter/material.dart';
import 'package:devlevel/screens/homepage.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dev Level',
      theme: ThemeData(
        primaryColorLight: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 0, 0),
        ),
        primaryColorDark: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        dialogBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
