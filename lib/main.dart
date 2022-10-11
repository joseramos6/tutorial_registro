import 'package:flutter/material.dart';
import 'package:tutorial_registro/screens/registro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "registro",
      routes: {
        'registro': (context) => Registro(),
      },
    );
  }
}
