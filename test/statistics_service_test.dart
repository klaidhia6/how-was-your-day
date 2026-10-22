import 'package:flutter_test/flutter_test.dart';
import 'package:how_was_your_day/models/daily_entry.dart';
import 'package:how_was_your_day/services/statistics_service.dart';

DailyEntry entry(String date, int rating, {List<String> tags = const []}) {
  final day = DateTime.parse(date);
  return DailyEntry(
    id: date,
    date: day,
    rating: rating,
    note: '',
    tags: tags,
    createdAt: day,
    updatedAt: day,
  );
}

void main() {
  test('average is null for an empty dataset', () {
    expect(StatisticsService.average([]), isNull);
  });

  test('average rating is calculated', () {
    expect(
      StatisticsService.average([
        entry('2026-10-01', 5),
        entry('2026-10-02', 9),
      ]),
      7,
    );
  });

  test('current week starts on Monday and respects date boundaries', () {
    final values = [
      entry('2026-10-04', 4),
      entry('2026-10-05', 5),
      entry('2026-10-11', 9),
      entry('2026-10-12', 10),
    ];
    final result = StatisticsService.currentWeek(
      values,
      DateTime(2026, 10, 11),
    );
    expect(result.map((item) => item.id), ['2026-10-05', '2026-10-11']);
  });

  test('current month excludes adjacent months and future days', () {
    final values = [
      entry('2026-09-30', 4),
      entry('2026-10-01', 5),
      entry('2026-10-11', 9),
      entry('2026-10-12', 10),
    ];
    final result = StatisticsService.currentMonth(
      values,
      DateTime(2026, 10, 11),
    );
    expect(result.map((item) => item.id), ['2026-10-01', '2026-10-11']);
  });

  test('trend compares recent seven days with the previous seven', () {
    final values = [
      entry('2026-09-30', 4),
      entry('2026-10-02', 5),
      entry('2026-10-06', 8),
      entry('2026-10-10', 9),
    ];
    expect(
      StatisticsService.recentTrend(values, DateTime(2026, 10, 11)),
      Trend.higher,
    );
  });

  test('tag statistics count entries and calculate averages', () {
    final result = StatisticsService.tagStatistics([
      entry('2026-10-01', 6, tags: ['Work']),
      entry('2026-10-02', 8, tags: ['Work', 'Exercise']),
    ]);
    expect(result.first.tag, 'Work');
    expect(result.first.count, 2);
    expect(result.first.average, 7);
    expect(result.last.average, 8);
  });
}
