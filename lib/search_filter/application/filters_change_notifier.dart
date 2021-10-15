import 'package:flutter/material.dart';
import 'package:pokedex_flutter/search_filter/domain/generation.dart';
import 'package:pokedex_flutter/core/domain/types.dart';

class FiltersChangeNotifier extends ChangeNotifier {
  String _name = '';
  List<Types> _types = [];
  GenerationFilter _generation = GenerationFilter.none;

  bool get isFiltered =>
      _name.isNotEmpty ||
      _types.isNotEmpty ||
      _generation != GenerationFilter.none;

  void setFilters(
      {String? name, List<Types>? types, GenerationFilter? generation}) {
    if (name != null) _name = name;
    if (types != null) _types = types;
    if (generation != null) _generation = generation;
    if (name != null || types != null || generation != null) notifyListeners();
  }
}
