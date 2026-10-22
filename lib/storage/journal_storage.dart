import '../models/daily_entry.dart';
import '../models/reflection.dart';

abstract class JournalStorage {
  Future<List<DailyEntry>> loadEntries();
  Future<void> saveEntry(DailyEntry entry);
  Future<void> deleteEntry(DateTime date);
  Future<List<Reflection>> loadReflections();
  Future<void> saveReflection(Reflection reflection);
  Future<void> deleteReflection(String id);
  Future<String?> getSetting(String key);
  Future<void> setSetting(String key, String value);
  Future<void> deleteAll();
}
