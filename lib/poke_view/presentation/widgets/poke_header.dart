import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/config/app_images.dart';
import 'package:pokedex_flutter/core/domain/types.dart';
import 'package:pokedex_flutter/core/presentation/widgets/types_wrap/types_wrap.dart';
import 'package:pokedex_flutter/poke_view/domain/poke_data.dart';
import 'package:pokedex_flutter/pokemon_list/domain/pokemon_list_item.dart';

class PokeHeader extends StatelessWidget {
  const PokeHeader({Key? key, required this.pokeData}) : super(key: key);

  double get size => 300.0;
  final PokemonListItem pokeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      height: size,
      width: double.infinity,
      child: _HeaderStack(
        pokeData: pokeData,
      ),
    );
  }
}

class _HeaderStack extends StatelessWidget {
  const _HeaderStack({Key? key, required this.pokeData}) : super(key: key);
  final PokemonListItem pokeData;

  @override
  Widget build(BuildContext context) {
    const double dottedWidh = 100;
    return Stack(
      children: [
        Positioned(
          top: 160,
          right: 0,
          child: ShaderMask(
            shaderCallback: (Rect rect) {
              return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.6),
                    Colors.white.withOpacity(0.1)
                  ],
                  stops: const [
                    0.0,
                    1.0
                  ]).createShader(rect);
            },
            child: const Image(
              image: AppImages.dotted,
              width: dottedWidh,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 35,
          left: 20,
          child: ShaderMask(
            shaderCallback: (Rect rect) {
              return RadialGradient(
                // center: Alignment.bottomRight,
                // focal: Alignment.topLeft,
                center: Alignment.topLeft,
                focal: Alignment.bottomRight,
                radius: 1.009,
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0.2),
                  Colors.transparent,
                ],
                stops: const [
                  0.0,
                  2.0,
                  3.0,
                ],
              ).createShader(rect);
            },
            child: const Image(
              image: AppImages.pokeball,
              width: 150,
              color: Colors.white,
            ),
          ),
        ),
        _PokeInfoCard(
          type: pokeData.types,
          name: pokeData.name,
          id: pokeData.number,
          imageUrl: pokeData.imageUrl,
        ),
      ],
    );
  }
}

class _PokeInfoCard extends StatelessWidget {
  const _PokeInfoCard(
      {Key? key,
      required this.imageUrl,
      required this.id,
      required this.name,
      required this.type})
      : super(key: key);

  final String imageUrl;
  final int id;
  final String name;
  final List<Types> type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 130,
          width: 130,
          child: Hero(
            tag: name,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: imageUrl,
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '#${id.toString().padLeft(3, '0')}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              name,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            TypesWrap(types: type)
          ],
        )
      ],
    );
  }
}
