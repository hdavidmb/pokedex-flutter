import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/pokemon_list/application/pokemon_list_change_notifier.dart';
import 'package:pokedex_flutter/pokemon_list/data/pokemon_list_data_source.dart';

final pokemonListDataSourceProvider = Provider<PokemonListDataSource>((ref) {
  return PokemonListDataSource();
});

final pokemonListChangeNotifierProvider =
    ChangeNotifierProvider<PokemonListChangeNotifier>(
  (ref) {
    final PokemonListDataSource _pokemonListDataSource =
        ref.read(pokemonListDataSourceProvider);
    return PokemonListChangeNotifier(
        pokemonListDataSource: _pokemonListDataSource);
  },
);
