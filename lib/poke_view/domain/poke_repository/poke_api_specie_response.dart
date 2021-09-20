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
            internalMap['language']['name'] == 'en' &&
            internalMap['version']['name'] == 'ruby')['flavor_text'];
    print('--------->' + desc);

    return PokeSpecieResponse(
        catchRate: json['capture_rate'],
        growthRate: json['growth_rate']['name'],
        baseHappiness: json['base_happiness'],
        flavorTextEntry: desc);
  }
}
