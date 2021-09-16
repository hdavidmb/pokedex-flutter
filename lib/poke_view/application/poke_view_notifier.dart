import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/domain/failures/database_failure.dart';
import 'package:pokedex_flutter/core/domain/types.dart';
import 'package:pokedex_flutter/poke_view/application/poke_state.dart';
import 'package:pokedex_flutter/poke_view/domain/poke_api_response.dart';
import 'package:pokedex_flutter/poke_view/domain/poke_data.dart';
import 'package:pokedex_flutter/poke_view/repositories/i_poke_repo.dart';

class PokeViewNotifier extends ChangeNotifier {
  late PokeState _innerPokeState;
  late PokeData _pokeData;
  IPokeViewRepo pokeViewRepo;
  PokeViewNotifier({required this.pokeViewRepo}) {
    _innerPokeState = Initial();
    _pokeData = PokeData.empty();
  }

  set _pokeSate(PokeState newstate) {
    print("Updating the poke sate");
    this._innerPokeState = newstate;
    notifyListeners();
  }

  PokeData get pokeData {
    return this._pokeData;
  }

  PokeState get pokeState {
    return _innerPokeState;
  }

  void fecthPokeData(String pokeId) async {
    _pokeSate = Loading();

    final Either<DatabaseFailure, PokeApiResponse> response =
        await pokeViewRepo.fetchPokeInfo(pokeId);

    response.fold((l) => null, (response) {
      _pokeData = PokeData.fromPokeApiResponse(response);
    });
    //await Future.delayed(Duration(seconds: 4));

    _pokeSate = Ready();
  }
}
