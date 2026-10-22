import 'package:flutter/material.dart';

import 'l10n/app_localizations.dart';
import 'l10n/l10n.dart';
import 'screens/home_screen.dart';
import 'services/ai_reflection_service.dart';
import 'services/journal_controller.dart';
import 'storage/journal_storage.dart';
import 'theme/app_theme.dart';

Locale resolveAppLocale(
  Locale? deviceLocale,
  Iterable<Locale> supportedLocales,
) {
  if (deviceLocale != null) {
    for (final locale in supportedLocales) {
      if (locale.languageCode == deviceLocale.languageCode) return locale;
    }
  }
  return const Locale('en');
}

class JournalApp extends StatefulWidget {
  const JournalApp({super.key, required this.storage, required this.aiService});

  final JournalStorage storage;
  final AiReflectionService aiService;

  @override
  State<JournalApp> createState() => _JournalAppState();
}

class _JournalAppState extends State<JournalApp> {
  late final JournalController controller;

  @override
  void initState() {
    super.initState();
    controller = JournalController(
      storage: widget.storage,
      aiService: widget.aiService,
    )..initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: controller,
    builder: (context, _) => MaterialApp(
      onGenerateTitle: (context) => context.l10n.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: controller.themeMode,
      locale: controller.languageCode == null
          ? null
          : Locale(controller.languageCode!),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      localeResolutionCallback: resolveAppLocale,
      home: controller.initialized
          ? HomeScreen(controller: controller)
          : const Scaffold(body: Center(child: CircularProgressIndicator())),
    ),
  );
}
