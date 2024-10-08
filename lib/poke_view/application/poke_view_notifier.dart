import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/domain/failures/database_failure.dart';
import 'package:pokedex_flutter/core/domain/types.dart';
import 'package:pokedex_flutter/poke_view/application/poke_state.dart';
import 'package:pokedex_flutter/poke_view/domain/poke_repository/poke_api_response.dart';
import 'package:pokedex_flutter/poke_view/domain/poke_data.dart';
import 'package:pokedex_flutter/poke_view/domain/poke_repository/poke_api_specie_response.dart';
import 'package:pokedex_flutter/poke_view/repositories/i_poke_repo.dart';

class PokeViewNotifier extends ChangeNotifier {
  late PokeState _innerPokeState;
  late PokeData _pokeData;
  IPokeViewRepo pokeViewRepo;
  PokeViewNotifier({required this.pokeViewRepo}) {
    _innerPokeState = const Initial();
    _pokeData = PokeData.empty();
  }

  // ignore: avoid_setters_without_getters
  set _pokeSate(PokeState newstate) {
    _innerPokeState = newstate;
    notifyListeners();
  }

  PokeData get pokeData {
    return _pokeData;
  }

  PokeState get pokeState {
    return _innerPokeState;
  }

  Future<void> fecthPokeData(String pokeId) async {
    _pokeSate = const Loading();

    final Either<DatabaseFailure, PokeApiPokemonResponse> response =
        await pokeViewRepo.fetchPokeInfo(pokeId);

    final Either<DatabaseFailure, PokeSpecieResponse> responseFromSpecie =
        await pokeViewRepo.fetchPokeSpecieInfo(pokeId);

    response.fold((l) => null, (poke) {
      responseFromSpecie.fold((l) => null, (specie) {
        _pokeData = PokeData(
            abilities: poke.abilities,
            pokeId: poke.pokeId,
            baseExperience: poke.baseExperience,
            pokeHeight: poke.height.toDouble() / 10, // To meters
            pokeWeight: poke.weight.toDouble() / 10, // To Kg
            types: poke.types.map((e) => typeFromString(e)).toList(),
            pokeName: poke.name,
            baseFriendship: specie.baseHappiness,
            catchRate: specie.catchRate,
            evYield: "",
            growthRate: specie.growthRate,
            description: specie.flavorTextEntry);
      });
    });
    //await Future.delayed(const Duration(milliseconds: 200));

    _pokeSate = const Ready();
  }
}
