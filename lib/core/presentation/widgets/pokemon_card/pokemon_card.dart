import 'package:flutter/material.dart';
import 'package:pokedex_flutter/pokemon_list/domain/pokemon_list_item.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemon, required this.onPressed})
      : super(key: key);

  final PokemonListItem pokemon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
      child: PokemonCardBackground(
        backgroundColor: pokemon.types[0].color,
      ),
    );
  }
}

class PokemonCardBackground extends StatelessWidget {
  const PokemonCardBackground({
    Key? key,
    required this.backgroundColor,
  }) : super(key: key);

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Stack(
        children: [
          Container(
            height: 100.0,
            width: double.infinity,
            color: backgroundColor,
          )
        ],
      ),
    );
  }
}
