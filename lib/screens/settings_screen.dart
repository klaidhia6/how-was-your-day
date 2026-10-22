import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../services/journal_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required this.controller});
  final JournalController controller;

  Future<void> _deleteAll(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.delete_forever_outlined),
        title: Text(context.l10n.deleteAllQuestion),
        content: Text(context.l10n.deleteAllBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(context.l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(context.l10n.deleteAllButton),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await controller.deleteAll();
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(context.l10n.allDataDeleted)));
      }
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(context.l10n.settingsTitle)),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
      children: [
        Text(
          context.l10n.theme,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        SegmentedButton<ThemeMode>(
          segments: [
            ButtonSegment(
              value: ThemeMode.system,
              label: Text(context.l10n.themeSystem),
              icon: const Icon(Icons.settings_brightness),
            ),
            ButtonSegment(
              value: ThemeMode.light,
              label: Text(context.l10n.themeLight),
              icon: const Icon(Icons.light_mode_outlined),
            ),
            ButtonSegment(
              value: ThemeMode.dark,
              label: Text(context.l10n.themeDark),
              icon: const Icon(Icons.dark_mode_outlined),
            ),
          ],
          selected: {controller.themeMode},
          showSelectedIcon: false,
          onSelectionChanged: (selection) =>
              controller.setThemeMode(selection.first),
        ),
        const SizedBox(height: 28),
        Text(
          context.l10n.language,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          key: ValueKey(controller.languageCode ?? 'system'),
          initialValue: controller.languageCode ?? 'system',
          decoration: InputDecoration(prefixIcon: const Icon(Icons.language)),
          items: [
            DropdownMenuItem(
              value: 'system',
              child: Text(context.l10n.languageSystem),
            ),
            DropdownMenuItem(
              value: 'en',
              child: Text(context.l10n.languageEnglish),
            ),
            DropdownMenuItem(
              value: 'fr',
              child: Text(context.l10n.languageFrench),
            ),
            DropdownMenuItem(
              value: 'es',
              child: Text(context.l10n.languageSpanish),
            ),
            DropdownMenuItem(
              value: 'it',
              child: Text(context.l10n.languageItalian),
            ),
            DropdownMenuItem(
              value: 'de',
              child: Text(context.l10n.languageGerman),
            ),
            DropdownMenuItem(
              value: 'pt',
              child: Text(context.l10n.languagePortuguese),
            ),
            DropdownMenuItem(
              value: 'ar',
              child: Text(context.l10n.languageArabic),
            ),
          ],
          onChanged: (value) =>
              controller.setLanguage(value == 'system' ? null : value),
        ),
        const SizedBox(height: 28),
        Text(
          context.l10n.privacy,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.smartphone_outlined),
                title: Text(context.l10n.journalStoredTitle),
                subtitle: Text(context.l10n.journalStoredBody),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.auto_awesome_outlined),
                title: Text(context.l10n.aiOptionalTitle),
                subtitle: Text(context.l10n.aiOptionalBody),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.delete_forever_outlined,
              color: Theme.of(context).colorScheme.error,
            ),
            title: Text(context.l10n.deleteAllData),
            subtitle: Text(context.l10n.deleteAllSubtitle),
            onTap: () => _deleteAll(context),
          ),
        ),
        const SizedBox(height: 28),
        Text(
          context.l10n.about,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Card(
          child: ListTile(
            leading: const Icon(Icons.favorite_outline),
            title: Text(context.l10n.appTitle),
            subtitle: Text(
              '${context.l10n.versionLabel('1.0.0')}\n${context.l10n.aboutTagline}',
            ),
          ),
        ),
      ],
    ),
  );
}
