import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:pokedex_flutter/core/presentation/app_bar.dart';

class Poke3D extends StatefulWidget {
  const Poke3D({Key? key, required this.name}) : super(key: key);

  final String name;
  @override
  _Poke3DState createState() => _Poke3DState();
}

class _Poke3DState extends State<Poke3D> {
  UnityWidgetController? _unityWidgetController;
  late double _rotationX;
  late double _rotationY;

  @override
  void initState() {
    super.initState();

    _rotationX = 0;
    _rotationY = 0;
  }

  @override
  void dispose() {
    super.dispose();
    _unityWidgetController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar,
      body: GestureDetector(
        onHorizontalDragUpdate: setPokemonRotation,
        onVerticalDragUpdate: setPokemonRotation,
        child: UnityWidget(
          onUnityCreated: _onUnityCreated,
          onUnityMessage: (dynamic message) async {
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    backgroundColor: Colors.white,
                    content: Text(message.toString()),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Ok'),
                      )
                    ]);
              },
            );
            return Navigator.pop(context);
          },
          onUnitySceneLoaded: onUnitySceneLoaded,
        ),
      ),
    );
  }

  void setPokemonRotation(DragUpdateDetails details) {
    setState(() {
      _rotationY -= details.delta.dx * 1.5;
      _rotationX += details.delta.dy;
    });

    if (_rotationX < -30) _rotationX = -30;
    if (_rotationX > 45) _rotationX = 45;

    log('$_rotationX:$_rotationY');
    
    _unityWidgetController?.postMessage(
      'PokemonHolder',
      'SetPokemonRotation',
      '$_rotationX:$_rotationY',
    );
  }

  void onUnityMessage(dynamic message) {
    // log(message.toString());
  }

  void onUnitySceneLoaded(SceneLoaded? scene) {
    log('Scene Loaded');
    // print('Received scene loaded from unity: ${scene.name}');
    // print('Received scene loaded from unity buildIndex: ${scene.buildIndex}');
  }

  // Callback that connects the created controller to the unity controller
  // ignore: use_setters_to_change_properties
  void _onUnityCreated(UnityWidgetController controller) {
    log('Unity Created');
    log(widget.name);
    _unityWidgetController = controller;
    _unityWidgetController?.postMessage(
        'GameManager', 'InvokePokemon', widget.name);
  }
}
