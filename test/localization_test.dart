import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:how_was_your_day/app.dart';
import 'package:how_was_your_day/l10n/app_localizations.dart';
import 'package:how_was_your_day/l10n/l10n.dart';
import 'package:how_was_your_day/utils/journal_tags.dart';

void main() {
  test('all supported localization catalogs load', () async {
    expect(
      AppLocalizations.supportedLocales.map((locale) => locale.languageCode),
      unorderedEquals(['en', 'fr', 'es', 'it', 'de', 'pt', 'ar']),
    );
    for (final locale in AppLocalizations.supportedLocales) {
      final localizations = await AppLocalizations.delegate.load(locale);
      expect(localizations.appTitle, isNotEmpty);
      expect(localizations.tagWork, isNotEmpty);
      expect(localizations.aiReflection, isNotEmpty);
    }
  });

  test('unsupported device locales fall back to English', () {
    expect(
      resolveAppLocale(const Locale('ja'), AppLocalizations.supportedLocales),
      const Locale('en'),
    );
  });

  test('built-in tags use stable IDs and migrate legacy English values', () {
    expect(journalTagIds, containsAll(['work', 'exercise', 'other']));
    expect(normalizeTagId('Work'), 'work');
    expect(normalizeTagId('Relationship'), 'relationship');
    expect(normalizeTagId('work'), 'work');
  });

  testWidgets('English to French to Arabic to English updates text and RTL', (
    tester,
  ) async {
    final locale = ValueNotifier(const Locale('en'));
    addTearDown(locale.dispose);
    await tester.pumpWidget(
      ValueListenableBuilder<Locale>(
        valueListenable: locale,
        builder: (context, value, _) => MaterialApp(
          locale: value,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: Builder(
            builder: (context) => Text(
              '${Directionality.of(context).name}|${context.l10n.navToday}',
              key: const Key('localizedText'),
            ),
          ),
        ),
      ),
    );
    expect(find.text('ltr|Today'), findsOneWidget);

    locale.value = const Locale('fr');
    await tester.pumpAndSettle();
    expect(find.text("ltr|Aujourd'hui"), findsOneWidget);

    locale.value = const Locale('ar');
    await tester.pumpAndSettle();
    expect(find.text('rtl|اليوم'), findsOneWidget);

    locale.value = const Locale('en');
    await tester.pumpAndSettle();
    expect(find.text('ltr|Today'), findsOneWidget);
  });
}
