import 'package:flutter/material.dart';
import 'package:pokedex_flutter/poke_view/domain/poke_data.dart';

import 'data_list.dart';

class AboutPage extends StatelessWidget {
  final PokeData pokeData;
  const AboutPage({Key? key, required this.pokeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.black54, fontSize: 16);

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // Description
        Text(
          pokeData.description
              .replaceAll('\n', ' ')
              .replaceAll('\t', ' ')
              .replaceAll('\f', ' ')
              .toLowerCase()
              .capitalize(),
          style: textStyle,
          textAlign: TextAlign.justify,
        ),
        // Pokedex data
        DataList(
          color: pokeData.types.first.color,
          keyValue: {
            "Species": const Text(''),
            "Heigh": Text(
                '${pokeData.pokeHeight.toString()} m (${(pokeData.pokeHeight * 3.281).toString().substring(0, 4).replaceAll('.', '´')}")'),
            "Weigh": Text(
                '${pokeData.pokeWeight.toString()} kg (${(pokeData.pokeWeight * 2.205).toString().substring(0, 4)} lbs)'),
            "Abilities": Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: pokeData.abilities.entries
                    .map((e) => e.value
                        ? Text(
                            "${e.key.capitalize()} (hidden ability)",
                            style: const TextStyle(fontStyle: FontStyle.italic),
                            overflow: TextOverflow.ellipsis,
                          )
                        : Text(
                            e.key.capitalize(),
                            style: const TextStyle(fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                          ))
                    .toList(),
              ),
            ),
          },
          title: "Pokedex data",
        ),
        DataList(
          color: pokeData.types.first.color,
          keyValue: {
            "EV Yield": const Text(""),
            "Catch rate": Text(pokeData.catchRate.toString()),
            "Base friendship": Text(pokeData.baseFriendship.toString()),
            "Base Exp": Text(pokeData.baseExperience.toString()),
            "Growh rate":
                Text(pokeData.growthRate.replaceAll('-', ' ').capitalize())
          },
          title: "Pokedex data",
        ),
        //Training
      ],
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
