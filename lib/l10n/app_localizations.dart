import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('pt'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'How Was Your Day?'**
  String get appTitle;

  /// No description provided for @navToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get navToday;

  /// No description provided for @navHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get navHistory;

  /// No description provided for @navInsights.
  ///
  /// In en, this message translates to:
  /// **'Insights'**
  String get navInsights;

  /// No description provided for @settingsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTooltip;

  /// No description provided for @howWasYourDay.
  ///
  /// In en, this message translates to:
  /// **'How was your day?'**
  String get howWasYourDay;

  /// No description provided for @howWasDate.
  ///
  /// In en, this message translates to:
  /// **'How was {date}?'**
  String howWasDate(String date);

  /// No description provided for @noWrongAnswer.
  ///
  /// In en, this message translates to:
  /// **'There is no wrong answer.'**
  String get noWrongAnswer;

  /// No description provided for @chooseNumber.
  ///
  /// In en, this message translates to:
  /// **'Choose a number that feels right'**
  String get chooseNumber;

  /// No description provided for @ratingOutOfTen.
  ///
  /// In en, this message translates to:
  /// **'{rating} out of {maximum}'**
  String ratingOutOfTen(String rating, String maximum);

  /// No description provided for @difficultDay.
  ///
  /// In en, this message translates to:
  /// **'A difficult day'**
  String get difficultDay;

  /// No description provided for @averageDay.
  ///
  /// In en, this message translates to:
  /// **'An average day'**
  String get averageDay;

  /// No description provided for @goodDay.
  ///
  /// In en, this message translates to:
  /// **'A good day'**
  String get goodDay;

  /// No description provided for @greatDay.
  ///
  /// In en, this message translates to:
  /// **'A great day'**
  String get greatDay;

  /// No description provided for @whatHappenedToday.
  ///
  /// In en, this message translates to:
  /// **'What happened today?'**
  String get whatHappenedToday;

  /// No description provided for @noteHint.
  ///
  /// In en, this message translates to:
  /// **'Write a few words about your day…'**
  String get noteHint;

  /// No description provided for @anythingShapedIt.
  ///
  /// In en, this message translates to:
  /// **'Anything that shaped it?'**
  String get anythingShapedIt;

  /// No description provided for @chooseRatingFirst.
  ///
  /// In en, this message translates to:
  /// **'Choose a rating first.'**
  String get chooseRatingFirst;

  /// No description provided for @saveDay.
  ///
  /// In en, this message translates to:
  /// **'Save Day'**
  String get saveDay;

  /// No description provided for @updateDay.
  ///
  /// In en, this message translates to:
  /// **'Update Day'**
  String get updateDay;

  /// No description provided for @daySaved.
  ///
  /// In en, this message translates to:
  /// **'Today saved.'**
  String get daySaved;

  /// No description provided for @dayUpdated.
  ///
  /// In en, this message translates to:
  /// **'Day updated.'**
  String get dayUpdated;

  /// No description provided for @storedOnlyDevice.
  ///
  /// In en, this message translates to:
  /// **'Stored only on this device.'**
  String get storedOnlyDevice;

  /// No description provided for @tagWork.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get tagWork;

  /// No description provided for @tagStudy.
  ///
  /// In en, this message translates to:
  /// **'Study'**
  String get tagStudy;

  /// No description provided for @tagFamily.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get tagFamily;

  /// No description provided for @tagFriends.
  ///
  /// In en, this message translates to:
  /// **'Friends'**
  String get tagFriends;

  /// No description provided for @tagRelationship.
  ///
  /// In en, this message translates to:
  /// **'Relationship'**
  String get tagRelationship;

  /// No description provided for @tagExercise.
  ///
  /// In en, this message translates to:
  /// **'Exercise'**
  String get tagExercise;

  /// No description provided for @tagSleep.
  ///
  /// In en, this message translates to:
  /// **'Sleep'**
  String get tagSleep;

  /// No description provided for @tagMoney.
  ///
  /// In en, this message translates to:
  /// **'Money'**
  String get tagMoney;

  /// No description provided for @tagRelaxation.
  ///
  /// In en, this message translates to:
  /// **'Relaxation'**
  String get tagRelaxation;

  /// No description provided for @tagHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get tagHealth;

  /// No description provided for @tagTravel.
  ///
  /// In en, this message translates to:
  /// **'Travel'**
  String get tagTravel;

  /// No description provided for @tagOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get tagOther;

  /// No description provided for @deleteEntryQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete this entry?'**
  String get deleteEntryQuestion;

  /// No description provided for @deleteEntryBody.
  ///
  /// In en, this message translates to:
  /// **'This removes the entry from this device.'**
  String get deleteEntryBody;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteEntryTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete entry'**
  String get deleteEntryTooltip;

  /// No description provided for @entries.
  ///
  /// In en, this message translates to:
  /// **'Entries'**
  String get entries;

  /// No description provided for @noEntriesYet.
  ///
  /// In en, this message translates to:
  /// **'No entries yet.'**
  String get noEntriesYet;

  /// No description provided for @historyEmpty.
  ///
  /// In en, this message translates to:
  /// **'Rate your day to start building your journal.'**
  String get historyEmpty;

  /// No description provided for @noNote.
  ///
  /// In en, this message translates to:
  /// **'No note'**
  String get noNote;

  /// No description provided for @yourPatterns.
  ///
  /// In en, this message translates to:
  /// **'Your patterns'**
  String get yourPatterns;

  /// No description provided for @observationsDescription.
  ///
  /// In en, this message translates to:
  /// **'Simple observations from what you have logged.'**
  String get observationsDescription;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get thisWeek;

  /// No description provided for @scoreOutOfTen.
  ///
  /// In en, this message translates to:
  /// **'{score} / {maximum}'**
  String scoreOutOfTen(String score, String maximum);

  /// No description provided for @loggedDays.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 logged} other{{count} logged}}'**
  String loggedDays(int count);

  /// No description provided for @highest.
  ///
  /// In en, this message translates to:
  /// **'Highest'**
  String get highest;

  /// No description provided for @lowest.
  ///
  /// In en, this message translates to:
  /// **'Lowest'**
  String get lowest;

  /// No description provided for @noEntriesShort.
  ///
  /// In en, this message translates to:
  /// **'No entries'**
  String get noEntriesShort;

  /// No description provided for @recentTrend.
  ///
  /// In en, this message translates to:
  /// **'Recent trend'**
  String get recentTrend;

  /// No description provided for @trendingHigher.
  ///
  /// In en, this message translates to:
  /// **'Trending higher'**
  String get trendingHigher;

  /// No description provided for @aboutTheSame.
  ///
  /// In en, this message translates to:
  /// **'About the same'**
  String get aboutTheSame;

  /// No description provided for @trendingLower.
  ///
  /// In en, this message translates to:
  /// **'Trending lower'**
  String get trendingLower;

  /// No description provided for @logMoreForTrend.
  ///
  /// In en, this message translates to:
  /// **'Log more days to see a trend'**
  String get logMoreForTrend;

  /// No description provided for @commonTags.
  ///
  /// In en, this message translates to:
  /// **'Common tags'**
  String get commonTags;

  /// No description provided for @patternsAppear.
  ///
  /// In en, this message translates to:
  /// **'Your patterns will appear as you log more days.'**
  String get patternsAppear;

  /// No description provided for @averageValue.
  ///
  /// In en, this message translates to:
  /// **'{value} average'**
  String averageValue(String value);

  /// No description provided for @dayCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 day} other{{count} days}}'**
  String dayCount(int count);

  /// No description provided for @aiReflection.
  ///
  /// In en, this message translates to:
  /// **'AI Reflection'**
  String get aiReflection;

  /// No description provided for @aiDescription.
  ///
  /// In en, this message translates to:
  /// **'Ask only when you want a broader look at your entries.'**
  String get aiDescription;

  /// No description provided for @logFirst.
  ///
  /// In en, this message translates to:
  /// **'Log a few days first, then generate your first reflection.'**
  String get logFirst;

  /// No description provided for @weeklyReflection.
  ///
  /// In en, this message translates to:
  /// **'Weekly Reflection'**
  String get weeklyReflection;

  /// No description provided for @monthlyReflection.
  ///
  /// In en, this message translates to:
  /// **'Monthly Reflection'**
  String get monthlyReflection;

  /// No description provided for @lookingForPatterns.
  ///
  /// In en, this message translates to:
  /// **'Looking for supported patterns…'**
  String get lookingForPatterns;

  /// No description provided for @onlySelectedSent.
  ///
  /// In en, this message translates to:
  /// **'Only entries from the selected period are sent.'**
  String get onlySelectedSent;

  /// No description provided for @savedReflections.
  ///
  /// In en, this message translates to:
  /// **'Saved reflections'**
  String get savedReflections;

  /// No description provided for @deleteReflectionTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete reflection'**
  String get deleteReflectionTooltip;

  /// No description provided for @beforeContinue.
  ///
  /// In en, this message translates to:
  /// **'Before you continue'**
  String get beforeContinue;

  /// No description provided for @consentText.
  ///
  /// In en, this message translates to:
  /// **'Selected journal entries will be sent securely to an AI service to generate your reflection. Only entries in this request are sent.'**
  String get consentText;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @logMoreDays.
  ///
  /// In en, this message translates to:
  /// **'Log a few more days before generating a reflection.'**
  String get logMoreDays;

  /// No description provided for @reflectionAlreadyRunning.
  ///
  /// In en, this message translates to:
  /// **'A reflection is already being generated.'**
  String get reflectionAlreadyRunning;

  /// No description provided for @reflectionTimeout.
  ///
  /// In en, this message translates to:
  /// **'The request took too long. Please try again later.'**
  String get reflectionTimeout;

  /// No description provided for @reflectionInvalid.
  ///
  /// In en, this message translates to:
  /// **'The reflection response was invalid.'**
  String get reflectionInvalid;

  /// No description provided for @reflectionUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Your reflection couldn\'t be generated right now. Please try again later.'**
  String get reflectionUnavailable;

  /// No description provided for @reflectionConnection.
  ///
  /// In en, this message translates to:
  /// **'Your reflection couldn\'t be generated right now. Please check your connection.'**
  String get reflectionConnection;

  /// No description provided for @reflectionOverall.
  ///
  /// In en, this message translates to:
  /// **'Overall'**
  String get reflectionOverall;

  /// No description provided for @reflectionWentWell.
  ///
  /// In en, this message translates to:
  /// **'What went well'**
  String get reflectionWentWell;

  /// No description provided for @reflectionDifficulties.
  ///
  /// In en, this message translates to:
  /// **'Recurring difficulties'**
  String get reflectionDifficulties;

  /// No description provided for @reflectionPatterns.
  ///
  /// In en, this message translates to:
  /// **'Patterns noticed'**
  String get reflectionPatterns;

  /// No description provided for @reflectionTry.
  ///
  /// In en, this message translates to:
  /// **'Something to try'**
  String get reflectionTry;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageSystem.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get languageSystem;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageFrench.
  ///
  /// In en, this message translates to:
  /// **'Français'**
  String get languageFrench;

  /// No description provided for @languageSpanish.
  ///
  /// In en, this message translates to:
  /// **'Español'**
  String get languageSpanish;

  /// No description provided for @languageItalian.
  ///
  /// In en, this message translates to:
  /// **'Italiano'**
  String get languageItalian;

  /// No description provided for @languageGerman.
  ///
  /// In en, this message translates to:
  /// **'Deutsch'**
  String get languageGerman;

  /// No description provided for @languagePortuguese.
  ///
  /// In en, this message translates to:
  /// **'Português'**
  String get languagePortuguese;

  /// No description provided for @languageArabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get languageArabic;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @journalStoredTitle.
  ///
  /// In en, this message translates to:
  /// **'Your journal is stored on this device'**
  String get journalStoredTitle;

  /// No description provided for @journalStoredBody.
  ///
  /// In en, this message translates to:
  /// **'Writing and statistics work without an account or internet connection.'**
  String get journalStoredBody;

  /// No description provided for @aiOptionalTitle.
  ///
  /// In en, this message translates to:
  /// **'AI reflections are optional'**
  String get aiOptionalTitle;

  /// No description provided for @aiOptionalBody.
  ///
  /// In en, this message translates to:
  /// **'Only entries included in a reflection request are sent for AI processing.'**
  String get aiOptionalBody;

  /// No description provided for @deleteAllData.
  ///
  /// In en, this message translates to:
  /// **'Delete all data'**
  String get deleteAllData;

  /// No description provided for @deleteAllSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Entries, reflections, and local preferences'**
  String get deleteAllSubtitle;

  /// No description provided for @deleteAllQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete all data?'**
  String get deleteAllQuestion;

  /// No description provided for @deleteAllBody.
  ///
  /// In en, this message translates to:
  /// **'This permanently removes every journal entry and saved AI reflection from this device.'**
  String get deleteAllBody;

  /// No description provided for @deleteAllButton.
  ///
  /// In en, this message translates to:
  /// **'Delete all'**
  String get deleteAllButton;

  /// No description provided for @allDataDeleted.
  ///
  /// In en, this message translates to:
  /// **'All local data deleted.'**
  String get allDataDeleted;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @versionLabel.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String versionLabel(String version);

  /// No description provided for @aboutTagline.
  ///
  /// In en, this message translates to:
  /// **'A small, private space to notice your days.'**
  String get aboutTagline;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'it',
    'pt',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
