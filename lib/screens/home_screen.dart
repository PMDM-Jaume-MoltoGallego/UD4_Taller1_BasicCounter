
import 'package:flutter/material.dart';
import 'package:ud3_taller1_bs/screens/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Basic Counter')),
      body: HomeBody(),
    );
  }
}