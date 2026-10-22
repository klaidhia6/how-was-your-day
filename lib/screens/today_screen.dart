import 'package:flutter/material.dart';

import '../services/journal_controller.dart';
import '../widgets/entry_editor.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key, required this.controller});
  final JournalController controller;

  @override
  Widget build(BuildContext context) => EntryEditor(
    key: ValueKey(controller.entryForDate(DateTime.now())?.updatedAt),
    controller: controller,
    date: DateTime.now(),
  );
}
