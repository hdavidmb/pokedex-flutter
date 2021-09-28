import 'package:flutter/material.dart';
import 'package:pokedex_flutter/config/app_images.dart';

class PikaLoader extends StatelessWidget {
  const PikaLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Image(
        image: AppImages.pikloader,
        fit: BoxFit.contain,
        width: 150,
        height: 150,
      ),
    );
  }
}
