class PokeApiResponse {
  String? pokeName;
  String? pokeId;
  String? pokeImageUrl;
  List<String>? types;
  String? description;

  PokeApiResponse._empty();

  PokeApiResponse({
    required this.pokeName,
    required this.pokeId,
    required this.pokeImageUrl,
    required this.types,
    required this.description,
  });

  factory PokeApiResponse.fromJson(Map<String, dynamic> json) {
    return PokeApiResponse(
        pokeName: json['name'],
        pokeId: json['id'].toString(),
        pokeImageUrl: json['sprites']['other']['official-artwork']
            ['front_default'],
        types: ['fire'],
        description: 'dude');
  }
}
