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
  static const halfPokeBall = _Image('half-pokeball-2.png');

  static const bugTypeIcon = _Image('type_icons/bug.png');
  static const darkTypeIcon = _Image('type_icons/dark.png');
  static const dragonTypeIcon = _Image('type_icons/dragon.png');
  static const electricTypeIcon = _Image('type_icons/electric.png');
  static const fairyTypeIcon = _Image('type_icons/fairy.png');
  static const fightingTypeIcon = _Image('type_icons/fighting.png');
  static const fireTypeIcon = _Image('type_icons/fire.png');
  static const flyingTypeIcon = _Image('type_icons/flying.png');
  static const ghostTypeIcon = _Image('type_icons/ghost.png');
  static const grassTypeIcon = _Image('type_icons/grass.png');
  static const groundTypeIcon = _Image('type_icons/ground.png');
  static const iceTypeIcon = _Image('type_icons/ice.png');
  static const normalTypeIcon = _Image('type_icons/normal.png');
  static const poisonTypeIcon = _Image('type_icons/poison.png');
  static const psychicTypeIcon = _Image('type_icons/psychic.png');
  static const rockTypeIcon = _Image('type_icons/rock.png');
  static const steelTypeIcon = _Image('type_icons/steel.png');
  static const waterTypeIcon = _Image('type_icons/water.png');

  static void precacheAssets(BuildContext context) {
    precacheImage(pokeball, context);
    precacheImage(male, context);
    precacheImage(female, context);
    precacheImage(dotted, context);
    precacheImage(pikloader, context);
    precacheImage(halfPokeBall, context);

    precacheImage(bugTypeIcon, context);
    precacheImage(darkTypeIcon, context);
    precacheImage(dragonTypeIcon, context);
    precacheImage(electricTypeIcon, context);
    precacheImage(fairyTypeIcon, context);
    precacheImage(fightingTypeIcon, context);
    precacheImage(fireTypeIcon, context);
    precacheImage(flyingTypeIcon, context);
    precacheImage(ghostTypeIcon, context);
    precacheImage(grassTypeIcon, context);
    precacheImage(groundTypeIcon, context);
    precacheImage(iceTypeIcon, context);
    precacheImage(normalTypeIcon, context);
    precacheImage(poisonTypeIcon, context);
    precacheImage(psychicTypeIcon, context);
    precacheImage(rockTypeIcon, context);
    precacheImage(steelTypeIcon, context);
    precacheImage(waterTypeIcon, context);
  }
}
