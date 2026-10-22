import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:how_was_your_day/l10n/app_localizations.dart';
import 'package:how_was_your_day/widgets/rating_selector.dart';

void main() {
  testWidgets('rating selector exposes all ten choices', (tester) async {
    int? selected;
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: Scaffold(
          body: RatingSelector(
            value: selected,
            onChanged: (value) => selected = value,
          ),
        ),
      ),
    );
    expect(find.text('1'), findsOneWidget);
    expect(find.text('10'), findsOneWidget);
    await tester.tap(find.text('8'));
    expect(selected, 8);
  });
}
