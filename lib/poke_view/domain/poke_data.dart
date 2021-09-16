import 'package:pokedex_flutter/core/domain/types.dart';
import 'package:pokedex_flutter/poke_view/domain/poke_api_response.dart';
export 'package:pokedex_flutter/core/domain/types.dart';

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

  factory PokeData.fromPokeApiResponse(PokeApiResponse response) {
    String internalPokeId = response.pokeId!;
    String pokeApi = internalPokeId.length == 3
        ? '#$internalPokeId'
        : internalPokeId.length == 2
            ? '#0$internalPokeId'
            : '#00$internalPokeId';

    return PokeData(
        description: response.description,
        pokeName: response.pokeName,
        pokeId: pokeApi,
        pokeImageUrl: response.pokeImageUrl,
        types: fromStringToTypes(response.types!));
  }
}
