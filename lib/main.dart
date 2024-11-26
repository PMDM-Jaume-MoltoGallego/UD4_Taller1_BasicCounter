
import 'package:flutter/material.dart';
import 'package:ud3_taller1_bs/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String _title = "Basic Counter";

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      //TODO ACT1 Eliminar el banner "debug" para que no se visualice en la aplicación.
      debugShowCheckedModeBanner: false,
      title: _title,
      home: HomeScreen(),
    );
  }
}
