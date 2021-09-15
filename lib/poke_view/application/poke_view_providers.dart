import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/poke_view/application/poke_view_notifier.dart';

final pokeViewNotifierProvider =
    ChangeNotifierProvider<PokeViewNotifier>((ref) {
  return PokeViewNotifier();
});
