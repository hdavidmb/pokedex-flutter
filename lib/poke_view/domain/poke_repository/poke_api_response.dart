import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/domain/types.dart';

class PokeApiPokemonResponse {
  int height;
  int weight;
  int pokeId;
  String name;
  Map<String, bool> abilities; // Name : true | false about is hidden
  int baseExperience;
  List<String> types;

  PokeApiPokemonResponse(
      {required this.height,
      required this.weight,
      required this.pokeId,
      required this.name,
      required this.abilities,
      required this.baseExperience,
      required this.types});

  factory PokeApiPokemonResponse.empty() {
    return PokeApiPokemonResponse(
      height: 0,
      weight: 0,
      pokeId: 0,
      name: "",
      abilities: {},
      baseExperience: 0,
      types: List.empty(),
    );
  }
  factory PokeApiPokemonResponse.fromJson(Map<String, dynamic> pokeInfo) {
    print(pokeInfo['abilities']);
    return PokeApiPokemonResponse(
      name: pokeInfo['name'],
      pokeId: pokeInfo['id'],
      height: pokeInfo['height'],
      weight: pokeInfo['weight'],
      baseExperience: pokeInfo['base_experience'],
      abilities: (pokeInfo['abilities'] as List)
          .map((item) => item as Map<String, dynamic>)
          .map((ability) {
        bool isVisible = ability['is_hidden'] as bool;
        String name =
            (ability['ability']['name'] as String).replaceAll("-", " ");

        return {name: isVisible};
      }).reduce((value, element) {
        value.addAll(element);
        return value;
      }),
      types: getTypesFromJson(pokeInfo),
    );
  }
}
