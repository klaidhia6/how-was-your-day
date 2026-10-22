// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'How Was Your Day?';

  @override
  String get navToday => 'Today';

  @override
  String get navHistory => 'History';

  @override
  String get navInsights => 'Insights';

  @override
  String get settingsTooltip => 'Settings';

  @override
  String get howWasYourDay => 'How was your day?';

  @override
  String howWasDate(String date) {
    return 'How was $date?';
  }

  @override
  String get noWrongAnswer => 'There is no wrong answer.';

  @override
  String get chooseNumber => 'Choose a number that feels right';

  @override
  String ratingOutOfTen(String rating, String maximum) {
    return '$rating out of $maximum';
  }

  @override
  String get difficultDay => 'A difficult day';

  @override
  String get averageDay => 'An average day';

  @override
  String get goodDay => 'A good day';

  @override
  String get greatDay => 'A great day';

  @override
  String get whatHappenedToday => 'What happened today?';

  @override
  String get noteHint => 'Write a few words about your day…';

  @override
  String get anythingShapedIt => 'Anything that shaped it?';

  @override
  String get chooseRatingFirst => 'Choose a rating first.';

  @override
  String get saveDay => 'Save Day';

  @override
  String get updateDay => 'Update Day';

  @override
  String get daySaved => 'Today saved.';

  @override
  String get dayUpdated => 'Day updated.';

  @override
  String get storedOnlyDevice => 'Stored only on this device.';

  @override
  String get tagWork => 'Work';

  @override
  String get tagStudy => 'Study';

  @override
  String get tagFamily => 'Family';

  @override
  String get tagFriends => 'Friends';

  @override
  String get tagRelationship => 'Relationship';

  @override
  String get tagExercise => 'Exercise';

  @override
  String get tagSleep => 'Sleep';

  @override
  String get tagMoney => 'Money';

  @override
  String get tagRelaxation => 'Relaxation';

  @override
  String get tagHealth => 'Health';

  @override
  String get tagTravel => 'Travel';

  @override
  String get tagOther => 'Other';

  @override
  String get deleteEntryQuestion => 'Delete this entry?';

  @override
  String get deleteEntryBody => 'This removes the entry from this device.';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get deleteEntryTooltip => 'Delete entry';

  @override
  String get entries => 'Entries';

  @override
  String get noEntriesYet => 'No entries yet.';

  @override
  String get historyEmpty => 'Rate your day to start building your journal.';

  @override
  String get noNote => 'No note';

  @override
  String get yourPatterns => 'Your patterns';

  @override
  String get observationsDescription =>
      'Simple observations from what you have logged.';

  @override
  String get thisWeek => 'This week';

  @override
  String scoreOutOfTen(String score, String maximum) {
    return '$score / $maximum';
  }

  @override
  String loggedDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count logged',
      one: '1 logged',
    );
    return '$_temp0';
  }

  @override
  String get highest => 'Highest';

  @override
  String get lowest => 'Lowest';

  @override
  String get noEntriesShort => 'No entries';

  @override
  String get recentTrend => 'Recent trend';

  @override
  String get trendingHigher => 'Trending higher';

  @override
  String get aboutTheSame => 'About the same';

  @override
  String get trendingLower => 'Trending lower';

  @override
  String get logMoreForTrend => 'Log more days to see a trend';

  @override
  String get commonTags => 'Common tags';

  @override
  String get patternsAppear =>
      'Your patterns will appear as you log more days.';

  @override
  String averageValue(String value) {
    return '$value average';
  }

  @override
  String dayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days',
      one: '1 day',
    );
    return '$_temp0';
  }

  @override
  String get aiReflection => 'AI Reflection';

  @override
  String get aiDescription =>
      'Ask only when you want a broader look at your entries.';

  @override
  String get logFirst =>
      'Log a few days first, then generate your first reflection.';

  @override
  String get weeklyReflection => 'Weekly Reflection';

  @override
  String get monthlyReflection => 'Monthly Reflection';

  @override
  String get lookingForPatterns => 'Looking for supported patterns…';

  @override
  String get onlySelectedSent =>
      'Only entries from the selected period are sent.';

  @override
  String get savedReflections => 'Saved reflections';

  @override
  String get deleteReflectionTooltip => 'Delete reflection';

  @override
  String get beforeContinue => 'Before you continue';

  @override
  String get consentText =>
      'Selected journal entries will be sent securely to an AI service to generate your reflection. Only entries in this request are sent.';

  @override
  String get continueButton => 'Continue';

  @override
  String get logMoreDays =>
      'Log a few more days before generating a reflection.';

  @override
  String get reflectionAlreadyRunning =>
      'A reflection is already being generated.';

  @override
  String get reflectionTimeout =>
      'The request took too long. Please try again later.';

  @override
  String get reflectionInvalid => 'The reflection response was invalid.';

  @override
  String get reflectionUnavailable =>
      'Your reflection couldn\'t be generated right now. Please try again later.';

  @override
  String get reflectionConnection =>
      'Your reflection couldn\'t be generated right now. Please check your connection.';

  @override
  String get reflectionOverall => 'Overall';

  @override
  String get reflectionWentWell => 'What went well';

  @override
  String get reflectionDifficulties => 'Recurring difficulties';

  @override
  String get reflectionPatterns => 'Patterns noticed';

  @override
  String get reflectionTry => 'Something to try';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get theme => 'Theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get language => 'Language';

  @override
  String get languageSystem => 'System default';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageItalian => 'Italiano';

  @override
  String get languageGerman => 'Deutsch';

  @override
  String get languagePortuguese => 'Português';

  @override
  String get languageArabic => 'العربية';

  @override
  String get privacy => 'Privacy';

  @override
  String get journalStoredTitle => 'Your journal is stored on this device';

  @override
  String get journalStoredBody =>
      'Writing and statistics work without an account or internet connection.';

  @override
  String get aiOptionalTitle => 'AI reflections are optional';

  @override
  String get aiOptionalBody =>
      'Only entries included in a reflection request are sent for AI processing.';

  @override
  String get deleteAllData => 'Delete all data';

  @override
  String get deleteAllSubtitle => 'Entries, reflections, and local preferences';

  @override
  String get deleteAllQuestion => 'Delete all data?';

  @override
  String get deleteAllBody =>
      'This permanently removes every journal entry and saved AI reflection from this device.';

  @override
  String get deleteAllButton => 'Delete all';

  @override
  String get allDataDeleted => 'All local data deleted.';

  @override
  String get about => 'About';

  @override
  String versionLabel(String version) {
    return 'Version $version';
  }

  @override
  String get aboutTagline => 'A small, private space to notice your days.';
}
