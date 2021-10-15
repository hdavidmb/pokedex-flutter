import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:pokedex_flutter/core/domain/types.dart';
import 'package:pokedex_flutter/core/presentation/widgets/types_wrap/types_wrap.dart';
import 'package:pokedex_flutter/search_filter/presentation/search_chip.dart';

class PokemonSearchField extends StatelessWidget {
  const PokemonSearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChipsInput(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[300],
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black,
        ),
        enabledBorder: const UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.transparent, width: 0.0)),
        focusedBorder: const UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.transparent, width: 0.0)),
        hintText: 'What pokemon are you looking for?',
      ),
      chipBuilder: (context, state, Object selection) =>
          SearchChip(selection: selection, state: state),
      suggestionBuilder: (context, state, Object suggestion) {
        return ListTile(
          title: suggestion is Types
              ? Row(
                  children: [
                    TypeChip(type: suggestion),
                    const Expanded(child: SizedBox())
                  ],
                )
              : Text('Name: ${suggestion as String}'),
          onTap: () {
            state.selectSuggestion(suggestion);
          },
        );
      },
      findSuggestions: (String query) {
        final List<Object> suggestions = [];
        if (query.isNotEmpty) {
          suggestions.add(query);

          suggestions.addAll(Types.values.where((type) =>
              type.toString().substring(6).startsWith(query.toLowerCase())));
        }
        return suggestions;
      },
      onChanged: (value) {},
    );
  }
}
