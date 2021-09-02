import 'package:flutter/material.dart' show Color;
import 'package:pokedex_flutter/config/app_colors.dart';

enum Types {
  grass,
  poison,
  fire,
  flying,
  water,
  bug,
  normal,
  electric,
  ground,
  fairy,
  fighting,
  psychic,
  rock,
  steel,
  ice,
  ghost,
  dragon,
  dark,
  monster,
  unknown,
}

extension TypesX on Types {
  Color get color {
    switch (this) {
      case Types.grass:
        return AppColors.lightGreen;

      case Types.bug:
        return AppColors.lightTeal;

      case Types.fire:
        return AppColors.lightRed;

      case Types.water:
        return AppColors.lightBlue;

      case Types.fighting:
        return AppColors.red;

      case Types.normal:
        return AppColors.beige;

      case Types.electric:
        return AppColors.lightYellow;

      case Types.psychic:
        return AppColors.lightPink;

      case Types.poison:
        return AppColors.lightPurple;

      case Types.ghost:
        return AppColors.purple;

      case Types.ground:
        return AppColors.darkBrown;

      case Types.rock:
        return AppColors.lightBrown;

      case Types.dark:
        return AppColors.black;

      case Types.dragon:
        return AppColors.violet;

      case Types.fairy:
        return AppColors.pink;

      case Types.flying:
        return AppColors.lilac;

      case Types.ice:
        return AppColors.lightCyan;

      case Types.steel:
        return AppColors.grey;

      default:
        return AppColors.lightBlue;
    }
  }
}
