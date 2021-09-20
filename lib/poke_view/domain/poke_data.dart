import 'package:pokedex_flutter/core/domain/types.dart';
import 'package:pokedex_flutter/poke_view/domain/poke_repository/poke_api_response.dart';
export 'package:pokedex_flutter/core/domain/types.dart';

class PokeData {
  String pokeName;
  int pokeId;
  double pokeHeight;
  double pokeWeight;
  List<Types> types;
  Map<String, bool> abilities;
  int baseExperience;

  // From species info

  final String evYield;
  final int catchRate;
  final int baseFriendship;
  final String growthRate;
  final String description;

  PokeData(
      {required this.pokeName,
      required this.pokeId,
      required this.pokeHeight,
      required this.pokeWeight,
      required this.types,
      required this.abilities,
      required this.baseExperience,
      required this.baseFriendship,
      required this.catchRate,
      required this.evYield,
      required this.growthRate,
      required this.description});

  factory PokeData.empty() {
    return PokeData(
        abilities: {},
        pokeHeight: 0,
        pokeId: 0,
        baseExperience: 0,
        pokeName: "",
        pokeWeight: 0,
        types: [],
        baseFriendship: 0,
        catchRate: 0,
        evYield: "",
        growthRate: "",
        description: "");
  }
}
