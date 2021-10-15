import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/core/presentation/widgets/pokemon_card/pokemon_card.dart';
import 'package:pokedex_flutter/poke_view/presentation/poke_view.dart';
import 'package:pokedex_flutter/pokemon_list/application/pokemon_list_providers.dart';
import 'package:pokedex_flutter/pokemon_list/domain/pokemon_list_item.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({
    Key? key,
  }) : super(key: key);

  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.position.pixels >=
          controller.position.maxScrollExtent - 500.0) {
        context.read(pokemonListChangeNotifierProvider).getPokemonList();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final provider = watch(pokemonListChangeNotifierProvider);
        final List<PokemonListItem> pokemonList = provider.pokemonList;
        return SliverList(
          // controller: controller,
          delegate: SliverChildBuilderDelegate(
            (_, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: PokemonCard(
                pokemon: pokemonList[index],
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PokeInfoView(
                        poke: pokemonList[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            childCount: pokemonList.length,
          ),
        );
      },
    );
  }
}
