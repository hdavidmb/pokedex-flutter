import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_flutter/core/domain/types.dart';

export 'package:pokedex_flutter/core/domain/types.dart';

part 'pokemon_list_item.freezed.dart';

@freezed
class PokemonListItem with _$PokemonListItem {
  const factory PokemonListItem({
    required int number,
    required String name,
    required List<Types> types,
    required String imageUrl,
  }) = _PokemonListItem;

  const PokemonListItem._();
}
