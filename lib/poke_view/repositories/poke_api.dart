import 'dart:convert';

import 'package:pokedex_flutter/poke_view/domain/poke_repository/poke_api_response.dart';
import 'package:pokedex_flutter/core/domain/failures/database_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_flutter/poke_view/domain/poke_repository/poke_api_specie_response.dart';
import 'package:pokedex_flutter/poke_view/repositories/i_poke_repo.dart';

class PokeApiRepo extends IPokeViewRepo {
  final String POKE_URL = "https://pokeapi.co/api/v2";

  @override
  Future<Either<DatabaseFailure, PokeApiPokemonResponse>> fetchPokeInfo(
      String pokeId) async {
    pokeId = pokeId.toLowerCase();

    final pokeInfo = await http.get(Uri.parse('$POKE_URL/pokemon/$pokeId'));

    if (pokeInfo.statusCode == 200) {
      return right(
        PokeApiPokemonResponse.fromJson(
          jsonDecode(pokeInfo.body),
        ),
      );
    } else {
      return left(DatabaseFailure.serverFailure());
    }
  }

  @override
  Future<Either<DatabaseFailure, PokeSpecieResponse>> fetchPokeSpecieInfo(
      String pokeId) async {
    pokeId = pokeId.toLowerCase();
    final pokeSpecie =
        await http.get(Uri.parse('$POKE_URL/pokemon-species/$pokeId'));
    print('$POKE_URL/pokemon-species/$pokeId');
    print(pokeSpecie.statusCode);
    print(pokeSpecie.body);
    if (pokeSpecie.statusCode == 200) {
      return right(
        PokeSpecieResponse.fromJson(
          jsonDecode(pokeSpecie.body),
        ),
      );
    } else {
      print("On status code ");
      return left(DatabaseFailure.serverFailure());
    }
  }
}
