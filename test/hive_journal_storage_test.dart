import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:how_was_your_day/models/daily_entry.dart';
import 'package:how_was_your_day/storage/hive_journal_storage.dart';

void main() {
  test('Hive persistence survives boxes being closed and reopened', () async {
    final directory = await Directory.systemTemp.createTemp(
      'journal_hive_test',
    );
    addTearDown(() async {
      await Hive.close();
      if (directory.existsSync()) await directory.delete(recursive: true);
    });

    Hive.init(directory.path);
    final storage = HiveJournalStorage();
    await storage.initialize();
    final now = DateTime.now();
    await storage.saveEntry(
      DailyEntry(
        id: 'persistent-id',
        date: now,
        rating: 8,
        note: 'Persisted locally',
        tags: const ['Friends'],
        createdAt: now,
        updatedAt: now,
      ),
    );

    await Hive.close();
    Hive.init(directory.path);
    final reopened = HiveJournalStorage();
    await reopened.initialize();
    final entries = await reopened.loadEntries();

    expect(entries, hasLength(1));
    expect(entries.single.id, 'persistent-id');
    expect(entries.single.note, 'Persisted locally');
    expect(entries.single.tags, ['friends']);
  });
}
