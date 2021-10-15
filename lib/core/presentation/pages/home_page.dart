import 'package:flutter/material.dart';
import 'package:pokedex_flutter/config/app_images.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/pokemon_list/application/pokemon_list_providers.dart';
import 'package:pokedex_flutter/pokemon_list/presentation/pokemon_list_page.dart';
import 'package:pokedex_flutter/search_filter/presentation/pokemon_search_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -MediaQuery.of(context).size.width / 2,
            child: const HomeBackground(),
          ),
          CustomScrollView(
            controller: controller,
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                actions: [
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.transparent,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.apps, color: Colors.black),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.transparent,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.sort, color: Colors.black),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.transparent,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.tune, color: Colors.black),
                    ),
                  ),
                  const SizedBox(width: 16.0)
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Pokedex',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24.0)),
                      SizedBox(height: 8.0),
                      Text(
                          'Search for Pokemon by name or using the National Pokedex number'),
                      SizedBox(height: 18.0),
                      PokemonSearchField()
                    ],
                  ),
                ),
              ),
              const PokemonListPage(),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeBackground extends StatelessWidget {
  const HomeBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.transparent],
          // stops: [0.4, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: Image(
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
        color: Colors.black.withOpacity(0.2),
        image: AppImages.pokeball,
      ),
    );
  }
}
