import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'services/ai_reflection_service.dart';
import 'storage/hive_journal_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final storage = HiveJournalStorage();
  await storage.initialize();
  final api = AiReflectionService(
    baseUrl: const String.fromEnvironment(
      'BACKEND_BASE_URL',
      defaultValue: 'http://10.0.2.2:3000',
    ),
  );
  runApp(JournalApp(storage: storage, aiService: api));
}
