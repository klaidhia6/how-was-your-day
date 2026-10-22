import '../models/daily_entry.dart';

enum Trend { higher, same, lower, insufficient }

class TagStatistic {
  const TagStatistic(this.tag, this.count, this.average);
  final String tag;
  final int count;
  final double average;
}

class StatisticsService {
  static List<DailyEntry> between(
    Iterable<DailyEntry> entries,
    DateTime start,
    DateTime end,
  ) {
    final from = DailyEntry.calendarDate(start);
    final through = DailyEntry.calendarDate(end);
    return entries.where((entry) {
      final day = DailyEntry.calendarDate(entry.date);
      return !day.isBefore(from) && !day.isAfter(through);
    }).toList();
  }

  static double? average(Iterable<DailyEntry> entries) {
    if (entries.isEmpty) return null;
    return entries.fold<int>(0, (sum, entry) => sum + entry.rating) /
        entries.length;
  }

  static DateTime startOfWeek(DateTime day) {
    final date = DailyEntry.calendarDate(day);
    return date.subtract(Duration(days: date.weekday - DateTime.monday));
  }

  static List<DailyEntry> currentWeek(
    Iterable<DailyEntry> entries,
    DateTime now,
  ) => between(entries, startOfWeek(now), now);

  static List<DailyEntry> currentMonth(
    Iterable<DailyEntry> entries,
    DateTime now,
  ) => between(entries, DateTime(now.year, now.month), now);

  static Trend recentTrend(Iterable<DailyEntry> entries, DateTime now) {
    final today = DailyEntry.calendarDate(now);
    final recent = between(
      entries,
      today.subtract(const Duration(days: 6)),
      today,
    );
    final previous = between(
      entries,
      today.subtract(const Duration(days: 13)),
      today.subtract(const Duration(days: 7)),
    );
    final recentAverage = average(recent);
    final previousAverage = average(previous);
    if (recentAverage == null || previousAverage == null) {
      return Trend.insufficient;
    }
    final difference = recentAverage - previousAverage;
    if (difference.abs() < 0.35) return Trend.same;
    return difference > 0 ? Trend.higher : Trend.lower;
  }

  static List<TagStatistic> tagStatistics(Iterable<DailyEntry> entries) {
    final ratings = <String, List<int>>{};
    for (final entry in entries) {
      for (final tag in entry.tags.toSet()) {
        ratings.putIfAbsent(tag, () => []).add(entry.rating);
      }
    }
    final result =
        ratings.entries
            .map(
              (entry) => TagStatistic(
                entry.key,
                entry.value.length,
                entry.value.reduce((a, b) => a + b) / entry.value.length,
              ),
            )
            .toList()
          ..sort((a, b) => b.count.compareTo(a.count));
    return result;
  }
}
