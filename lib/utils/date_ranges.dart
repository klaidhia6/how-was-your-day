import '../models/daily_entry.dart';
import '../models/reflection.dart';
import '../services/statistics_service.dart';

class ReflectionRange {
  const ReflectionRange(this.start, this.end, this.minimumEntries);
  final DateTime start;
  final DateTime end;
  final int minimumEntries;
}

ReflectionRange reflectionRange(ReflectionType type, DateTime now) {
  final today = DailyEntry.calendarDate(now);
  if (type == ReflectionType.weekly) {
    return ReflectionRange(StatisticsService.startOfWeek(today), today, 3);
  }
  return ReflectionRange(DateTime(today.year, today.month), today, 7);
}
