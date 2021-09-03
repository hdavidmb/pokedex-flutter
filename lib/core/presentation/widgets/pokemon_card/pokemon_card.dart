import 'package:flutter/material.dart';
import 'package:pokedex_flutter/config/app_images.dart';
import 'package:pokedex_flutter/core/presentation/widgets/types_wrap/types_wrap.dart';
import 'package:pokedex_flutter/pokemon_list/domain/pokemon_list_item.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemon, required this.onPressed})
      : super(key: key);

  final PokemonListItem pokemon;
  final Function onPressed;

  final double itemHeight = 120.0;
  final double offset = 22.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: itemHeight + offset,
          ),
          PokemonCardBackground(
            type: pokemon.types[0],
            height: itemHeight,
          ),
          Positioned(
            top: 0.0,
            right: itemHeight * 0.1,
            child: Hero(
              tag: pokemon.name, //TODO: sync with details image
              child: Image(
                image: NetworkImage(pokemon.imageUrl),
                height: itemHeight * 1.08,
              ),
            ),
          ),
          Positioned(
            left: 25.0,
            bottom: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('#${pokemon.number.toString().padLeft(3, '0')}'),
                Text(
                  pokemon.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 2.0),
                TypesWrap(types: pokemon.types),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PokemonCardBackground extends StatelessWidget {
  const PokemonCardBackground({
    Key? key,
    required this.type,
    this.height = 100.0,
  }) : super(key: key);

  final Types type;
  final double height;

  @override
  Widget build(BuildContext context) {
    final double itemWidth = MediaQuery.of(context).size.width;
    final pokeballSize = height * 1.25;
    final dottedWidth = itemWidth * 0.2;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Stack(
        children: [
          Container(
            height: height,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [type.darkColor, type.lightColor],
              ),
            ),
          ),
          Positioned(
            top: (height - pokeballSize) / 2,
            right: -pokeballSize * 0.1,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Colors.transparent],
                  stops: [0.4, 1.0],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: Image(
                image: AppImages.pokeball,
                width: pokeballSize,
                height: pokeballSize,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ),
          Positioned(
            top: 5.0,
            left: itemWidth / 2 - dottedWidth * 1.3,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white.withOpacity(0.3), Colors.transparent],
                    stops: [0.0, 0.8]).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: Image(
                image: AppImages.dotted,
                width: dottedWidth,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
