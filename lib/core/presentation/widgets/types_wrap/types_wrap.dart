import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/domain/types.dart';

class TypesWrap extends StatelessWidget {
  final List<Types> types;
  final double itemHeight;
  const TypesWrap({
    Key? key,
    required this.types,
    this.itemHeight = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4.0,
      children: types
          .map((type) => TypeChip(
                type: type,
                itemHeight: itemHeight,
              ))
          .toList(),
    );
  }
}

class TypeChip extends StatelessWidget {
  final Types type;
  final double itemHeight;
  const TypeChip({
    Key? key,
    required this.type,
    this.itemHeight = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double padding = 5.0;
    return Container(
      padding: const EdgeInsets.all(padding),
      height: itemHeight,
      decoration: BoxDecoration(
          color: type.chipColor, borderRadius: BorderRadius.circular(4.0)),
      child: Row(
        children: [
          Image(
            image: type.icon,
            color: Colors.white,
          ),
          const SizedBox(width: 4.0),
          Text(
            type.name,
            style: TextStyle(
                color: Colors.white, fontSize: itemHeight - padding * 2 - 2),
          ),
        ],
      ),
    );
  }
}
