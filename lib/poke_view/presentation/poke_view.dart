import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/presentation/app_bar.dart';
import 'package:pokedex_flutter/poke_view/presentation/widgets/poke_header.dart';
import 'package:pokedex_flutter/poke_view/presentation/widgets/poke_tabs.dart';

class PokeInfoView extends StatelessWidget {
  const PokeInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: true,
      body: Container(
        child: _Body(),
      ),
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
