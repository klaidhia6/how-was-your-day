class DailyEntry {
  const DailyEntry({
    required this.id,
    required this.date,
    required this.rating,
    required this.note,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final DateTime date;
  final int rating;
  final String note;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime updatedAt;

  static DateTime calendarDate(DateTime value) =>
      DateTime(value.year, value.month, value.day);

  static String dateKey(DateTime value) {
    final date = calendarDate(value);
    return '${date.year.toString().padLeft(4, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';
  }

  DailyEntry copyWith({
    int? rating,
    String? note,
    List<String>? tags,
    DateTime? updatedAt,
  }) => DailyEntry(
    id: id,
    date: date,
    rating: rating ?? this.rating,
    note: note ?? this.note,
    tags: tags ?? this.tags,
    createdAt: createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': dateKey(date),
    'rating': rating,
    'note': note,
    'tags': tags,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory DailyEntry.fromJson(Map<String, dynamic> json) => DailyEntry(
    id: json['id'] as String,
    date: DateTime.parse(json['date'] as String),
    rating: json['rating'] as int,
    note: (json['note'] as String?) ?? '',
    tags: List<String>.from((json['tags'] as List?) ?? const []),
    createdAt: DateTime.parse(json['createdAt'] as String),
    updatedAt: DateTime.parse(json['updatedAt'] as String),
  );
}
