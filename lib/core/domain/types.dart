import 'package:flutter/material.dart' show AssetImage, Color;
import 'package:pokedex_flutter/config/app_colors.dart';
import 'package:pokedex_flutter/config/app_images.dart';

enum Types {
  bug,
  dark,
  dragon,
  electric,
  fairy,
  fighting,
  fire,
  flying,
  ghost,
  grass,
  ground,
  ice,
  normal,
  poison,
  psychic,
  rock,
  steel,
  water,
}

extension TypesX on Types {
  Color get color {
    switch (this) {
      case Types.bug:
        return AppColors.lightTeal;
      case Types.dark:
        return AppColors.black;
      case Types.dragon:
        return AppColors.violet;
      case Types.electric:
        return AppColors.lightYellow;
      case Types.fairy:
        return AppColors.pink;
      case Types.fighting:
        return AppColors.red;
      case Types.fire:
        return AppColors.lightRed;
      case Types.flying:
        return AppColors.lilac;
      case Types.ghost:
        return AppColors.purple;
      case Types.grass:
        return AppColors.lightGreen;
      case Types.ground:
        return AppColors.darkBrown;
      case Types.ice:
        return AppColors.lightCyan;
      case Types.normal:
        return AppColors.beige;
      case Types.poison:
        return AppColors.lightPurple;
      case Types.psychic:
        return AppColors.lightPink;
      case Types.rock:
        return AppColors.lightBrown;
      case Types.steel:
        return AppColors.grey;
      case Types.water:
        return AppColors.lightBlue;
      default:
        return AppColors.lightBlue;
    }
  }

  AssetImage get icon {
    switch (this) {
      case Types.bug:
        return AppImages.bugTypeIcon;
      case Types.dark:
        return AppImages.darkTypeIcon;
      case Types.dragon:
        return AppImages.dragonTypeIcon;
      case Types.electric:
        return AppImages.electricTypeIcon;
      case Types.fairy:
        return AppImages.fairyTypeIcon;
      case Types.fighting:
        return AppImages.fightingTypeIcon;
      case Types.fire:
        return AppImages.fireTypeIcon;
      case Types.flying:
        return AppImages.flyingTypeIcon;
      case Types.ghost:
        return AppImages.ghostTypeIcon;
      case Types.grass:
        return AppImages.grassTypeIcon;
      case Types.ground:
        return AppImages.groundTypeIcon;
      case Types.ice:
        return AppImages.iceTypeIcon;
      case Types.normal:
        return AppImages.normalTypeIcon;
      case Types.poison:
        return AppImages.poisonTypeIcon;
      case Types.psychic:
        return AppImages.psychicTypeIcon;
      case Types.rock:
        return AppImages.rockTypeIcon;
      case Types.steel:
        return AppImages.steelTypeIcon;
      case Types.water:
        return AppImages.waterTypeIcon;
      default:
        return AppImages.normalTypeIcon;
    }
  }
}
