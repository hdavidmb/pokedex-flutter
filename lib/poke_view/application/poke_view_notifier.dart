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

    response.fold((l) {
      print("Error dude");
      print(l.toString());
    }, (r) {
      print("So far so good");
      print(r.description);
      print(r.pokeId);
      print(r.pokeImageUrl);
      print(r.pokeName);
    });

    await Future.delayed(Duration(seconds: 4));

    _pokeData = PokeData(
      pokeName: "Charmander",
      pokeId: "#004",
      pokeImageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
      types: [Types.fire],
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta neque odio, at rutrum orci vulputate vitae. Sed elementum molestie mauris, vitae fringilla purus condimentum at. Fusce sit amet tincidunt libero. Integer non vulputate turpis, vitae mattis quam. Vestibulum placerat fringilla vehicula. Proin euismod imperdiet nisi. Ut laoreet a eros sed rutrum.",
    );
    _pokeSate = Ready();
  }
}
