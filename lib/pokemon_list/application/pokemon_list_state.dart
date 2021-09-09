import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_list_state.freezed.dart';

@freezed
class PokemonListState with _$PokemonListState {
  const PokemonListState._();
  const factory PokemonListState.initial() = Initial;
  const factory PokemonListState.loading() = Loading;
  const factory PokemonListState.ready() = Ready;
  const factory PokemonListState.error() = Error;
}
