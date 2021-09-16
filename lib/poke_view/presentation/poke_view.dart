import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/core/presentation/app_bar.dart';
import 'package:pokedex_flutter/core/presentation/widgets/loaders/pika_loading.dart';
import 'package:pokedex_flutter/poke_view/application/poke_state.dart';
import 'package:pokedex_flutter/poke_view/application/poke_view_providers.dart';
import 'package:pokedex_flutter/poke_view/domain/poke_data.dart';
import 'package:pokedex_flutter/poke_view/presentation/widgets/poke_header.dart';
import 'package:pokedex_flutter/poke_view/presentation/widgets/poke_tabs.dart';

class PokeInfoView extends StatelessWidget {
  final String pokeId;
  final Color backgroundColor;
  const PokeInfoView(
      {Key? key, required this.pokeId, required this.backgroundColor})
      : super(key: key);

  // I recived the PokeName and the color background.

  @override
  Widget build(BuildContext context) {
    final pokeViewProvider = context.read(pokeViewNotifierProvider);

    print("Fetching $pokeId");
    pokeViewProvider.fecthPokeData(pokeId.toLowerCase());

    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: true,
      body: Container(child: Consumer(builder: (context, watch, child) {
        // Postframe callback
        final provider = watch(pokeViewNotifierProvider);
        final pokeState = provider.pokeState;

        if (pokeState == PokeState.ready())
          return _Body(
            pokeData: provider.pokeData,
            backgroundColor: backgroundColor,
          );

        return PikaLoader();
      })),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key, required this.pokeData, required this.backgroundColor})
      : super(key: key);

  final PokeData pokeData;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          PokeHeader(
            pokeData: pokeData,
          ),
          PokeTabBar(
            pokeData: pokeData,
          ),
        ],
      ),
    );
  }
}
