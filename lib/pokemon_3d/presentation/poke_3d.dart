import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:pokedex_flutter/core/presentation/app_bar.dart';

class Poke3D extends StatefulWidget {
  const Poke3D({Key? key}) : super(key: key);

  @override
  _Poke3DState createState() => _Poke3DState();
}

class _Poke3DState extends State<Poke3D> {
  UnityWidgetController? _unityWidgetController;
  double _sliderValue = 0;

  @override
  void initState() {
    super.initState();
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
        onHorizontalDragUpdate: (DragUpdateDetails details) {
          setState(() {
            _sliderValue -= details.delta.dx * 1.5;
          });
          setRotationSpeed(_sliderValue.toString());
        },
        child: UnityWidget(
          onUnityCreated: _onUnityCreated,
          onUnityMessage: onUnityMessage,
          // onUnitySceneLoaded: onUnitySceneLoaded,
        ),
      ),
    );
  }

  void setRotationSpeed(String speed) {
    _unityWidgetController?.postMessage(
      'MewPrefab',
      'SetRotationSpeed',
      speed,
    );
  }

  void onUnityMessage(message) {
    // print('Received message from unity: ${message.toString()}');
  }

  void onUnitySceneLoaded(SceneLoaded scene) {
    print('Received scene loaded from unity: ${scene.name}');
    print('Received scene loaded from unity buildIndex: ${scene.buildIndex}');
  }

  // Callback that connects the created controller to the unity controller
  // ignore: use_setters_to_change_properties
  void _onUnityCreated(UnityWidgetController controller) {
    _unityWidgetController = controller;
  }
}
