// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Comment s\'est passée votre journée ?';

  @override
  String get navToday => 'Aujourd\'hui';

  @override
  String get navHistory => 'Historique';

  @override
  String get navInsights => 'Tendances';

  @override
  String get settingsTooltip => 'Réglages';

  @override
  String get howWasYourDay => 'Comment s\'est passée votre journée ?';

  @override
  String howWasDate(String date) {
    return 'Comment s\'est passé le $date ?';
  }

  @override
  String get noWrongAnswer => 'Il n\'y a pas de mauvaise réponse.';

  @override
  String get chooseNumber => 'Choisissez le nombre qui vous correspond';

  @override
  String ratingOutOfTen(String rating, String maximum) {
    return '$rating sur $maximum';
  }

  @override
  String get difficultDay => 'Une journée difficile';

  @override
  String get averageDay => 'Une journée moyenne';

  @override
  String get goodDay => 'Une bonne journée';

  @override
  String get greatDay => 'Une excellente journée';

  @override
  String get whatHappenedToday => 'Que s\'est-il passé aujourd\'hui ?';

  @override
  String get noteHint => 'Écrivez quelques mots sur votre journée…';

  @override
  String get anythingShapedIt => 'Qu\'est-ce qui l\'a influencée ?';

  @override
  String get chooseRatingFirst => 'Choisissez d\'abord une note.';

  @override
  String get saveDay => 'Enregistrer';

  @override
  String get updateDay => 'Mettre à jour';

  @override
  String get daySaved => 'Journée enregistrée.';

  @override
  String get dayUpdated => 'Journée mise à jour.';

  @override
  String get storedOnlyDevice => 'Stocké uniquement sur cet appareil.';

  @override
  String get tagWork => 'Travail';

  @override
  String get tagStudy => 'Études';

  @override
  String get tagFamily => 'Famille';

  @override
  String get tagFriends => 'Amis';

  @override
  String get tagRelationship => 'Relation';

  @override
  String get tagExercise => 'Sport';

  @override
  String get tagSleep => 'Sommeil';

  @override
  String get tagMoney => 'Argent';

  @override
  String get tagRelaxation => 'Détente';

  @override
  String get tagHealth => 'Santé';

  @override
  String get tagTravel => 'Voyage';

  @override
  String get tagOther => 'Autre';

  @override
  String get deleteEntryQuestion => 'Supprimer cette entrée ?';

  @override
  String get deleteEntryBody => 'Cette entrée sera supprimée de cet appareil.';

  @override
  String get cancel => 'Annuler';

  @override
  String get delete => 'Supprimer';

  @override
  String get deleteEntryTooltip => 'Supprimer l\'entrée';

  @override
  String get entries => 'Entrées';

  @override
  String get noEntriesYet => 'Aucune entrée pour le moment.';

  @override
  String get historyEmpty =>
      'Notez votre journée pour commencer votre journal.';

  @override
  String get noNote => 'Aucune note';

  @override
  String get yourPatterns => 'Vos tendances';

  @override
  String get observationsDescription =>
      'Des observations simples tirées de vos entrées.';

  @override
  String get thisWeek => 'Cette semaine';

  @override
  String scoreOutOfTen(String score, String maximum) {
    return '$score / $maximum';
  }

  @override
  String loggedDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jours notés',
      one: '1 jour noté',
    );
    return '$_temp0';
  }

  @override
  String get highest => 'Meilleure';

  @override
  String get lowest => 'Plus basse';

  @override
  String get noEntriesShort => 'Aucune entrée';

  @override
  String get recentTrend => 'Tendance récente';

  @override
  String get trendingHigher => 'En hausse';

  @override
  String get aboutTheSame => 'À peu près stable';

  @override
  String get trendingLower => 'En baisse';

  @override
  String get logMoreForTrend => 'Notez plus de jours pour voir une tendance';

  @override
  String get commonTags => 'Tags fréquents';

  @override
  String get patternsAppear =>
      'Vos tendances apparaîtront au fil de vos entrées.';

  @override
  String averageValue(String value) {
    return 'Moyenne : $value';
  }

  @override
  String dayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jours',
      one: '1 jour',
    );
    return '$_temp0';
  }

  @override
  String get aiReflection => 'Réflexion par IA';

  @override
  String get aiDescription =>
      'Demandez une vue d\'ensemble seulement quand vous le souhaitez.';

  @override
  String get logFirst =>
      'Notez quelques jours avant de générer votre première réflexion.';

  @override
  String get weeklyReflection => 'Réflexion de la semaine';

  @override
  String get monthlyReflection => 'Réflexion du mois';

  @override
  String get lookingForPatterns => 'Recherche de tendances étayées…';

  @override
  String get onlySelectedSent =>
      'Seules les entrées de la période choisie sont envoyées.';

  @override
  String get savedReflections => 'Réflexions enregistrées';

  @override
  String get deleteReflectionTooltip => 'Supprimer la réflexion';

  @override
  String get beforeContinue => 'Avant de continuer';

  @override
  String get consentText =>
      'Les entrées sélectionnées seront envoyées de façon sécurisée à un service d\'IA pour générer votre réflexion. Seules les entrées de cette demande sont envoyées.';

  @override
  String get continueButton => 'Continuer';

  @override
  String get logMoreDays =>
      'Notez encore quelques jours avant de générer une réflexion.';

  @override
  String get reflectionAlreadyRunning =>
      'Une réflexion est déjà en cours de génération.';

  @override
  String get reflectionTimeout =>
      'La demande a pris trop de temps. Réessayez plus tard.';

  @override
  String get reflectionInvalid => 'La réponse de réflexion n\'est pas valide.';

  @override
  String get reflectionUnavailable =>
      'Impossible de générer votre réflexion maintenant. Réessayez plus tard.';

  @override
  String get reflectionConnection =>
      'Impossible de générer votre réflexion. Vérifiez votre connexion.';

  @override
  String get reflectionOverall => 'Dans l\'ensemble';

  @override
  String get reflectionWentWell => 'Ce qui s\'est bien passé';

  @override
  String get reflectionDifficulties => 'Difficultés récurrentes';

  @override
  String get reflectionPatterns => 'Tendances remarquées';

  @override
  String get reflectionTry => 'Une piste à essayer';

  @override
  String get settingsTitle => 'Réglages';

  @override
  String get theme => 'Thème';

  @override
  String get themeSystem => 'Système';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get language => 'Langue';

  @override
  String get languageSystem => 'Langue du système';

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
  String get privacy => 'Confidentialité';

  @override
  String get journalStoredTitle => 'Votre journal est stocké sur cet appareil';

  @override
  String get journalStoredBody =>
      'L\'écriture et les statistiques fonctionnent sans compte ni connexion Internet.';

  @override
  String get aiOptionalTitle => 'Les réflexions par IA sont facultatives';

  @override
  String get aiOptionalBody =>
      'Seules les entrées incluses dans une demande sont envoyées pour traitement par l\'IA.';

  @override
  String get deleteAllData => 'Supprimer toutes les données';

  @override
  String get deleteAllSubtitle => 'Entrées, réflexions et préférences locales';

  @override
  String get deleteAllQuestion => 'Supprimer toutes les données ?';

  @override
  String get deleteAllBody =>
      'Cette action supprime définitivement toutes les entrées et réflexions enregistrées sur cet appareil.';

  @override
  String get deleteAllButton => 'Tout supprimer';

  @override
  String get allDataDeleted => 'Toutes les données locales ont été supprimées.';

  @override
  String get about => 'À propos';

  @override
  String versionLabel(String version) {
    return 'Version $version';
  }

  @override
  String get aboutTagline =>
      'Un petit espace privé pour prendre conscience de vos journées.';
}
