import 'dart:convert';

import 'package:pokedex_flutter/poke_view/domain/poke_repository/poke_api_response.dart';
import 'package:pokedex_flutter/core/domain/failures/database_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_flutter/poke_view/domain/poke_repository/poke_api_specie_response.dart';
import 'package:pokedex_flutter/poke_view/repositories/i_poke_repo.dart';

class PokeApiRepo extends IPokeViewRepo {
  final String pokeUrl = "https://pokeapi.co/api/v2";

  @override
  Future<Either<DatabaseFailure, PokeApiPokemonResponse>> fetchPokeInfo(
      String pokeId) async {
    final String id = pokeId.toLowerCase();

    final pokeInfo = await http.get(Uri.parse('$pokeUrl/pokemon/$id'));

    if (pokeInfo.statusCode == 200) {
      return right(
        PokeApiPokemonResponse.fromJson(
          jsonDecode(pokeInfo.body) as Map<String, dynamic>,
        ),
      );
    } else {
      return left(const DatabaseFailure.serverFailure());
    }
  }

  @override
  Future<Either<DatabaseFailure, PokeSpecieResponse>> fetchPokeSpecieInfo(
      String pokeId) async {
    final String id = pokeId.toLowerCase();
    final pokeSpecie =
        await http.get(Uri.parse('$pokeUrl/pokemon-species/$id'));
    if (pokeSpecie.statusCode == 200) {
      return right(
        PokeSpecieResponse.fromJson(
          jsonDecode(pokeSpecie.body) as Map<String, dynamic>,
        ),
      );
    } else {
      return left(const DatabaseFailure.serverFailure());
    }
  }
}
