import 'package:dartz/dartz.dart';
import 'package:pokedex_flutter/core/domain/failures/database_failure.dart';
import 'package:pokedex_flutter/poke_view/domain/poke_api_response.dart';

abstract class IPokeViewRepo {
  Future<Either<DatabaseFailure, PokeApiResponse>> fetchPokeInfo(String pokeId);
}
