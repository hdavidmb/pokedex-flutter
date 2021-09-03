import 'package:flutter/material.dart';
import 'package:pokedex_flutter/config/app_images.dart';
import 'package:pokedex_flutter/core/presentation/widgets/pokemon_card/pokemon_card.dart';
import 'package:pokedex_flutter/pokemon_list/domain/pokemon_list_item.dart';

class PokemonListPage extends StatefulWidget {
  PokemonListPage({
    Key? key,
  }) : super(key: key);

  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  final List<PokemonListItem> pokemonList = [
    PokemonListItem(
      number: 1,
      name: 'Bulbasaur',
      types: [Types.grass, Types.poison],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
    ),
    PokemonListItem(
      number: 2,
      name: 'Ivysaur',
      types: [Types.grass, Types.poison],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png',
    ),
    PokemonListItem(
      number: 3,
      name: 'Venusaur',
      types: [Types.grass, Types.poison],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png',
    ),
    PokemonListItem(
      number: 4,
      name: 'Charmander',
      types: [Types.fire],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
    ),
    PokemonListItem(
      number: 5,
      name: 'Charmeleon',
      types: [Types.fire],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png',
    ),
    PokemonListItem(
      number: 6,
      name: 'Charizard',
      types: [Types.fire, Types.flying],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png',
    ),
    PokemonListItem(
      number: 7,
      name: 'Squirtle',
      types: [Types.water],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png',
    ),
    PokemonListItem(
      number: 8,
      name: 'Wartortle',
      types: [Types.water],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/8.png',
    ),
    PokemonListItem(
      number: 9,
      name: 'Blastoise',
      types: [Types.water],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/9.png',
    ),
  ];

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await AppImages.precacheAssets(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: ListView.builder(
            itemCount: pokemonList.length,
            itemBuilder: (_, index) =>
                PokemonCard(pokemon: pokemonList[index], onPressed: () {})),
      ),
    );
  }
}
