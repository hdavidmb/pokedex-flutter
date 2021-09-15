import 'package:flutter/material.dart';

import 'data_list.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  final textStyle = const TextStyle(color: Colors.black54, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Color(0xFFfba556);
    final String description =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta neque odio, at rutrum orci vulputate vitae. Sed elementum molestie mauris, vitae fringilla purus condimentum at. Fusce sit amet tincidunt libero. Integer non vulputate turpis, vitae mattis quam. Vestibulum placerat fringilla vehicula. Proin euismod imperdiet nisi. Ut laoreet a eros sed rutrum.";

    //  Data List

    return Container(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          // Description
          Container(
            child: Text(
              description,
              style: textStyle,
            ),
          ),
          // Pokedex data
          Container(
            child: DataList(
              color: backgroundColor,
              keyValue: {
                "Species": Text("Lizard pokemon"),
                "Heigh": Column(
                  children: [Text("Lizard pokemon"), Text("Lizard pokemon")],
                ),
                "Dudes on me": Text("Lizard pokemon"),
                "Dudes on me2": Text("Lizard pokemon")
              },
              title: "Pokedex data",
            ),
          ),
          //Training
          Container(
            child: Text("hi"),
          ),
        ],
      ),
    );
  }
}
