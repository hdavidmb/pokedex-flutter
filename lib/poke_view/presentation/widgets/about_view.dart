import 'package:flutter/material.dart';
import 'package:pokedex_flutter/poke_view/domain/poke_data.dart';

import 'data_list.dart';

class AboutPage extends StatelessWidget {
  final PokeData pokeData;
  const AboutPage({Key? key, required this.pokeData}) : super(key: key);

  final textStyle = const TextStyle(color: Colors.black54, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    print(pokeData.abilities);

    return Container(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          // Description
          Container(
            child: Text(
              pokeData.description
                  .replaceAll('\n', ' ')
                  .replaceAll('\t', ' ')
                  .replaceAll('\f', ' ')
                  .toLowerCase()
                  .capitalize(),
              style: textStyle,
              textAlign: TextAlign.justify,
            ),
          ),
          // Pokedex data
          Container(
            child: DataList(
              color: pokeData.types.first.color,
              keyValue: {
                "Species": Text(''),
                "Heigh": Text(pokeData.pokeHeight.toString() +
                    "m" +
                    ' (' +
                    (pokeData.pokeHeight * 3.281)
                        .toString()
                        .substring(0, 4)
                        .replaceAll('.', '\´') +
                    '\")'),
                "Weigh": Text(pokeData.pokeWeight.toString() +
                    "Kg" +
                    " (" +
                    (pokeData.pokeWeight * 2.205).toString().substring(0, 4) +
                    "lbs)"),
                "Abilities": Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: pokeData.abilities.entries
                        .map((e) => e.value
                            ? Text(
                                e.key.capitalize() + "(hidden ability)",
                                style: TextStyle(fontStyle: FontStyle.italic),
                              )
                            : Text(
                                e.key.capitalize(),
                                style: TextStyle(fontSize: 18),
                              ))
                        .toList())
              },
              title: "Pokedex data",
            ),
          ),
          Container(
            child: DataList(
              color: pokeData.types.first.color,
              keyValue: {
                "EV Yield": Text(""),
                "Catch rate": Text(pokeData.catchRate.toString()),
                "Base friendship": Text(pokeData.baseFriendship.toString()),
                "Base Exp": Text(pokeData.baseExperience.toString()),
                "Growh rate":
                    Text(pokeData.growthRate.replaceAll('-', ' ').capitalize())
              },
              title: "Pokedex data",
            ),
          ),
          //Training
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
