// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pokemon_list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PokemonListItemTearOff {
  const _$PokemonListItemTearOff();

  _PokemonListItem call(
      {required int number,
      required String name,
      required List<Types> types,
      required String imageUrl}) {
    return _PokemonListItem(
      number: number,
      name: name,
      types: types,
      imageUrl: imageUrl,
    );
  }
}

/// @nodoc
const $PokemonListItem = _$PokemonListItemTearOff();

/// @nodoc
mixin _$PokemonListItem {
  int get number => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<Types> get types => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PokemonListItemCopyWith<PokemonListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonListItemCopyWith<$Res> {
  factory $PokemonListItemCopyWith(
          PokemonListItem value, $Res Function(PokemonListItem) then) =
      _$PokemonListItemCopyWithImpl<$Res>;
  $Res call({int number, String name, List<Types> types, String imageUrl});
}

/// @nodoc
class _$PokemonListItemCopyWithImpl<$Res>
    implements $PokemonListItemCopyWith<$Res> {
  _$PokemonListItemCopyWithImpl(this._value, this._then);

  final PokemonListItem _value;
  // ignore: unused_field
  final $Res Function(PokemonListItem) _then;

  @override
  $Res call({
    Object? number = freezed,
    Object? name = freezed,
    Object? types = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      types: types == freezed
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<Types>,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PokemonListItemCopyWith<$Res>
    implements $PokemonListItemCopyWith<$Res> {
  factory _$PokemonListItemCopyWith(
          _PokemonListItem value, $Res Function(_PokemonListItem) then) =
      __$PokemonListItemCopyWithImpl<$Res>;
  @override
  $Res call({int number, String name, List<Types> types, String imageUrl});
}

/// @nodoc
class __$PokemonListItemCopyWithImpl<$Res>
    extends _$PokemonListItemCopyWithImpl<$Res>
    implements _$PokemonListItemCopyWith<$Res> {
  __$PokemonListItemCopyWithImpl(
      _PokemonListItem _value, $Res Function(_PokemonListItem) _then)
      : super(_value, (v) => _then(v as _PokemonListItem));

  @override
  _PokemonListItem get _value => super._value as _PokemonListItem;

  @override
  $Res call({
    Object? number = freezed,
    Object? name = freezed,
    Object? types = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_PokemonListItem(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      types: types == freezed
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<Types>,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PokemonListItem extends _PokemonListItem {
  const _$_PokemonListItem(
      {required this.number,
      required this.name,
      required this.types,
      required this.imageUrl})
      : super._();

  @override
  final int number;
  @override
  final String name;
  @override
  final List<Types> types;
  @override
  final String imageUrl;

  @override
  String toString() {
    return 'PokemonListItem(number: $number, name: $name, types: $types, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PokemonListItem &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.types, types) ||
                const DeepCollectionEquality().equals(other.types, types)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(number) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(types) ^
      const DeepCollectionEquality().hash(imageUrl);

  @JsonKey(ignore: true)
  @override
  _$PokemonListItemCopyWith<_PokemonListItem> get copyWith =>
      __$PokemonListItemCopyWithImpl<_PokemonListItem>(this, _$identity);
}

abstract class _PokemonListItem extends PokemonListItem {
  const factory _PokemonListItem(
      {required int number,
      required String name,
      required List<Types> types,
      required String imageUrl}) = _$_PokemonListItem;
  const _PokemonListItem._() : super._();

  @override
  int get number => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  List<Types> get types => throw _privateConstructorUsedError;
  @override
  String get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PokemonListItemCopyWith<_PokemonListItem> get copyWith =>
      throw _privateConstructorUsedError;
}
