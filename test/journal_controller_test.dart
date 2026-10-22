import 'package:flutter_test/flutter_test.dart';
import 'package:how_was_your_day/models/daily_entry.dart';
import 'package:how_was_your_day/models/reflection.dart';
import 'package:how_was_your_day/services/ai_reflection_service.dart';
import 'package:how_was_your_day/services/journal_controller.dart';
import 'package:how_was_your_day/storage/journal_storage.dart';

class MemoryStorage implements JournalStorage {
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
  Future<void> deleteEntry(DateTime date) async {
    entries.remove(DailyEntry.dateKey(date));
  }

  @override
  Future<void> deleteReflection(String id) async {
    reflections.remove(id);
  }

  @override
  Future<String?> getSetting(String key) async => settings[key];
  @override
  Future<List<DailyEntry>> loadEntries() async => entries.values.toList();
  @override
  Future<List<Reflection>> loadReflections() async =>
      reflections.values.toList();
  @override
  Future<void> saveEntry(DailyEntry entry) async {
    entries[DailyEntry.dateKey(entry.date)] = entry;
  }

  @override
  Future<void> saveReflection(Reflection reflection) async {
    reflections[reflection.id] = reflection;
  }

  @override
  Future<void> setSetting(String key, String value) async {
    settings[key] = value;
  }
}

JournalController controllerFor(MemoryStorage storage) => JournalController(
  storage: storage,
  aiService: AiReflectionService(baseUrl: 'http://unused.test'),
);

void main() {
  test('saving the same calendar day updates one primary entry', () async {
    final storage = MemoryStorage();
    final controller = controllerFor(storage);
    await controller.initialize();
    final day = DateTime.now();
    final first = await controller.saveEntry(
      date: day,
      rating: 5,
      note: '',
      tags: [],
    );
    final second = await controller.saveEntry(
      date: day,
      rating: 8,
      note: 'Better',
      tags: ['Friends'],
    );
    expect(controller.entries, hasLength(1));
    expect(second.id, first.id);
    expect(second.rating, 8);
    expect(storage.entries, hasLength(1));
  });

  test('future entries are rejected', () async {
    final controller = controllerFor(MemoryStorage());
    await controller.initialize();
    expect(
      () => controller.saveEntry(
        date: DateTime.now().add(const Duration(days: 1)),
        rating: 7,
        note: '',
        tags: [],
      ),
      throwsArgumentError,
    );
  });

  test('saved entries load again from local persistence abstraction', () async {
    final storage = MemoryStorage();
    final first = controllerFor(storage);
    await first.initialize();
    await first.saveEntry(
      date: DateTime.now(),
      rating: 7,
      note: 'A day',
      tags: ['Work'],
    );
    final reloaded = controllerFor(storage);
    await reloaded.initialize();
    expect(reloaded.entries.single.note, 'A day');
  });

  test(
    'language preference persists and system default clears override',
    () async {
      final storage = MemoryStorage();
      final controller = controllerFor(storage);
      await controller.initialize();
      await controller.setLanguage('fr');

      final reloaded = controllerFor(storage);
      await reloaded.initialize();
      expect(reloaded.languageCode, 'fr');

      await reloaded.setLanguage(null);
      final systemDefault = controllerFor(storage);
      await systemDefault.initialize();
      expect(systemDefault.languageCode, isNull);
    },
  );

  test('unsupported saved language falls back to system locale', () async {
    final storage = MemoryStorage()..settings['language'] = 'xx';
    final controller = controllerFor(storage);
    await controller.initialize();
    expect(controller.languageCode, isNull);
  });
}
