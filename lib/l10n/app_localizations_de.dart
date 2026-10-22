// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Wie war dein Tag?';

  @override
  String get navToday => 'Heute';

  @override
  String get navHistory => 'Verlauf';

  @override
  String get navInsights => 'Einblicke';

  @override
  String get settingsTooltip => 'Einstellungen';

  @override
  String get howWasYourDay => 'Wie war dein Tag?';

  @override
  String howWasDate(String date) {
    return 'Wie war der $date?';
  }

  @override
  String get noWrongAnswer => 'Es gibt keine falsche Antwort.';

  @override
  String get chooseNumber => 'Wähle die passende Zahl';

  @override
  String ratingOutOfTen(String rating, String maximum) {
    return '$rating von $maximum';
  }

  @override
  String get difficultDay => 'Ein schwieriger Tag';

  @override
  String get averageDay => 'Ein durchschnittlicher Tag';

  @override
  String get goodDay => 'Ein guter Tag';

  @override
  String get greatDay => 'Ein großartiger Tag';

  @override
  String get whatHappenedToday => 'Was ist heute passiert?';

  @override
  String get noteHint => 'Schreibe ein paar Worte über deinen Tag…';

  @override
  String get anythingShapedIt => 'Was hat den Tag geprägt?';

  @override
  String get chooseRatingFirst => 'Wähle zuerst eine Bewertung.';

  @override
  String get saveDay => 'Tag speichern';

  @override
  String get updateDay => 'Tag aktualisieren';

  @override
  String get daySaved => 'Tag gespeichert.';

  @override
  String get dayUpdated => 'Tag aktualisiert.';

  @override
  String get storedOnlyDevice => 'Nur auf diesem Gerät gespeichert.';

  @override
  String get tagWork => 'Arbeit';

  @override
  String get tagStudy => 'Lernen';

  @override
  String get tagFamily => 'Familie';

  @override
  String get tagFriends => 'Freunde';

  @override
  String get tagRelationship => 'Beziehung';

  @override
  String get tagExercise => 'Bewegung';

  @override
  String get tagSleep => 'Schlaf';

  @override
  String get tagMoney => 'Geld';

  @override
  String get tagRelaxation => 'Entspannung';

  @override
  String get tagHealth => 'Gesundheit';

  @override
  String get tagTravel => 'Reisen';

  @override
  String get tagOther => 'Sonstiges';

  @override
  String get deleteEntryQuestion => 'Diesen Eintrag löschen?';

  @override
  String get deleteEntryBody => 'Der Eintrag wird von diesem Gerät entfernt.';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get delete => 'Löschen';

  @override
  String get deleteEntryTooltip => 'Eintrag löschen';

  @override
  String get entries => 'Einträge';

  @override
  String get noEntriesYet => 'Noch keine Einträge.';

  @override
  String get historyEmpty =>
      'Bewerte deinen Tag, um dein Tagebuch zu beginnen.';

  @override
  String get noNote => 'Keine Notiz';

  @override
  String get yourPatterns => 'Deine Muster';

  @override
  String get observationsDescription =>
      'Einfache Beobachtungen aus deinen Einträgen.';

  @override
  String get thisWeek => 'Diese Woche';

  @override
  String scoreOutOfTen(String score, String maximum) {
    return '$score / $maximum';
  }

  @override
  String loggedDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tage erfasst',
      one: '1 Tag erfasst',
    );
    return '$_temp0';
  }

  @override
  String get highest => 'Höchste';

  @override
  String get lowest => 'Niedrigste';

  @override
  String get noEntriesShort => 'Keine Einträge';

  @override
  String get recentTrend => 'Aktueller Trend';

  @override
  String get trendingHigher => 'Tendenz steigend';

  @override
  String get aboutTheSame => 'Etwa gleich';

  @override
  String get trendingLower => 'Tendenz fallend';

  @override
  String get logMoreForTrend => 'Erfasse mehr Tage, um einen Trend zu sehen';

  @override
  String get commonTags => 'Häufige Tags';

  @override
  String get patternsAppear =>
      'Deine Muster werden sichtbar, wenn du mehr Tage erfasst.';

  @override
  String averageValue(String value) {
    return 'Durchschnitt: $value';
  }

  @override
  String dayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Tage',
      one: '1 Tag',
    );
    return '$_temp0';
  }

  @override
  String get aiReflection => 'KI-Reflexion';

  @override
  String get aiDescription =>
      'Fordere nur dann einen größeren Überblick an, wenn du möchtest.';

  @override
  String get logFirst =>
      'Erfasse einige Tage, bevor du deine erste Reflexion erstellst.';

  @override
  String get weeklyReflection => 'Wochenreflexion';

  @override
  String get monthlyReflection => 'Monatsreflexion';

  @override
  String get lookingForPatterns => 'Suche nach belegten Mustern…';

  @override
  String get onlySelectedSent =>
      'Nur Einträge aus dem gewählten Zeitraum werden gesendet.';

  @override
  String get savedReflections => 'Gespeicherte Reflexionen';

  @override
  String get deleteReflectionTooltip => 'Reflexion löschen';

  @override
  String get beforeContinue => 'Bevor du fortfährst';

  @override
  String get consentText =>
      'Ausgewählte Tagebucheinträge werden sicher an einen KI-Dienst gesendet, um deine Reflexion zu erstellen. Nur Einträge dieser Anfrage werden gesendet.';

  @override
  String get continueButton => 'Weiter';

  @override
  String get logMoreDays =>
      'Erfasse noch ein paar Tage, bevor du eine Reflexion erstellst.';

  @override
  String get reflectionAlreadyRunning =>
      'Eine Reflexion wird bereits erstellt.';

  @override
  String get reflectionTimeout =>
      'Die Anfrage hat zu lange gedauert. Versuche es später erneut.';

  @override
  String get reflectionInvalid => 'Die Reflexionsantwort war ungültig.';

  @override
  String get reflectionUnavailable =>
      'Deine Reflexion konnte gerade nicht erstellt werden. Versuche es später erneut.';

  @override
  String get reflectionConnection =>
      'Deine Reflexion konnte nicht erstellt werden. Prüfe deine Verbindung.';

  @override
  String get reflectionOverall => 'Insgesamt';

  @override
  String get reflectionWentWell => 'Was gut lief';

  @override
  String get reflectionDifficulties => 'Wiederkehrende Schwierigkeiten';

  @override
  String get reflectionPatterns => 'Erkannte Muster';

  @override
  String get reflectionTry => 'Ein möglicher Versuch';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get theme => 'Design';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get language => 'Sprache';

  @override
  String get languageSystem => 'Systemstandard';

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
  String get privacy => 'Datenschutz';

  @override
  String get journalStoredTitle =>
      'Dein Tagebuch wird auf diesem Gerät gespeichert';

  @override
  String get journalStoredBody =>
      'Schreiben und Statistiken funktionieren ohne Konto oder Internetverbindung.';

  @override
  String get aiOptionalTitle => 'KI-Reflexionen sind optional';

  @override
  String get aiOptionalBody =>
      'Nur Einträge einer Reflexionsanfrage werden zur KI-Verarbeitung gesendet.';

  @override
  String get deleteAllData => 'Alle Daten löschen';

  @override
  String get deleteAllSubtitle =>
      'Einträge, Reflexionen und lokale Einstellungen';

  @override
  String get deleteAllQuestion => 'Alle Daten löschen?';

  @override
  String get deleteAllBody =>
      'Dadurch werden alle Tagebucheinträge und gespeicherten KI-Reflexionen dauerhaft von diesem Gerät gelöscht.';

  @override
  String get deleteAllButton => 'Alles löschen';

  @override
  String get allDataDeleted => 'Alle lokalen Daten wurden gelöscht.';

  @override
  String get about => 'Über die App';

  @override
  String versionLabel(String version) {
    return 'Version $version';
  }

  @override
  String get aboutTagline =>
      'Ein kleiner, privater Ort, um deine Tage wahrzunehmen.';
}
