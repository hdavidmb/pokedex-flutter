import 'package:pokedex_flutter/core/domain/types.dart';

class PokeData {
  String? pokeName;
  String? pokeId;
  String? pokeImageUrl;
  List<Types>? types;
  String? description;

  PokeData._empty();

  PokeData({
    required this.pokeName,
    required this.pokeId,
    required this.pokeImageUrl,
    required this.types,
    required this.description,
  });

  factory PokeData.empty() {
    return PokeData._empty();
  }
}
