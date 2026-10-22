import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../l10n/l10n.dart';
import '../services/journal_controller.dart';
import '../widgets/entry_editor.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key, required this.controller, required this.date});
  final JournalController controller;
  final DateTime date;

  Future<void> _delete(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.deleteEntryQuestion),
        content: Text(context.l10n.deleteEntryBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(context.l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(context.l10n.delete),
          ),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      await controller.deleteEntry(date);
      if (context.mounted) Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(DateFormat.yMMMMd(context.localeName).format(date)),
      actions: [
        if (controller.entryForDate(date) != null)
          IconButton(
            tooltip: context.l10n.deleteEntryTooltip,
            icon: const Icon(Icons.delete_outline),
            onPressed: () => _delete(context),
          ),
      ],
    ),
    body: EntryEditor(
      controller: controller,
      date: date,
      onSaved: () => Navigator.pop(context),
    ),
  );
}
