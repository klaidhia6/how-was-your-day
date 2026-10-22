import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/daily_entry.dart';
import '../models/reflection.dart';

class ReflectionException implements Exception {
  const ReflectionException(this.type);
  final ReflectionErrorType type;
  @override
  String toString() => type.name;
}

enum ReflectionErrorType {
  alreadyRunning,
  insufficientEntries,
  timeout,
  invalidResponse,
  unavailable,
  connection,
}

class AiReflectionService {
  AiReflectionService({required String baseUrl, http.Client? client})
    : baseUrl = baseUrl.replaceAll(RegExp(r'/$'), ''),
      _client = client ?? http.Client();

  final String baseUrl;
  final http.Client _client;

  Future<ReflectionContent> generate({
    required ReflectionType type,
    required List<DailyEntry> entries,
    required String language,
  }) async {
    try {
      final response = await _client
          .post(
            Uri.parse('$baseUrl/api/reflection'),
            headers: {'content-type': 'application/json'},
            body: jsonEncode({
              'period': type.name,
              'language': language,
              'entries': entries
                  .map(
                    (entry) => {
                      'date': DailyEntry.dateKey(entry.date),
                      'rating': entry.rating,
                      'note': entry.note,
                      'tags': entry.tags,
                    },
                  )
                  .toList(),
            }),
          )
          .timeout(const Duration(seconds: 30));
      final body = jsonDecode(response.body);
      if (response.statusCode != 200) {
        final code = body is Map ? body['error'] as String? : null;
        throw ReflectionException(
          code == 'insufficient_entries'
              ? ReflectionErrorType.insufficientEntries
              : ReflectionErrorType.unavailable,
        );
      }
      if (body is! Map || body['reflection'] is! Map) {
        throw const ReflectionException(ReflectionErrorType.invalidResponse);
      }
      return ReflectionContent.fromJson(
        Map<String, dynamic>.from(body['reflection'] as Map),
      );
    } on ReflectionException {
      rethrow;
    } on TimeoutException {
      throw const ReflectionException(ReflectionErrorType.timeout);
    } on FormatException {
      throw const ReflectionException(ReflectionErrorType.invalidResponse);
    } catch (_) {
      throw const ReflectionException(ReflectionErrorType.connection);
    }
  }
}
