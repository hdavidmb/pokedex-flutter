import 'package:flutter/material.dart';
import 'package:pokedex_flutter/pokemon_list/application/pokemon_list_state.dart';
import 'package:pokedex_flutter/pokemon_list/data/pokemon_list_data_source.dart';
import 'package:pokedex_flutter/pokemon_list/domain/pokemon_list_item.dart';

class PokemonListChangeNotifier extends ChangeNotifier {
  final PokemonListDataSource pokemonListDataSource;
  PokemonListChangeNotifier({required this.pokemonListDataSource}) {
    getPokemonList();
  }

  PokemonListState _listState = PokemonListState.initial();
  PokemonListState get state => _listState;
  set _state(PokemonListState state) {
    _listState = state;
    notifyListeners();
  }

  List<PokemonListItem> pokemonList = [];
  int _page = 1;

  Future<void> getPokemonList() async {
    if (state != PokemonListState.loading()) {
      _state = PokemonListState.loading();
      final result = await pokemonListDataSource.getPokemonList(page: _page);
      result.fold(
        (l) => _state = PokemonListState.error(),
        (r) {
          pokemonList.addAll(r);
          _page++;
          _state = PokemonListState.ready();
        },
      );
    }
  }
}
