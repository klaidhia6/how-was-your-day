import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../l10n/l10n.dart';
import '../models/daily_entry.dart';
import '../services/journal_controller.dart';
import '../utils/journal_tags.dart';
import 'rating_selector.dart';

class EntryEditor extends StatefulWidget {
  const EntryEditor({
    super.key,
    required this.controller,
    required this.date,
    this.onSaved,
  });

  final JournalController controller;
  final DateTime date;
  final VoidCallback? onSaved;

  @override
  State<EntryEditor> createState() => _EntryEditorState();
}

class _EntryEditorState extends State<EntryEditor> {
  late final TextEditingController noteController;
  int? rating;
  final selectedTags = <String>{};
  bool saving = false;

  DailyEntry? get existing => widget.controller.entryForDate(widget.date);

  @override
  void initState() {
    super.initState();
    final entry = existing;
    rating = entry?.rating;
    selectedTags.addAll(entry?.tags ?? const []);
    noteController = TextEditingController(text: entry?.note ?? '');
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (rating == null || saving) {
      if (rating == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(context.l10n.chooseRatingFirst)));
      }
      return;
    }
    final wasExisting = existing != null;
    setState(() => saving = true);
    await widget.controller.saveEntry(
      date: widget.date,
      rating: rating!,
      note: noteController.text,
      tags: selectedTags.toList(),
    );
    if (!mounted) return;
    setState(() => saving = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          wasExisting ? context.l10n.dayUpdated : context.l10n.daySaved,
        ),
      ),
    );
    widget.onSaved?.call();
  }

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
    children: [
      Text(
        DailyEntry.dateKey(widget.date) == DailyEntry.dateKey(DateTime.now())
            ? context.l10n.howWasYourDay
            : context.l10n.howWasDate(
                DateFormat.MMMMd(context.localeName).format(widget.date),
              ),
        style: Theme.of(context).textTheme.headlineMedium
            ?.copyWith(fontWeight: FontWeight.w700),
      ),
      const SizedBox(height: 6),
      Text(
        context.l10n.noWrongAnswer,
        style: Theme.of(context).textTheme.bodyLarge
            ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
      ),
      const SizedBox(height: 24),
      RatingSelector(
        value: rating,
        onChanged: (value) => setState(() => rating = value),
      ),
      const SizedBox(height: 30),
      Text(
        context.l10n.whatHappenedToday,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      const SizedBox(height: 10),
      TextField(
        controller: noteController,
        minLines: 4,
        maxLines: 8,
        maxLength: 4000,
        decoration: InputDecoration(
          hintText: context.l10n.noteHint,
          counterText: '',
        ),
      ),
      const SizedBox(height: 24),
      Text(
        context.l10n.anythingShapedIt,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      const SizedBox(height: 12),
      Wrap(
        spacing: 8,
        runSpacing: 4,
        children: journalTagIds
            .map(
              (tag) => FilterChip(
                label: Text(tagLabel(context.l10n, tag)),
                selected: selectedTags.contains(tag),
                onSelected: (selected) => setState(() {
                  selected ? selectedTags.add(tag) : selectedTags.remove(tag);
                }),
              ),
            )
            .toList(),
      ),
      const SizedBox(height: 30),
      FilledButton.icon(
        onPressed: saving ? null : _save,
        icon: saving
            ? const SizedBox.square(
                dimension: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Icon(Icons.check_rounded),
        label: Text(
          existing == null ? context.l10n.saveDay : context.l10n.updateDay,
        ),
      ),
      const SizedBox(height: 14),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.lock_outline_rounded,
            size: 16,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 6),
          Text(
            context.l10n.storedOnlyDevice,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    ],
  );
}
