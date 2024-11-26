import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget{
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>{
  int _counter = 0;
  double _fonstSize = 24.0;

  @override
  Widget build(BuildContext context){
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buttonIncreaseCounter(),
          _showCounter(),
        ],
      ),
    );
  }


  Widget _buttonIncreaseCounter(){
    return ElevatedButton(
      child: const Text('Click me!', style: TextStyle(fontSize: 20.0)),
      onPressed: () => setState(() {
        _counter++;
        if(_counter > 5){
          _counter = 0;
          _showMessage('Counter was reset!');
        }
      }),
    );
  }

  Widget _showCounter(){
    return Text(
      _counter.toString(),
      style: TextStyle(
        color: Colors.red,
        fontSize: _fonstSize,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
    );
  }


  void _showMessage(String msg){
    //Find the ScaffoldMessenger in the widget tree
    var scaffoldMessenger = ScaffoldMessenger.of(context);

    scaffoldMessenger.hideCurrentSnackBar();

    scaffoldMessenger.showSnackBar(SnackBar(
      content: Text(msg, style: const TextStyle(color:  Colors.white)),
      behavior: SnackBarBehavior.fixed,
      backgroundColor: Colors.green,
    ));
  }
}