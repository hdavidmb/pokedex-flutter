import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/config/app_images.dart';
import 'package:pokedex_flutter/core/presentation/app_bar.dart';
import 'package:pokedex_flutter/core/presentation/widgets/loaders/pika_loading.dart';
import 'package:pokedex_flutter/poke_view/application/poke_state.dart';
import 'package:pokedex_flutter/poke_view/application/poke_view_providers.dart';
import 'package:pokedex_flutter/poke_view/presentation/widgets/poke_header.dart';
import 'package:pokedex_flutter/poke_view/presentation/widgets/poke_tabs.dart';

class PokeInfoView extends StatelessWidget {
  const PokeInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokeViewProvider = context.read(pokeViewNotifierProvider);
    pokeViewProvider.fecthPokeData('charm');

    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: true,
      body: Container(child: Consumer(builder: (context, watch, child) {
        final pokeState = watch(pokeViewNotifierProvider).pokeState;

        if (pokeState == PokeState.ready()) return _Body();

        return PikaLoader();
      })),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Color(0xFFfba556);

    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          PokeHeader(),
          PokeTabBar(),
        ],
      ),
    );
  }
}
