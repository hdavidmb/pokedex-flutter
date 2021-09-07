import 'package:dartz/dartz.dart';
import 'package:pokedex_flutter/core/domain/failures/database_failure.dart';
import 'package:pokedex_flutter/pokemon_list/domain/pokemon_list_item.dart';

class PokemonListDataSource {
  Future<Either<DatabaseFailure, List<PokemonListItem>>> getPokemonList(
      {required int page, int limit = 20}) async {
    final int firstIndex = limit * (page - 1);
    final int lastIndex = limit * page - 1;
    return Future.delayed(Duration(seconds: 2), () {
      return right(pokemonList.sublist(firstIndex, lastIndex));
    });
  }

  final List<PokemonListItem> pokemonList = [
    PokemonListItem(
      number: 1,
      name: 'Bulbasaur',
      types: [Types.grass, Types.poison],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
    ),
    PokemonListItem(
      number: 2,
      name: 'Ivysaur',
      types: [Types.grass, Types.poison],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png',
    ),
    PokemonListItem(
      number: 3,
      name: 'Venusaur',
      types: [Types.grass, Types.poison],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png',
    ),
    PokemonListItem(
      number: 4,
      name: 'Charmander',
      types: [Types.fire],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
    ),
    PokemonListItem(
      number: 5,
      name: 'Charmeleon',
      types: [Types.fire],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png',
    ),
    PokemonListItem(
      number: 6,
      name: 'Charizard',
      types: [Types.fire, Types.flying],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png',
    ),
    PokemonListItem(
      number: 7,
      name: 'Squirtle',
      types: [Types.water],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png',
    ),
    PokemonListItem(
      number: 8,
      name: 'Wartortle',
      types: [Types.water],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/8.png',
    ),
    PokemonListItem(
      number: 9,
      name: 'Blastoise',
      types: [Types.water],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/9.png',
    ),
    PokemonListItem(
      number: 10,
      name: 'Blastoise',
      types: [Types.water],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10.png',
    ),
    PokemonListItem(
      number: 11,
      name: 'Blastoise',
      types: [Types.water],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/11.png',
    ),
    PokemonListItem(
      number: 12,
      name: 'Blastoise',
      types: [Types.water],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/12.png',
    ),
    PokemonListItem(
      number: 13,
      name: 'Blastoise',
      types: [Types.water],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/13.png',
    ),
    PokemonListItem(
      number: 14,
      name: 'Blastoise',
      types: [Types.water],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/14.png',
    ),
    PokemonListItem(
      number: 15,
      name: 'Blastoise',
      types: [Types.water],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/15.png',
    ),
    PokemonListItem(
      number: 16,
      name: 'Blastoise',
      types: [Types.water],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/16.png',
    ),
    PokemonListItem(
      number: 17,
      name: 'Blastoise',
      types: [Types.water],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/17.png',
    ),
    PokemonListItem(
      number: 18,
      name: 'Blastoise',
      types: [Types.water],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/18.png',
    ),
    PokemonListItem(
      number: 19,
      name: 'Blastoise',
      types: [Types.water],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/19.png',
    ),
    PokemonListItem(
      number: 20,
      name: 'Blastoise',
      types: [Types.water],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/20.png',
    ),
    PokemonListItem(
      number: 21,
      name: 'Blastoise',
      types: [Types.water],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/21.png',
    ),
    PokemonListItem(
      number: 22,
      name: 'Blastoise',
      types: [Types.water],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/22.png',
    ),
  ];
}
