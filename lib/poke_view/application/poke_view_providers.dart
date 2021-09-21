import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/poke_view/application/poke_view_notifier.dart';
import 'package:pokedex_flutter/poke_view/repositories/i_poke_repo.dart';
import 'package:pokedex_flutter/poke_view/repositories/poke_api.dart';

final pokeApiRepoProvider = Provider<IPokeViewRepo>((ref) {
  return PokeApiRepo();
});

final pokeViewNotifierProvider =
    ChangeNotifierProvider<PokeViewNotifier>((ref) {
  final IPokeViewRepo repo = ref.read(pokeApiRepoProvider);
  return PokeViewNotifier(pokeViewRepo: repo);
});
