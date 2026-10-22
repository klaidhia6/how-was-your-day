import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:how_was_your_day/l10n/app_localizations.dart';
import 'package:how_was_your_day/models/daily_entry.dart';
import 'package:how_was_your_day/models/reflection.dart';
import 'package:how_was_your_day/screens/home_screen.dart';
import 'package:how_was_your_day/services/ai_reflection_service.dart';
import 'package:how_was_your_day/services/journal_controller.dart';
import 'package:how_was_your_day/storage/journal_storage.dart';

class _MemoryStorage implements JournalStorage {
  final entries = <String, DailyEntry>{};
  final reflections = <String, Reflection>{};
  final settings = <String, String>{};

  @override
  Future<void> deleteAll() async {
    entries.clear();
    reflections.clear();
    settings.clear();
  }

  @override
  Future<void> deleteEntry(DateTime date) async =>
      entries.remove(DailyEntry.dateKey(date));
  @override
  Future<void> deleteReflection(String id) async => reflections.remove(id);
  @override
  Future<String?> getSetting(String key) async => settings[key];
  @override
  Future<List<DailyEntry>> loadEntries() async => entries.values.toList();
  @override
  Future<List<Reflection>> loadReflections() async =>
      reflections.values.toList();
  @override
  Future<void> saveEntry(DailyEntry entry) async =>
      entries[DailyEntry.dateKey(entry.date)] = entry;
  @override
  Future<void> saveReflection(Reflection reflection) async =>
      reflections[reflection.id] = reflection;
  @override
  Future<void> setSetting(String key, String value) async =>
      settings[key] = value;
}

void main() {
  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('${locale.languageCode} renders every main area and dialogs', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 1920);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final controller = JournalController(
        storage: _MemoryStorage(),
        aiService: AiReflectionService(baseUrl: 'https://unused.test'),
      );
      await controller.initialize();
      final now = DateTime.now();
      for (var offset = 0; offset < 3; offset++) {
        await controller.saveEntry(
          date: now.subtract(Duration(days: offset)),
          rating: 7 + offset,
          note: offset == 0 ? 'User-written text' : '',
          tags: const ['work', 'friends'],
        );
      }
      // Editing preserves one entry for the calendar day.
      await controller.saveEntry(
        date: now,
        rating: 8,
        note: 'Edited user-written text',
        tags: const ['work'],
      );
      expect(controller.entries, hasLength(3));

      final l10n = await AppLocalizations.delegate.load(locale);
      await tester.pumpWidget(
        MaterialApp(
          locale: locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: HomeScreen(controller: controller),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text(l10n.howWasYourDay), findsWidgets);

      await tester.tap(find.text(l10n.navHistory));
      await tester.pumpAndSettle();
      expect(find.text(l10n.entries), findsOneWidget);

      await tester.tap(find.text(l10n.navInsights));
      await tester.pumpAndSettle();
      expect(find.text(l10n.aiReflection), findsOneWidget);
      await tester.tap(find.text(l10n.weeklyReflection));
      await tester.pumpAndSettle();
      expect(find.text(l10n.beforeContinue), findsOneWidget);
      await tester.tap(find.text(l10n.cancel));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.settings_outlined));
      await tester.pumpAndSettle();
      expect(find.text(l10n.settingsTitle), findsOneWidget);
      await tester.scrollUntilVisible(
        find.text(l10n.deleteAllData),
        300,
        scrollable: find.byType(Scrollable).last,
      );
      await tester.tap(find.text(l10n.deleteAllData));
      await tester.pumpAndSettle();
      expect(find.text(l10n.deleteAllQuestion), findsOneWidget);
      await tester.tap(find.text(l10n.cancel));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
  }
}
