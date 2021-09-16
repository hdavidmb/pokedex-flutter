import 'package:flutter/material.dart';
import 'package:pokedex_flutter/pokemon_list/application/pokemon_list_state.dart';
import 'package:pokedex_flutter/pokemon_list/data/pokemon_list_data_source.dart';
import 'package:pokedex_flutter/pokemon_list/domain/pokemon_list_item.dart';

class PokemonListChangeNotifier extends ChangeNotifier {
  final PokemonListDataSource pokemonListDataSource;
  PokemonListChangeNotifier({required this.pokemonListDataSource}) {
    getPokemonList();
  }

  PokemonListState _listState = const PokemonListState.initial();
  PokemonListState get state => _listState;
  // ignore: avoid_setters_without_getters
  set _state(PokemonListState state) {
    _listState = state;
    notifyListeners();
  }

  List<PokemonListItem> pokemonList = [];
  int _page = 1;

  Future<void> getPokemonList() async {
    if (state != const PokemonListState.loading()) {
      _state = const PokemonListState.loading();
      final result = await pokemonListDataSource.getPokemonList(page: _page);
      result.fold(
        (l) => _state = const PokemonListState.error(),
        (r) {
          if (r.isNotEmpty) {
            pokemonList.addAll(r);
            _page++;
          }
          _state = const PokemonListState.ready();
        },
      );
    }
  }
}
