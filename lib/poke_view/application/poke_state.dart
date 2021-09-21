import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'poke_state.freezed.dart';

@freezed
class PokeState with _$PokeState {
  const PokeState._();
  const factory PokeState.initial() = Initial;
  const factory PokeState.loading() = Loading;
  const factory PokeState.ready() = Ready;
  const factory PokeState.onError() = Error;
}
