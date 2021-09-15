import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/domain/types.dart';
import 'package:pokedex_flutter/poke_view/application/poke_state.dart';
import 'package:pokedex_flutter/poke_view/domain/poke_data.dart';

class PokeViewNotifier extends ChangeNotifier {
  late PokeState _pokeState;
  late PokeData _pokeData;

  PokeViewNotifier() {
    _pokeState = Initial();
    _pokeData = PokeData.empty();
  }

  set _pokeSate(PokeState newstate) {
    print("Updating the poke sate");
    this._pokeState = newstate;
    notifyListeners();
  }

  get pokeState {
    return _pokeState;
  }

  void fecthPokeData(String pokeId) async {
    _pokeSate = Loading();

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
