import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:pokedex_flutter/core/domain/types.dart';

class SearchChip extends StatelessWidget {
  final Object selection;
  final ChipsInputState<Object?> state;
  const SearchChip({
    Key? key,
    required this.selection,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Widget avatar;
    String label = '';
    Color chipColor = Colors.grey[200]!;
    Color textColor = Theme.of(context).textTheme.bodyText1!.color!;
    if (selection is String) {
      avatar = const Icon(Icons.search);
      label = selection as String;
    } else if (selection is Types) {
      avatar = Image(
        image: (selection as Types).icon,
        color: Colors.white,
      );
      label = (selection as Types).name;
      chipColor = (selection as Types).chipColor;
      textColor = Colors.white;
    }
    return InputChip(
      key: ObjectKey(selection),
      avatar: avatar,
      label: Text(
        label,
        style: TextStyle(color: textColor),
      ),
      backgroundColor: chipColor,
      deleteIconColor: textColor,
      onDeleted: () => state.deleteChip(selection),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
