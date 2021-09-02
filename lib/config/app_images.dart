import 'package:flutter/material.dart';

const String _imagePath = 'assets/images';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class AppImages {
  static const pokeball = _Image('pokeball.png');
  static const male = _Image('male.png');
  static const female = _Image('female.png');
  static const dotted = _Image('dotted.png');
  static const pikloader = _Image('pika_loader.gif');

  static Future precacheAssets(BuildContext context) async {
    await precacheImage(pokeball, context);
    await precacheImage(male, context);
    await precacheImage(female, context);
    await precacheImage(dotted, context);
    await precacheImage(pikloader, context);
  }
}
