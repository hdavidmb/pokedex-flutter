import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:integration_test/integration_test.dart";
import "package:pokedex_flutter/main.dart" as app;
import "package:pokedex_flutter/search_filter/presentation/pokemon_search_field.dart";

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  const bugType = "Bug";

  testWidgets("first pokemon is Bulbasaur", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 1));

    final Finder firstPokemon = find.byKey(const ValueKey("pokemon_0"));

    await tester.tap(firstPokemon);
    await tester.pumpAndSettle();
    expect(find.text("Bulbasaur"), findsWidgets);
  });

  testWidgets("searchbar autocomplete tags", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 1));

    final Finder chipsInput = find.byType(PokemonSearchField);

    await tester.tap(chipsInput);
    await tester.pumpAndSettle();
    tester.testTextInput.enterText("b");
    await tester.pump();
    expect(find.text(bugType), findsOneWidget);
  });

  testWidgets("searchbar can set and delete one chip",
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 1));

    final Finder chipsInput = find.byType(PokemonSearchField);

    await tester.tap(chipsInput);
    await tester.pumpAndSettle();
    tester.testTextInput.enterText("b");
    await tester.pump();

    final Finder bugChip = find.text(bugType);

    await tester.tap(bugChip);
    await tester.pumpAndSettle();

    final Finder closeChip = find.byTooltip("Delete");
    await tester.tap(closeChip);
    await tester.pumpAndSettle();

    // checks searchbar to be empty
    expect(find.text("What pokemon are you looking for?"), findsOneWidget);
  });
}
