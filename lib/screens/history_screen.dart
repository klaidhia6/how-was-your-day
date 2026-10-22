import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../l10n/l10n.dart';
import '../models/daily_entry.dart';
import '../services/journal_controller.dart';
import '../theme/app_theme.dart';
import '../utils/journal_tags.dart';
import 'entry_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key, required this.controller});
  final JournalController controller;

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late DateTime month = DateTime(DateTime.now().year, DateTime.now().month);

  void _open(DateTime date) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => EntryScreen(controller: widget.controller, date: date),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final monthEntries = widget.controller.entries
        .where(
          (entry) =>
              entry.date.year == month.year && entry.date.month == month.month,
        )
        .toList();
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => setState(
                        () => month = DateTime(month.year, month.month - 1),
                      ),
                      icon: const Icon(Icons.chevron_left),
                    ),
                    Expanded(
                      child: Text(
                        DateFormat.yMMMM(context.localeName).format(month),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    IconButton(
                      onPressed:
                          DateTime(month.year, month.month + 1).isAfter(
                            DateTime(DateTime.now().year, DateTime.now().month),
                          )
                          ? null
                          : () => setState(
                              () =>
                                  month = DateTime(month.year, month.month + 1),
                            ),
                      icon: const Icon(Icons.chevron_right),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    7,
                    (index) => SizedBox(
                      width: 34,
                      child: Text(
                        DateFormat.E(context.localeName)
                            .format(DateTime(2024, 1, 1 + index)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                _CalendarGrid(
                  month: month,
                  controller: widget.controller,
                  onOpen: _open,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 22),
        Text(
          context.l10n.entries,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        if (monthEntries.isEmpty)
          const _EmptyHistory()
        else
          ...monthEntries.map(
            (entry) => Card(
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 6,
                ),
                leading: CircleAvatar(
                  backgroundColor: AppTheme.ratingColor(context, entry.rating),
                  foregroundColor: Colors.white,
                  child: Text(
                    NumberFormat.decimalPattern(context.localeName)
                        .format(entry.rating),
                  ),
                ),
                title: Text(
                  DateFormat.MMMMEEEEd(context.localeName).format(entry.date),
                ),
                subtitle: Text(
                  entry.note.isNotEmpty
                      ? entry.note
                      : entry.tags.isNotEmpty
                      ? entry.tags
                            .map((tag) => tagLabel(context.l10n, tag))
                            .join(' · ')
                      : context.l10n.noNote,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _open(entry.date),
              ),
            ),
          ),
      ],
    );
  }
}

class _CalendarGrid extends StatelessWidget {
  const _CalendarGrid({
    required this.month,
    required this.controller,
    required this.onOpen,
  });
  final DateTime month;
  final JournalController controller;
  final ValueChanged<DateTime> onOpen;

  @override
  Widget build(BuildContext context) {
    final days = DateTime(month.year, month.month + 1, 0).day;
    final offset = month.weekday - 1;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemCount: offset + days,
      itemBuilder: (context, index) {
        if (index < offset) return const SizedBox.shrink();
        final date = DateTime(month.year, month.month, index - offset + 1);
        final entry = controller.entryForDate(date);
        final future = date.isAfter(DailyEntry.calendarDate(DateTime.now()));
        return InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: future ? null : () => onOpen(date),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                NumberFormat.decimalPattern(context.localeName)
                    .format(date.day),
                style: TextStyle(
                  color: future ? Theme.of(context).disabledColor : null,
                ),
              ),
              const SizedBox(height: 4),
              if (entry != null)
                Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(
                    color: AppTheme.ratingColor(context, entry.rating),
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _EmptyHistory extends StatelessWidget {
  const _EmptyHistory();
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Icon(
            Icons.auto_stories_outlined,
            size: 36,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 10),
          Text(context.l10n.noEntriesYet),
          const SizedBox(height: 4),
          Text(
            context.l10n.historyEmpty,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    ),
  );
}
