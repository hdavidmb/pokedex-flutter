class PokeSpecieResponse {
  final String flavorTextEntry;
  final int catchRate;
  final String growthRate;
  final int baseHappiness;

  PokeSpecieResponse({
    required this.flavorTextEntry,
    required this.catchRate,
    required this.growthRate,
    required this.baseHappiness,
  });

  factory PokeSpecieResponse.fromJson(Map<String, dynamic> json) {
    final String desc = (json['flavor_text_entries'] as List).firstWhere(
        (internalMap) =>
            (internalMap['language']['name'] as String) == 'en' &&
            (internalMap['version']['name'] as String) ==
                'ruby')['flavor_text'] as String;
    return PokeSpecieResponse(
        catchRate: json['capture_rate'] as int,
        growthRate: json['growth_rate']['name'] as String,
        baseHappiness: json['base_happiness'] as int,
        flavorTextEntry: desc);
  }
}
