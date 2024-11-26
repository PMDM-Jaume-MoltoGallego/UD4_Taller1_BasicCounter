import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget{
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>{
  int _counter = 0;
  double _fonstSize = 24.0;

  //TODO ACT2 Cambiamos el "layout" conforme se nos pide en la act2
  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buttonIncreaseCounter(),
              _buttonDecreaseCounter(),
            ],
          ),
          //TODO ACT4 Metemos el showCounter en una sizeBox para que los otros dos botones no se muevan
          const SizedBox(height: 30),
          SizedBox(
            height: 100,
            child: _showCounter(),
          )
        ],
      ),
    );
  }


  Widget _buttonIncreaseCounter(){
    return ElevatedButton(
      child: const Text('Increase me!', style: TextStyle(fontSize: 20.0)),
      onPressed: () => setState(() {
        //TODO ACT4 Hacemos que aumente el tamaño
        _fonstSize += 5;
        _counter++;
        if(_counter > 5){
          //TODO ACT4 Hacemos que se resetee el tamaño
          _fonstSize = 24;
          _counter = 0;
          _showMessage('Counter was reset!');
        }
      }),
    );
  }

  //TODO ACT2 Creamos el botón para que decremente y si el contador llega a -5 se reinicia
  Widget _buttonDecreaseCounter(){
    return ElevatedButton(
      child: const Text('Decrease me!', style: TextStyle(fontSize: 20.0)),
      onPressed: () => setState(() {
        //TODO ACT4 Hacemos que disminuya el tamaño
        _fonstSize -= 2;
        _counter--;
        if(_counter < -5){
          _counter = 0;
          //TODO ACT4 Hacemos que se resetee el tamaño
          _fonstSize = 24;
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

    //TODO ACT3 Modificamos y añadimos lo requerido en la act3
    scaffoldMessenger.showSnackBar(SnackBar(
      //TODO Hacemos que el "recuadro" tenga los bordes redondos
      shape : RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      //TODO Hacemos que el rectángulo tenga un márgen definido con los lados
      margin : EdgeInsets.all(40.0),
      //TODO Hacemos que si el rectángulo lo deslizamos gacia la derecha o izquierda se cierre
      dismissDirection : DismissDirection.horizontal,
      //TODO Hacemos que el rectángulo dure un tiempo en específico
      duration: Durations.short2,
      content: Text(msg, style: const TextStyle(color:  Colors.white)),
      //TODO Hacemos que el rectángulo aparezca como un popup de manera flotante, en vez de que salga desde abajo como antes
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
    ));
  }
}