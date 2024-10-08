import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/core/presentation/app_bar.dart';
import 'package:pokedex_flutter/poke_view/application/poke_view_providers.dart';
import 'package:pokedex_flutter/poke_view/domain/poke_data.dart';
import 'package:pokedex_flutter/poke_view/presentation/widgets/poke_header.dart';
import 'package:pokedex_flutter/poke_view/presentation/widgets/poke_tabs.dart';
import 'package:pokedex_flutter/pokemon_list/domain/pokemon_list_item.dart';

class PokeInfoView extends StatelessWidget {
  final PokemonListItem poke;
  const PokeInfoView({Key? key, required this.poke}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      context.read(pokeViewNotifierProvider).fecthPokeData(poke.name);
    });

    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: true,
      body: _Body(
        poke: poke,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key, required this.poke}) : super(key: key);

  final PokemonListItem poke;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: poke.types.first.darkColor,
      child: Column(
        children: [
          PokeHeader(
            pokeData: poke,
          ),
          PokeTabBar(pokeName: poke.name)
        ],
      ),
    );
  }
}
