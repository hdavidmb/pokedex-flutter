import 'package:flutter/material.dart';

class DataList extends StatelessWidget {
  const DataList(
      {Key? key,
      required this.keyValue,
      required this.title,
      required this.color})
      : super(key: key);

  final Map<String, Widget> keyValue;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final Widget generatedHeader = generateHeader(title);
    final List<Widget> generatedList = generateList(keyValue);

    // Joining header.
    generatedList.insert(0, generatedHeader);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: generatedList,
    );
  }

  Widget generateHeader(String title) {
    final headerStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: color,
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Text(title, style: headerStyle),
    );
  }

  List<Widget> generateList(Map<String, Widget> bodyMap) {
    final List<Widget> result = [];

    const TextStyle keyStyle =
        TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

    // Body - Map list

    bodyMap.forEach((key, value) {
      result.add(Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            SizedBox(
              width: 140,
              child: Text(
                key,
                style: keyStyle,
              ),
            ),
            value
          ],
        ),
      ));
    });

    return result;
  }
}
