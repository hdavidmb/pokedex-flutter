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
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/001.png',
    ),
    PokemonListItem(
      number: 2,
      name: 'Ivysaur',
      types: [Types.grass, Types.poison],
      imageUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/002.png',
    ),
    PokemonListItem(
      number: 3,
      name: 'Venusaur',
      types: [Types.grass, Types.poison],
      imageUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/003.png',
    ),
    PokemonListItem(
      number: 4,
      name: 'Charmander',
      types: [Types.fire],
      imageUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/004.png',
    ),
    PokemonListItem(
      number: 5,
      name: 'Charmeleon',
      types: [Types.fire],
      imageUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/005.png',
    ),
    PokemonListItem(
      number: 6,
      name: 'Charizard',
      types: [Types.fire],
      imageUrl:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/006.png',
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
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView.builder(
            itemCount: pokemonList.length,
            itemBuilder: (_, index) =>
                PokemonCard(pokemon: pokemonList[index], onPressed: () {})),
      ),
    );
  }
}
