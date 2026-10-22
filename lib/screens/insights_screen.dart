import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../l10n/l10n.dart';
import '../models/daily_entry.dart';
import '../models/reflection.dart';
import '../services/ai_reflection_service.dart';
import '../services/journal_controller.dart';
import '../services/statistics_service.dart';
import '../utils/date_ranges.dart';
import '../utils/journal_tags.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key, required this.controller});
  final JournalController controller;

  String _average(List<DailyEntry> entries, String locale) {
    final value = StatisticsService.average(entries);
    return value == null
        ? '—'
        : NumberFormat.decimalPatternDigits(
            locale: locale,
            decimalDigits: 1,
          ).format(value);
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final week = StatisticsService.currentWeek(controller.entries, now);
    final month = StatisticsService.currentMonth(controller.entries, now);
    final trend = StatisticsService.recentTrend(controller.entries, now);
    final maximumScore = NumberFormat.decimalPattern(context.localeName)
        .format(10);
    final tags = StatisticsService.tagStatistics(controller.entries).take(5);
    final highest = controller.entries.isEmpty
        ? null
        : controller.entries.reduce((a, b) => a.rating >= b.rating ? a : b);
    final lowest = controller.entries.isEmpty
        ? null
        : controller.entries.reduce((a, b) => a.rating <= b.rating ? a : b);

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
      children: [
        Text(
          context.l10n.yourPatterns,
          style: Theme.of(context).textTheme.headlineMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 6),
        Text(
          context.l10n.observationsDescription,
          style: Theme.of(context).textTheme.bodyLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 20),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.25,
          children: [
            _StatCard(
              label: context.l10n.thisWeek,
              value: context.l10n.scoreOutOfTen(
                _average(week, context.localeName),
                maximumScore,
              ),
              detail: context.l10n.loggedDays(week.length),
            ),
            _StatCard(
              label: DateFormat.MMMM(context.localeName).format(now),
              value: context.l10n.scoreOutOfTen(
                _average(month, context.localeName),
                maximumScore,
              ),
              detail: context.l10n.loggedDays(month.length),
            ),
            _StatCard(
              label: context.l10n.highest,
              value: highest == null
                  ? '—'
                  : context.l10n.scoreOutOfTen(
                      NumberFormat.decimalPattern(context.localeName)
                          .format(highest.rating),
                      maximumScore,
                    ),
              detail: highest == null
                  ? context.l10n.noEntriesShort
                  : DateFormat.MMMd(context.localeName).format(highest.date),
            ),
            _StatCard(
              label: context.l10n.lowest,
              value: lowest == null
                  ? '—'
                  : context.l10n.scoreOutOfTen(
                      NumberFormat.decimalPattern(context.localeName)
                          .format(lowest.rating),
                      maximumScore,
                    ),
              detail: lowest == null
                  ? context.l10n.noEntriesShort
                  : DateFormat.MMMd(context.localeName).format(lowest.date),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Card(
          child: ListTile(
            leading: const Icon(Icons.trending_up_rounded),
            title: Text(context.l10n.recentTrend),
            subtitle: Text(switch (trend) {
              Trend.higher => context.l10n.trendingHigher,
              Trend.same => context.l10n.aboutTheSame,
              Trend.lower => context.l10n.trendingLower,
              Trend.insufficient => context.l10n.logMoreForTrend,
            }),
          ),
        ),
        const SizedBox(height: 22),
        Text(
          context.l10n.commonTags,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        if (tags.isEmpty)
          Text(
            context.l10n.patternsAppear,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        else
          Card(
            child: Column(
              children: tags
                  .map(
                    (tag) => ListTile(
                      title: Text(tagLabel(context.l10n, tag.tag)),
                      subtitle: Text(
                        context.l10n.averageValue(
                          NumberFormat.decimalPatternDigits(
                            locale: context.localeName,
                            decimalDigits: 1,
                          ).format(tag.average),
                        ),
                      ),
                      trailing: Text(context.l10n.dayCount(tag.count)),
                    ),
                  )
                  .toList(),
            ),
          ),
        const SizedBox(height: 28),
        _AiSection(controller: controller),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.detail,
  });
  final String label;
  final String value;
  final String detail;

  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 5),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 3),
          Text(detail, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    ),
  );
}

class _AiSection extends StatelessWidget {
  const _AiSection({required this.controller});
  final JournalController controller;

