// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Com\'è andata la giornata?';

  @override
  String get navToday => 'Oggi';

  @override
  String get navHistory => 'Cronologia';

  @override
  String get navInsights => 'Tendenze';

  @override
  String get settingsTooltip => 'Impostazioni';

  @override
  String get howWasYourDay => 'Com\'è andata la giornata?';

  @override
  String howWasDate(String date) {
    return 'Com\'è andata il $date?';
  }

  @override
  String get noWrongAnswer => 'Non esiste una risposta sbagliata.';

  @override
  String get chooseNumber => 'Scegli il numero che senti più adatto';

  @override
  String ratingOutOfTen(String rating, String maximum) {
    return '$rating su $maximum';
  }

  @override
  String get difficultDay => 'Una giornata difficile';

  @override
  String get averageDay => 'Una giornata nella media';

  @override
  String get goodDay => 'Una buona giornata';

  @override
  String get greatDay => 'Una giornata fantastica';

  @override
  String get whatHappenedToday => 'Cos\'è successo oggi?';

  @override
  String get noteHint => 'Scrivi qualche parola sulla tua giornata…';

  @override
  String get anythingShapedIt => 'Cosa ha influenzato la giornata?';

  @override
  String get chooseRatingFirst => 'Scegli prima un voto.';

  @override
  String get saveDay => 'Salva giornata';

  @override
  String get updateDay => 'Aggiorna giornata';

  @override
  String get daySaved => 'Giornata salvata.';

  @override
  String get dayUpdated => 'Giornata aggiornata.';

  @override
  String get storedOnlyDevice => 'Salvato solo su questo dispositivo.';

  @override
  String get tagWork => 'Lavoro';

  @override
  String get tagStudy => 'Studio';

  @override
  String get tagFamily => 'Famiglia';

  @override
  String get tagFriends => 'Amici';

  @override
  String get tagRelationship => 'Relazione';

  @override
  String get tagExercise => 'Esercizio';

  @override
  String get tagSleep => 'Sonno';

  @override
  String get tagMoney => 'Denaro';

  @override
  String get tagRelaxation => 'Relax';

  @override
  String get tagHealth => 'Salute';

  @override
  String get tagTravel => 'Viaggi';

  @override
  String get tagOther => 'Altro';

  @override
  String get deleteEntryQuestion => 'Eliminare questa voce?';

  @override
  String get deleteEntryBody => 'La voce verrà rimossa da questo dispositivo.';

  @override
  String get cancel => 'Annulla';

  @override
  String get delete => 'Elimina';

  @override
  String get deleteEntryTooltip => 'Elimina voce';

  @override
  String get entries => 'Voci';

  @override
  String get noEntriesYet => 'Ancora nessuna voce.';

  @override
  String get historyEmpty => 'Valuta la giornata per iniziare il diario.';

  @override
  String get noNote => 'Nessuna nota';

  @override
  String get yourPatterns => 'Le tue tendenze';

  @override
  String get observationsDescription =>
      'Semplici osservazioni basate su ciò che hai registrato.';

  @override
  String get thisWeek => 'Questa settimana';

  @override
  String scoreOutOfTen(String score, String maximum) {
    return '$score / $maximum';
  }

  @override
  String loggedDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giorni registrati',
      one: '1 giorno registrato',
    );
    return '$_temp0';
  }

  @override
  String get highest => 'Più alto';

  @override
  String get lowest => 'Più basso';

  @override
  String get noEntriesShort => 'Nessuna voce';

  @override
  String get recentTrend => 'Tendenza recente';

  @override
  String get trendingHigher => 'In crescita';

  @override
  String get aboutTheSame => 'Più o meno stabile';

  @override
  String get trendingLower => 'In calo';

  @override
  String get logMoreForTrend => 'Registra più giorni per vedere una tendenza';

  @override
  String get commonTags => 'Tag frequenti';

  @override
  String get patternsAppear =>
      'Le tendenze appariranno registrando più giorni.';

  @override
  String averageValue(String value) {
    return 'Media: $value';
  }

  @override
  String dayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giorni',
      one: '1 giorno',
    );
    return '$_temp0';
  }

  @override
  String get aiReflection => 'Riflessione con IA';

  @override
  String get aiDescription =>
      'Chiedi uno sguardo più ampio solo quando lo desideri.';

  @override
  String get logFirst =>
      'Registra qualche giorno prima di generare la prima riflessione.';

  @override
  String get weeklyReflection => 'Riflessione settimanale';

  @override
  String get monthlyReflection => 'Riflessione mensile';

  @override
  String get lookingForPatterns => 'Ricerca di schemi supportati…';

  @override
  String get onlySelectedSent =>
      'Vengono inviate solo le voci del periodo scelto.';

  @override
  String get savedReflections => 'Riflessioni salvate';

  @override
  String get deleteReflectionTooltip => 'Elimina riflessione';

  @override
  String get beforeContinue => 'Prima di continuare';

  @override
  String get consentText =>
      'Le voci selezionate verranno inviate in modo sicuro a un servizio di IA per generare la riflessione. Vengono inviate solo le voci di questa richiesta.';

  @override
  String get continueButton => 'Continua';

  @override
  String get logMoreDays =>
      'Registra ancora qualche giorno prima di generare una riflessione.';

  @override
  String get reflectionAlreadyRunning =>
      'È già in corso la generazione di una riflessione.';

  @override
  String get reflectionTimeout =>
      'La richiesta ha impiegato troppo tempo. Riprova più tardi.';

  @override
  String get reflectionInvalid => 'La risposta della riflessione non è valida.';

  @override
  String get reflectionUnavailable =>
      'Impossibile generare la riflessione ora. Riprova più tardi.';

  @override
  String get reflectionConnection =>
      'Impossibile generare la riflessione. Controlla la connessione.';

  @override
  String get reflectionOverall => 'Nel complesso';

  @override
  String get reflectionWentWell => 'Cosa è andato bene';

  @override
  String get reflectionDifficulties => 'Difficoltà ricorrenti';

  @override
  String get reflectionPatterns => 'Schemi osservati';

  @override
  String get reflectionTry => 'Qualcosa da provare';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Chiaro';

  @override
  String get themeDark => 'Scuro';

  @override
  String get language => 'Lingua';

  @override
  String get languageSystem => 'Predefinita del sistema';

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
  String get journalStoredTitle => 'Il diario è salvato su questo dispositivo';

  @override
  String get journalStoredBody =>
      'Scrittura e statistiche funzionano senza account o connessione Internet.';

  @override
  String get aiOptionalTitle => 'Le riflessioni con IA sono facoltative';

  @override
  String get aiOptionalBody =>
      'Solo le voci incluse in una richiesta vengono inviate per l\'elaborazione.';

  @override
  String get deleteAllData => 'Elimina tutti i dati';

  @override
  String get deleteAllSubtitle => 'Voci, riflessioni e preferenze locali';

  @override
  String get deleteAllQuestion => 'Eliminare tutti i dati?';

  @override
  String get deleteAllBody =>
      'Questa azione elimina definitivamente tutte le voci e le riflessioni salvate sul dispositivo.';

  @override
  String get deleteAllButton => 'Elimina tutto';

  @override
  String get allDataDeleted => 'Tutti i dati locali sono stati eliminati.';

  @override
  String get about => 'Informazioni';

  @override
  String versionLabel(String version) {
    return 'Versione $version';
  }

  @override
  String get aboutTagline =>
      'Un piccolo spazio privato per osservare le tue giornate.';
}
