import 'dart:convert';

import 'package:hive/hive.dart';

import '../models/daily_entry.dart';
import '../models/reflection.dart';
import '../utils/journal_tags.dart';
import 'journal_storage.dart';

class HiveJournalStorage implements JournalStorage {
  static const _entriesBox = 'daily_entries';
  static const _reflectionsBox = 'reflections';
  static const _settingsBox = 'settings';

  Future<void> initialize() async {
    await Future.wait([
      Hive.openBox<String>(_entriesBox),
      Hive.openBox<String>(_reflectionsBox),
      Hive.openBox<String>(_settingsBox),
    ]);
  }

  Box<String> get _entries => Hive.box<String>(_entriesBox);
  Box<String> get _reflections => Hive.box<String>(_reflectionsBox);
  Box<String> get _settings => Hive.box<String>(_settingsBox);

  @override
  Future<List<DailyEntry>> loadEntries() async {
    final result = <DailyEntry>[];
    for (final key in _entries.keys) {
      final value = _entries.get(key);
      if (value == null) continue;
      final entry = DailyEntry.fromJson(
        Map<String, dynamic>.from(jsonDecode(value) as Map),
      );
      final normalizedTags = entry.tags.map(normalizeTagId).toList();
      final migrated = normalizedTags.indexed.any(
        (item) => item.$2 != entry.tags[item.$1],
      );
      final normalized = migrated
          ? entry.copyWith(tags: normalizedTags, updatedAt: entry.updatedAt)
          : entry;
      if (migrated) {
        await _entries.put(key, jsonEncode(normalized.toJson()));
      }
      result.add(normalized);
    }
    return result;
  }

  @override
  Future<void> saveEntry(DailyEntry entry) async {
    final today = DailyEntry.calendarDate(DateTime.now());
    if (DailyEntry.calendarDate(entry.date).isAfter(today)) {
      throw ArgumentError('Future entries are not allowed.');
    }
    if (entry.rating < 1 || entry.rating > 10) {
      throw ArgumentError('Rating must be between 1 and 10.');
    }
    await _entries.put(
      DailyEntry.dateKey(entry.date),
      jsonEncode(entry.toJson()),
    );
  }

  @override
  Future<void> deleteEntry(DateTime date) =>
      _entries.delete(DailyEntry.dateKey(date));

  @override
  Future<List<Reflection>> loadReflections() async => _reflections.values
      .map(
        (value) => Reflection.fromJson(
          Map<String, dynamic>.from(jsonDecode(value) as Map),
        ),
      )
      .toList();

  @override
  Future<void> saveReflection(Reflection reflection) =>
      _reflections.put(reflection.id, jsonEncode(reflection.toJson()));

  @override
  Future<void> deleteReflection(String id) => _reflections.delete(id);

  @override
  Future<String?> getSetting(String key) async => _settings.get(key);

  @override
  Future<void> setSetting(String key, String value) =>
      _settings.put(key, value);

  @override
  Future<void> deleteAll() async {
    await Future.wait([
      _entries.clear(),
      _reflections.clear(),
      _settings.clear(),
    ]);
  }
}
