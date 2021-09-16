import 'package:flutter/material.dart';
import 'package:pokedex_flutter/config/app_images.dart';
import 'package:pokedex_flutter/core/domain/types.dart';
import 'package:pokedex_flutter/core/presentation/widgets/types_wrap/types_wrap.dart';
import 'package:pokedex_flutter/poke_view/domain/poke_data.dart';

class PokeHeader extends StatelessWidget {
  const PokeHeader({Key? key, required this.pokeData}) : super(key: key);

  final size = 300.0;
  final PokeData pokeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50),
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
  final PokeData pokeData;

  @override
  Widget build(BuildContext context) {
    double dottedWidh = 100;
    double stackWidth = MediaQuery.of(context).size.width;
    double stackHigh = MediaQuery.of(context).size.height;

    print(stackHigh);
    print(stackWidth);
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
                  stops: [
                    0.0,
                    1.0
                  ]).createShader(rect);
            },
            child: Image(
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
                stops: [
                  0.0,
                  2.0,
                  3.0,
                ],
              ).createShader(rect);
            },
            child: Image(
              image: AppImages.pokeball,
              width: 150,
              color: Colors.white,
            ),
          ),
        ),
        _PokeInfoCard(
          type: pokeData.types!,
          name: pokeData.pokeName!,
          id: pokeData.pokeId!,
          imageUrl: pokeData.pokeImageUrl!,
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
  final String id;
  final String name;
  final List<Types> type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 130,
          width: 130,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl),
          )),
        ),
        SizedBox(
          width: 30,
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                id,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              TypesWrap(types: type)
            ],
          ),
        )
      ],
    );
  }
}
