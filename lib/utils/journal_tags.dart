import '../l10n/app_localizations.dart';

const journalTagIds = [
  'work',
  'study',
  'family',
  'friends',
  'relationship',
  'exercise',
  'sleep',
  'money',
  'relaxation',
  'health',
  'travel',
  'other',
];

const _legacyTagIds = {
  'Work': 'work',
  'Study': 'study',
  'Family': 'family',
  'Friends': 'friends',
  'Relationship': 'relationship',
  'Exercise': 'exercise',
  'Sleep': 'sleep',
  'Money': 'money',
  'Relaxation': 'relaxation',
  'Health': 'health',
  'Travel': 'travel',
  'Other': 'other',
};

String normalizeTagId(String value) =>
    _legacyTagIds[value] ?? (journalTagIds.contains(value) ? value : value);

String tagLabel(AppLocalizations l10n, String id) => switch (id) {
  'work' => l10n.tagWork,
  'study' => l10n.tagStudy,
  'family' => l10n.tagFamily,
  'friends' => l10n.tagFriends,
  'relationship' => l10n.tagRelationship,
  'exercise' => l10n.tagExercise,
  'sleep' => l10n.tagSleep,
  'money' => l10n.tagMoney,
  'relaxation' => l10n.tagRelaxation,
  'health' => l10n.tagHealth,
  'travel' => l10n.tagTravel,
  'other' => l10n.tagOther,
  _ => id,
};
