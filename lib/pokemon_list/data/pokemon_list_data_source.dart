import 'package:dartz/dartz.dart';
import 'package:pokedex_flutter/core/domain/failures/database_failure.dart';
import 'package:pokedex_flutter/pokemon_list/domain/pokemon_list_item.dart';

class PokemonListDataSource {
  Future<Either<DatabaseFailure, List<PokemonListItem>>> getPokemonList(
      {required int page, int limit = 20}) async {
    final int firstIndex = limit * (page - 1);
    final int lastIndex = limit * page;
    if (firstIndex >= pokemonList.length) return right([]);
    return Future.delayed(Duration(seconds: 1), () {
      return right(pokemonList.sublist(
          firstIndex, lastIndex >= pokemonList.length ? null : lastIndex));
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
      name: 'Caterpie',
      types: [Types.bug],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10.png',
    ),
    PokemonListItem(
      number: 11,
      name: 'Metapod',
      types: [Types.bug],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/11.png',
    ),
    PokemonListItem(
      number: 12,
      name: 'Butterfree',
      types: [Types.bug, Types.flying],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/12.png',
    ),
    PokemonListItem(
      number: 13,
      name: 'Weedle',
      types: [Types.bug, Types.poison],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/13.png',
    ),
    PokemonListItem(
      number: 14,
      name: 'Kakuna',
      types: [Types.bug, Types.poison],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/14.png',
    ),
    PokemonListItem(
      number: 15,
      name: 'Beedrill',
      types: [Types.bug, Types.poison],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/15.png',
    ),
    PokemonListItem(
      number: 16,
      name: 'Pidgey',
      types: [Types.normal, Types.flying],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/16.png',
    ),
    PokemonListItem(
      number: 17,
      name: 'Pidgeotto',
      types: [Types.normal, Types.flying],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/17.png',
    ),
    PokemonListItem(
      number: 18,
      name: 'Pidgeot',
      types: [Types.normal, Types.flying],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/18.png',
    ),
    PokemonListItem(
      number: 19,
      name: 'Rattata',
      types: [Types.normal],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/19.png',
    ),
    PokemonListItem(
      number: 20,
      name: 'Raticate',
      types: [Types.normal],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/20.png',
    ),
    PokemonListItem(
      number: 21,
      name: 'Spearrow',
      types: [Types.normal, Types.flying],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/21.png',
    ),
    PokemonListItem(
      number: 22,
      name: 'Fearow',
      types: [Types.normal, Types.flying],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/22.png',
    ),
    PokemonListItem(
      number: 23,
      name: 'Ekans',
      types: [Types.poison],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/23.png',
    ),
    PokemonListItem(
      number: 24,
      name: 'Arbok',
      types: [Types.poison],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/24.png',
    ),
    PokemonListItem(
      number: 25,
      name: 'Pikachu',
      types: [Types.electric],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
    ),
    PokemonListItem(
      number: 26,
      name: 'Raichu',
      types: [Types.electric],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/26.png',
    ),
    PokemonListItem(
      number: 27,
      name: 'Sandshrew',
      types: [Types.ground],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/27.png',
    ),
    PokemonListItem(
      number: 28,
      name: 'Sandslash',
      types: [Types.ground],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/28.png',
    ),
    PokemonListItem(
      number: 29,
      name: 'Nidoran ♀',
      types: [Types.poison],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/29.png',
    ),
    PokemonListItem(
      number: 30,
      name: 'Nidorina',
      types: [Types.poison],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/30.png',
    ),
    PokemonListItem(
      number: 31,
      name: 'Nidoqueen',
      types: [Types.poison, Types.ground],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/31.png',
    ),
    PokemonListItem(
      number: 32,
      name: 'Nidoran ♂',
      types: [Types.poison],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/32.png',
    ),
    PokemonListItem(
      number: 33,
      name: 'Nidorino',
      types: [Types.poison],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/33.png',
    ),
    PokemonListItem(
      number: 34,
      name: 'Nidoking',
      types: [Types.poison, Types.ground],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/34.png',
    ),
    PokemonListItem(
      number: 35,
      name: 'Clefairy',
      types: [Types.fairy],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/35.png',
    ),
    PokemonListItem(
      number: 36,
      name: 'Clefable',
      types: [Types.fairy],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/36.png',
    ),
    PokemonListItem(
      number: 37,
      name: 'Vulpix',
      types: [Types.fire],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/37.png',
    ),
    PokemonListItem(
      number: 38,
      name: 'Ninetales',
      types: [Types.fire],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/38.png',
    ),
    PokemonListItem(
      number: 39,
      name: 'Jigglypuff',
      types: [Types.normal, Types.fairy],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/39.png',
    ),
    PokemonListItem(
      number: 40,
      name: 'Wigglytuff',
      types: [Types.normal, Types.fairy],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/40.png',
    ),
    PokemonListItem(
      number: 41,
      name: 'Zubat',
      types: [Types.poison, Types.flying],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/41.png',
    ),
    PokemonListItem(
      number: 42,
      name: 'Golbat',
      types: [Types.poison, Types.flying],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/42.png',
    ),
    PokemonListItem(
      number: 43,
      name: 'Oddish',
      types: [Types.grass, Types.poison],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/43.png',
    ),
    PokemonListItem(
      number: 44,
      name: 'Gloom',
      types: [Types.grass, Types.poison],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/44.png',
    ),
    PokemonListItem(
      number: 45,
      name: 'Vileplume',
      types: [Types.grass, Types.poison],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/45.png',
    ),
    PokemonListItem(
      number: 46,
      name: 'Paras',
      types: [Types.bug, Types.grass],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/46.png',
    ),
    PokemonListItem(
      number: 47,
      name: 'Parasect',
      types: [Types.bug, Types.grass],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/47.png',
    ),
    PokemonListItem(
      number: 48,
      name: 'Venonat',
      types: [Types.bug, Types.poison],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/48.png',
    ),
    PokemonListItem(
      number: 49,
      name: 'Venomoth',
      types: [Types.bug, Types.poison],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/49.png',
    ),
    PokemonListItem(
      number: 50,
      name: 'Diglett',
      types: [Types.ground],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/50.png',
    ),
  ];
}