  Future<bool> _confirmConsent(BuildContext context) async {
    if (controller.aiConsent) return true;
    final accepted = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.privacy_tip_outlined),
        title: Text(context.l10n.beforeContinue),
        content: Text(context.l10n.consentText),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(context.l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(context.l10n.continueButton),
          ),
        ],
      ),
    );
    if (accepted == true) await controller.acceptAiConsent();
    return accepted == true;
  }

  Future<void> _generate(BuildContext context, ReflectionType type) async {
    final range = reflectionRange(type, DateTime.now());
    final count = StatisticsService.between(
      controller.entries,
      range.start,
      range.end,
    ).length;
    if (count < range.minimumEntries) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(context.l10n.logMoreDays)));
      return;
    }
    if (!await _confirmConsent(context) || !context.mounted) return;
    try {
      final reflection = await controller.generateReflection(
        type,
        activeLanguageCode: Localizations.localeOf(context).languageCode,
      );
      if (context.mounted) _showReflection(context, reflection);
    } on ReflectionException catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_errorMessage(context, error.type))),
        );
      }
    }
  }

  String _errorMessage(BuildContext context, ReflectionErrorType type) =>
      switch (type) {
        ReflectionErrorType.alreadyRunning =>
          context.l10n.reflectionAlreadyRunning,
        ReflectionErrorType.insufficientEntries => context.l10n.logMoreDays,
        ReflectionErrorType.timeout => context.l10n.reflectionTimeout,
        ReflectionErrorType.invalidResponse => context.l10n.reflectionInvalid,
        ReflectionErrorType.unavailable => context.l10n.reflectionUnavailable,
        ReflectionErrorType.connection => context.l10n.reflectionConnection,
      };

  void _showReflection(BuildContext context, Reflection reflection) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.85,
        builder: (context, scrollController) => _ReflectionView(
          reflection: reflection,
          scrollController: scrollController,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.l10n.aiReflection,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      const SizedBox(height: 6),
      Text(
        context.l10n.aiDescription,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      const SizedBox(height: 12),
      Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (controller.entries.isEmpty) ...[
                Text(context.l10n.logFirst),
                const SizedBox(height: 12),
              ],
              FilledButton.tonalIcon(
                onPressed: controller.generatingReflection
                    ? null
                    : () => _generate(context, ReflectionType.weekly),
                icon: const Icon(Icons.calendar_view_week_outlined),
                label: Text(context.l10n.weeklyReflection),
              ),
              const SizedBox(height: 8),
              FilledButton.tonalIcon(
                onPressed: controller.generatingReflection
                    ? null
                    : () => _generate(context, ReflectionType.monthly),
                icon: const Icon(Icons.calendar_month_outlined),
                label: Text(context.l10n.monthlyReflection),
              ),
              if (controller.generatingReflection) ...[
                const SizedBox(height: 14),
                const LinearProgressIndicator(),
                const SizedBox(height: 8),
                Text(
                  context.l10n.lookingForPatterns,
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 12),
              Text(
                context.l10n.onlySelectedSent,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
      if (controller.reflections.isNotEmpty) ...[
        const SizedBox(height: 18),
        Text(
          context.l10n.savedReflections,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        ...controller.reflections.map(
          (reflection) => Card(
            child: ListTile(
              leading: const Icon(Icons.auto_awesome_outlined),
              title: Text(reflection.content.title),
              subtitle: Text(
                DateFormat.yMMMd(context.localeName)
                    .format(reflection.generatedAt),
              ),
              onTap: () => _showReflection(context, reflection),
              trailing: IconButton(
                tooltip: context.l10n.deleteReflectionTooltip,
                icon: const Icon(Icons.delete_outline),
                onPressed: () => controller.deleteReflection(reflection.id),
              ),
            ),
          ),
        ),
      ],
    ],
  );
}

class _ReflectionView extends StatelessWidget {
  const _ReflectionView({
    required this.reflection,
    required this.scrollController,
  });
  final Reflection reflection;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final content = reflection.content;
    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(24, 4, 24, 32),
      children: [
        Text(
          content.title,
          style: Theme.of(context).textTheme.headlineSmall
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 6),
        Text(
          '${DateFormat.MMMd(context.localeName).format(reflection.startDate)} – ${DateFormat.yMMMd(context.localeName).format(reflection.endDate)}',
        ),
        const SizedBox(height: 22),
        _ReflectionPart(
          title: context.l10n.reflectionOverall,
          items: [content.overall],
        ),
        _ReflectionPart(
          title: context.l10n.reflectionWentWell,
          items: content.wins,
        ),
        _ReflectionPart(
          title: context.l10n.reflectionDifficulties,
          items: content.challenges,
        ),
        _ReflectionPart(
          title: context.l10n.reflectionPatterns,
          items: content.patterns,
        ),
        _ReflectionPart(
          title: context.l10n.reflectionTry,
          items: content.suggestions,
        ),
      ],
    );
  }
}

class _ReflectionPart extends StatelessWidget {
  const _ReflectionPart({required this.title, required this.items});
  final String title;
  final List<String> items;
  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 7),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(items.length == 1 ? item : '• $item'),
            ),
          ),
        ],
      ),
    );
  }
}
