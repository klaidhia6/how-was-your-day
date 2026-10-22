import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:how_was_your_day/models/daily_entry.dart';
import 'package:how_was_your_day/models/reflection.dart';
import 'package:how_was_your_day/services/ai_reflection_service.dart';

void main() {
  test('selected language is included in the reflection request', () async {
    late Map<String, dynamic> requestBody;
    final client = MockClient((request) async {
      requestBody = jsonDecode(request.body) as Map<String, dynamic>;
      return http.Response(
        jsonEncode({
          'reflection': {
            'title': 'Votre réflexion',
            'overall': 'Une semaine stable.',
            'wins': <String>[],
            'challenges': <String>[],
            'patterns': <String>[],
            'suggestions': ['Continuez à observer.'],
          },
        }),
        200,
      );
    });
    final now = DateTime(2026, 10, 11);
    final service = AiReflectionService(
      baseUrl: 'https://example.test',
      client: client,
    );

    await service.generate(
      type: ReflectionType.weekly,
      language: 'fr',
      entries: [
        DailyEntry(
          id: 'one',
          date: now,
          rating: 7,
          note: 'A mixed-language note',
          tags: const ['work'],
          createdAt: now,
          updatedAt: now,
        ),
      ],
    );

    expect(requestBody['language'], 'fr');
    expect(
      (requestBody['entries'] as List).single['note'],
      'A mixed-language note',
    );
  });
}
