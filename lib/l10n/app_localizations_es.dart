// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => '¿Qué tal tu día?';

  @override
  String get navToday => 'Hoy';

  @override
  String get navHistory => 'Historial';

  @override
  String get navInsights => 'Tendencias';

  @override
  String get settingsTooltip => 'Ajustes';

  @override
  String get howWasYourDay => '¿Qué tal tu día?';

  @override
  String howWasDate(String date) {
    return '¿Qué tal fue el $date?';
  }

  @override
  String get noWrongAnswer => 'No hay una respuesta incorrecta.';

  @override
  String get chooseNumber => 'Elige el número que mejor encaje';

  @override
  String ratingOutOfTen(String rating, String maximum) {
    return '$rating de $maximum';
  }

  @override
  String get difficultDay => 'Un día difícil';

  @override
  String get averageDay => 'Un día normal';

  @override
  String get goodDay => 'Un buen día';

  @override
  String get greatDay => 'Un día genial';

  @override
  String get whatHappenedToday => '¿Qué ha pasado hoy?';

  @override
  String get noteHint => 'Escribe unas palabras sobre tu día…';

  @override
  String get anythingShapedIt => '¿Qué ha influido en tu día?';

  @override
  String get chooseRatingFirst => 'Elige primero una puntuación.';

  @override
  String get saveDay => 'Guardar día';

  @override
  String get updateDay => 'Actualizar día';

  @override
  String get daySaved => 'Día guardado.';

  @override
  String get dayUpdated => 'Día actualizado.';

  @override
  String get storedOnlyDevice => 'Guardado solo en este dispositivo.';

  @override
  String get tagWork => 'Trabajo';

  @override
  String get tagStudy => 'Estudios';

  @override
  String get tagFamily => 'Familia';

  @override
  String get tagFriends => 'Amigos';

  @override
  String get tagRelationship => 'Relación';

  @override
  String get tagExercise => 'Ejercicio';

  @override
  String get tagSleep => 'Sueño';

  @override
  String get tagMoney => 'Dinero';

  @override
  String get tagRelaxation => 'Descanso';

  @override
  String get tagHealth => 'Salud';

  @override
  String get tagTravel => 'Viajes';

  @override
  String get tagOther => 'Otro';

  @override
  String get deleteEntryQuestion => '¿Eliminar esta entrada?';

  @override
  String get deleteEntryBody => 'La entrada se eliminará de este dispositivo.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Eliminar';

  @override
  String get deleteEntryTooltip => 'Eliminar entrada';

  @override
  String get entries => 'Entradas';

  @override
  String get noEntriesYet => 'Aún no hay entradas.';

  @override
  String get historyEmpty => 'Puntúa tu día para empezar tu diario.';

  @override
  String get noNote => 'Sin nota';

  @override
  String get yourPatterns => 'Tus tendencias';

  @override
  String get observationsDescription =>
      'Observaciones sencillas a partir de lo que has registrado.';

  @override
  String get thisWeek => 'Esta semana';

  @override
  String scoreOutOfTen(String score, String maximum) {
    return '$score / $maximum';
  }

  @override
  String loggedDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count días registrados',
      one: '1 día registrado',
    );
    return '$_temp0';
  }

  @override
  String get highest => 'Más alta';

  @override
  String get lowest => 'Más baja';

  @override
  String get noEntriesShort => 'Sin entradas';

  @override
  String get recentTrend => 'Tendencia reciente';

  @override
  String get trendingHigher => 'Tendencia al alza';

  @override
  String get aboutTheSame => 'Más o menos igual';

  @override
  String get trendingLower => 'Tendencia a la baja';

  @override
  String get logMoreForTrend => 'Registra más días para ver una tendencia';

  @override
  String get commonTags => 'Etiquetas frecuentes';

  @override
  String get patternsAppear =>
      'Tus tendencias aparecerán a medida que registres más días.';

  @override
  String averageValue(String value) {
    return 'Media: $value';
  }

  @override
  String dayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count días',
      one: '1 día',
    );
    return '$_temp0';
  }

  @override
  String get aiReflection => 'Reflexión con IA';

  @override
  String get aiDescription => 'Pide una visión más amplia solo cuando quieras.';

  @override
  String get logFirst =>
      'Registra algunos días antes de generar tu primera reflexión.';

  @override
  String get weeklyReflection => 'Reflexión semanal';

  @override
  String get monthlyReflection => 'Reflexión mensual';

  @override
  String get lookingForPatterns => 'Buscando patrones respaldados…';

  @override
  String get onlySelectedSent =>
      'Solo se envían las entradas del período elegido.';

  @override
  String get savedReflections => 'Reflexiones guardadas';

  @override
  String get deleteReflectionTooltip => 'Eliminar reflexión';

  @override
  String get beforeContinue => 'Antes de continuar';

  @override
  String get consentText =>
      'Las entradas seleccionadas se enviarán de forma segura a un servicio de IA para generar tu reflexión. Solo se envían las entradas de esta solicitud.';

  @override
  String get continueButton => 'Continuar';

  @override
  String get logMoreDays =>
      'Registra algunos días más antes de generar una reflexión.';

  @override
  String get reflectionAlreadyRunning => 'Ya se está generando una reflexión.';

  @override
  String get reflectionTimeout =>
      'La solicitud tardó demasiado. Inténtalo más tarde.';

  @override
  String get reflectionInvalid => 'La respuesta de la reflexión no es válida.';

  @override
  String get reflectionUnavailable =>
      'No se pudo generar tu reflexión ahora. Inténtalo más tarde.';

  @override
  String get reflectionConnection =>
      'No se pudo generar tu reflexión. Comprueba tu conexión.';

  @override
  String get reflectionOverall => 'En general';

  @override
  String get reflectionWentWell => 'Lo que salió bien';

  @override
  String get reflectionDifficulties => 'Dificultades recurrentes';

  @override
  String get reflectionPatterns => 'Patrones observados';

  @override
  String get reflectionTry => 'Algo que probar';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get language => 'Idioma';

  @override
  String get languageSystem => 'Predeterminado del sistema';

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
  String get privacy => 'Privacidad';

  @override
  String get journalStoredTitle => 'Tu diario se guarda en este dispositivo';

  @override
  String get journalStoredBody =>
      'La escritura y las estadísticas funcionan sin cuenta ni conexión a Internet.';

  @override
  String get aiOptionalTitle => 'Las reflexiones con IA son opcionales';

  @override
  String get aiOptionalBody =>
      'Solo las entradas incluidas en una solicitud se envían para su procesamiento.';

  @override
  String get deleteAllData => 'Eliminar todos los datos';

  @override
  String get deleteAllSubtitle =>
      'Entradas, reflexiones y preferencias locales';

  @override
  String get deleteAllQuestion => '¿Eliminar todos los datos?';

  @override
  String get deleteAllBody =>
      'Esto elimina para siempre todas las entradas y reflexiones guardadas en este dispositivo.';

  @override
  String get deleteAllButton => 'Eliminar todo';

  @override
  String get allDataDeleted => 'Se han eliminado todos los datos locales.';

  @override
  String get about => 'Acerca de';

  @override
  String versionLabel(String version) {
    return 'Versión $version';
  }

  @override
  String get aboutTagline =>
      'Un pequeño espacio privado para observar tus días.';
}
