import 'dart:convert';

import 'package:pokedex_flutter/poke_view/domain/poke_api_response.dart';
import 'package:pokedex_flutter/core/domain/failures/database_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_flutter/poke_view/repositories/i_poke_repo.dart';

class PokeApiRepo extends IPokeViewRepo {
  final String POKE_URL = "https://pokeapi.co/api/v2/pokemon";

  @override
  Future<Either<DatabaseFailure, PokeApiResponse>> fetchPokeInfo(
      String pokeId) async {
    final response = await http.get(Uri.parse('$POKE_URL/$pokeId'));
    print(response.body);
    print('$POKE_URL/$pokeId');
    if (response.statusCode == 200) {
      return right(PokeApiResponse.fromJson(jsonDecode(response.body)));
    } else {
      return left(DatabaseFailure.serverFailure());
    }
  }
}
