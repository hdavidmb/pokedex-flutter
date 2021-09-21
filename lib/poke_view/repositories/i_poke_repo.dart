import 'package:dartz/dartz.dart';
import 'package:pokedex_flutter/core/domain/failures/database_failure.dart';
import 'package:pokedex_flutter/poke_view/domain/poke_repository/poke_api_response.dart';
import 'package:pokedex_flutter/poke_view/domain/poke_repository/poke_api_specie_response.dart';

abstract class IPokeViewRepo {
  Future<Either<DatabaseFailure, PokeApiPokemonResponse>> fetchPokeInfo(
      String pokeId);
  Future<Either<DatabaseFailure, PokeSpecieResponse>> fetchPokeSpecieInfo(
      String pokeId);
}
