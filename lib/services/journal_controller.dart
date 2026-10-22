import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/daily_entry.dart';
import '../models/reflection.dart';
import '../storage/journal_storage.dart';
import '../utils/date_ranges.dart';
import 'ai_reflection_service.dart';
import 'statistics_service.dart';

class JournalController extends ChangeNotifier {
  JournalController({required this.storage, required this.aiService});

  final JournalStorage storage;
  final AiReflectionService aiService;
  final _uuid = const Uuid();

  List<DailyEntry> entries = [];
  List<Reflection> reflections = [];
  ThemeMode themeMode = ThemeMode.system;
  bool aiConsent = false;
  bool initialized = false;
  bool generatingReflection = false;
  String? languageCode;

  static const supportedLanguageCodes = {
    'en',
    'fr',
    'es',
    'it',
    'de',
    'pt',
    'ar',
  };

  Future<void> initialize() async {
    entries = await storage.loadEntries();
    reflections = await storage.loadReflections();
    final savedTheme = await storage.getSetting('themeMode');
    themeMode =
        ThemeMode.values.where((mode) => mode.name == savedTheme).firstOrNull ??
        ThemeMode.system;
    aiConsent = await storage.getSetting('aiConsent') == 'true';
    final savedLanguage = await storage.getSetting('language');
    languageCode = supportedLanguageCodes.contains(savedLanguage)
        ? savedLanguage
        : null;
    _sort();
    initialized = true;
    notifyListeners();
  }

  DailyEntry? entryForDate(DateTime date) {
    final key = DailyEntry.dateKey(date);
    return entries
        .where((entry) => DailyEntry.dateKey(entry.date) == key)
        .firstOrNull;
  }

  Future<DailyEntry> saveEntry({
    required DateTime date,
    required int rating,
    required String note,
    required List<String> tags,
  }) async {
    final day = DailyEntry.calendarDate(date);
    if (day.isAfter(DailyEntry.calendarDate(DateTime.now()))) {
      throw ArgumentError('Future entries are not allowed.');
    }
    final existing = entryForDate(day);
    final now = DateTime.now();
    final entry = existing == null
        ? DailyEntry(
            id: _uuid.v4(),
            date: day,
            rating: rating,
            note: note.trim(),
            tags: List.unmodifiable(tags),
            createdAt: now,
            updatedAt: now,
          )
        : existing.copyWith(
            rating: rating,
            note: note.trim(),
            tags: List.unmodifiable(tags),
            updatedAt: now,
          );
    await storage.saveEntry(entry);
    entries.removeWhere(
      (item) => DailyEntry.dateKey(item.date) == DailyEntry.dateKey(day),
    );
    entries.add(entry);
    _sort();
    notifyListeners();
    return entry;
  }

  Future<void> deleteEntry(DateTime date) async {
    await storage.deleteEntry(date);
    entries.removeWhere(
      (entry) => DailyEntry.dateKey(entry.date) == DailyEntry.dateKey(date),
    );
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    themeMode = mode;
    await storage.setSetting('themeMode', mode.name);
    notifyListeners();
  }

  Future<void> setLanguage(String? value) async {
    languageCode = supportedLanguageCodes.contains(value) ? value : null;
    await storage.setSetting('language', languageCode ?? 'system');
    notifyListeners();
  }

  Future<void> acceptAiConsent() async {
    aiConsent = true;
    await storage.setSetting('aiConsent', 'true');
    notifyListeners();
  }

  Future<Reflection> generateReflection(
    ReflectionType type, {
    required String activeLanguageCode,
  }) async {
    if (generatingReflection) {
      throw const ReflectionException(ReflectionErrorType.alreadyRunning);
    }
    final range = reflectionRange(type, DateTime.now());
    final selected = StatisticsService.between(entries, range.start, range.end);
    if (selected.length < range.minimumEntries) {
      throw const ReflectionException(ReflectionErrorType.insufficientEntries);
    }
    generatingReflection = true;
    notifyListeners();
    try {
      final language = supportedLanguageCodes.contains(activeLanguageCode)
          ? activeLanguageCode
          : 'en';
      final content = await aiService.generate(
        type: type,
        entries: selected,
        language: language,
      );
      final reflection = Reflection(
        id: _uuid.v4(),
        type: type,
        startDate: range.start,
        endDate: range.end,
        generatedAt: DateTime.now(),
        content: content,
      );
      await storage.saveReflection(reflection);
      reflections.insert(0, reflection);
      return reflection;
    } finally {
      generatingReflection = false;
      notifyListeners();
    }
  }

  Future<void> deleteReflection(String id) async {
    await storage.deleteReflection(id);
    reflections.removeWhere((reflection) => reflection.id == id);
    notifyListeners();
  }

  Future<void> deleteAll() async {
    await storage.deleteAll();
    entries.clear();
    reflections.clear();
    themeMode = ThemeMode.system;
    aiConsent = false;
    languageCode = null;
    notifyListeners();
  }

  void _sort() {
    entries.sort((a, b) => b.date.compareTo(a.date));
    reflections.sort((a, b) => b.generatedAt.compareTo(a.generatedAt));
  }
}
