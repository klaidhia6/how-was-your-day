enum ReflectionType { weekly, monthly }

class ReflectionContent {
  const ReflectionContent({
    required this.title,
    required this.overall,
    required this.wins,
    required this.challenges,
    required this.patterns,
    required this.suggestions,
  });

  final String title;
  final String overall;
  final List<String> wins;
  final List<String> challenges;
  final List<String> patterns;
  final List<String> suggestions;

  Map<String, dynamic> toJson() => {
    'title': title,
    'overall': overall,
    'wins': wins,
    'challenges': challenges,
    'patterns': patterns,
    'suggestions': suggestions,
  };

  factory ReflectionContent.fromJson(Map<String, dynamic> json) =>
      ReflectionContent(
        title: json['title'] as String,
        overall: json['overall'] as String,
        wins: List<String>.from(json['wins'] as List),
        challenges: List<String>.from(json['challenges'] as List),
        patterns: List<String>.from(json['patterns'] as List),
        suggestions: List<String>.from(json['suggestions'] as List),
      );
}

class Reflection {
  const Reflection({
    required this.id,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.generatedAt,
    required this.content,
  });

  final String id;
  final ReflectionType type;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime generatedAt;
  final ReflectionContent content;

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type.name,
    'startDate': startDate.toIso8601String(),
    'endDate': endDate.toIso8601String(),
    'generatedAt': generatedAt.toIso8601String(),
    'content': content.toJson(),
  };

  factory Reflection.fromJson(Map<String, dynamic> json) => Reflection(
    id: json['id'] as String,
    type: ReflectionType.values.byName(json['type'] as String),
    startDate: DateTime.parse(json['startDate'] as String),
    endDate: DateTime.parse(json['endDate'] as String),
    generatedAt: DateTime.parse(json['generatedAt'] as String),
    content: ReflectionContent.fromJson(
      Map<String, dynamic>.from(json['content'] as Map),
    ),
  );
}
