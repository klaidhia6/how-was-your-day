// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Como foi o seu dia?';

  @override
  String get navToday => 'Hoje';

  @override
  String get navHistory => 'Histórico';

  @override
  String get navInsights => 'Tendências';

  @override
  String get settingsTooltip => 'Definições';

  @override
  String get howWasYourDay => 'Como foi o seu dia?';

  @override
  String howWasDate(String date) {
    return 'Como foi o dia $date?';
  }

  @override
  String get noWrongAnswer => 'Não existe uma resposta errada.';

  @override
  String get chooseNumber => 'Escolha o número que lhe parece certo';

  @override
  String ratingOutOfTen(String rating, String maximum) {
    return '$rating de $maximum';
  }

  @override
  String get difficultDay => 'Um dia difícil';

  @override
  String get averageDay => 'Um dia normal';

  @override
  String get goodDay => 'Um bom dia';

  @override
  String get greatDay => 'Um ótimo dia';

  @override
  String get whatHappenedToday => 'O que aconteceu hoje?';

  @override
  String get noteHint => 'Escreva algumas palavras sobre o seu dia…';

  @override
  String get anythingShapedIt => 'O que influenciou o dia?';

  @override
  String get chooseRatingFirst => 'Escolha primeiro uma avaliação.';

  @override
  String get saveDay => 'Guardar dia';

  @override
  String get updateDay => 'Atualizar dia';

  @override
  String get daySaved => 'Dia guardado.';

  @override
  String get dayUpdated => 'Dia atualizado.';

  @override
  String get storedOnlyDevice => 'Guardado apenas neste dispositivo.';

  @override
  String get tagWork => 'Trabalho';

  @override
  String get tagStudy => 'Estudo';

  @override
  String get tagFamily => 'Família';

  @override
  String get tagFriends => 'Amigos';

  @override
  String get tagRelationship => 'Relacionamento';

  @override
  String get tagExercise => 'Exercício';

  @override
  String get tagSleep => 'Sono';

  @override
  String get tagMoney => 'Dinheiro';

  @override
  String get tagRelaxation => 'Relaxamento';

  @override
  String get tagHealth => 'Saúde';

  @override
  String get tagTravel => 'Viagens';

  @override
  String get tagOther => 'Outro';

  @override
  String get deleteEntryQuestion => 'Eliminar esta entrada?';

  @override
  String get deleteEntryBody => 'A entrada será removida deste dispositivo.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get delete => 'Eliminar';

  @override
  String get deleteEntryTooltip => 'Eliminar entrada';

  @override
  String get entries => 'Entradas';

  @override
  String get noEntriesYet => 'Ainda não há entradas.';

  @override
  String get historyEmpty => 'Avalie o seu dia para começar o diário.';

  @override
  String get noNote => 'Sem nota';

  @override
  String get yourPatterns => 'Os seus padrões';

  @override
  String get observationsDescription =>
      'Observações simples com base no que registou.';

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
      other: '$count dias registados',
      one: '1 dia registado',
    );
    return '$_temp0';
  }

  @override
  String get highest => 'Mais alta';

  @override
  String get lowest => 'Mais baixa';

  @override
  String get noEntriesShort => 'Sem entradas';

  @override
  String get recentTrend => 'Tendência recente';

  @override
  String get trendingHigher => 'Tendência de subida';

  @override
  String get aboutTheSame => 'Quase igual';

  @override
  String get trendingLower => 'Tendência de descida';

  @override
  String get logMoreForTrend => 'Registe mais dias para ver uma tendência';

  @override
  String get commonTags => 'Etiquetas frequentes';

  @override
  String get patternsAppear =>
      'Os seus padrões aparecerão à medida que registar mais dias.';

  @override
  String averageValue(String value) {
    return 'Média: $value';
  }

  @override
  String dayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dias',
      one: '1 dia',
    );
    return '$_temp0';
  }

  @override
  String get aiReflection => 'Reflexão com IA';

  @override
  String get aiDescription => 'Peça uma visão mais ampla apenas quando quiser.';

  @override
  String get logFirst =>
      'Registe alguns dias antes de gerar a primeira reflexão.';

  @override
  String get weeklyReflection => 'Reflexão semanal';

  @override
  String get monthlyReflection => 'Reflexão mensal';

  @override
  String get lookingForPatterns => 'A procurar padrões sustentados…';

  @override
  String get onlySelectedSent =>
      'Apenas são enviadas as entradas do período escolhido.';

  @override
  String get savedReflections => 'Reflexões guardadas';

  @override
  String get deleteReflectionTooltip => 'Eliminar reflexão';

  @override
  String get beforeContinue => 'Antes de continuar';

  @override
  String get consentText =>
      'As entradas selecionadas serão enviadas em segurança para um serviço de IA para gerar a sua reflexão. Apenas são enviadas as entradas deste pedido.';

  @override
  String get continueButton => 'Continuar';

  @override
  String get logMoreDays =>
      'Registe mais alguns dias antes de gerar uma reflexão.';

  @override
  String get reflectionAlreadyRunning => 'Já está a ser gerada uma reflexão.';

  @override
  String get reflectionTimeout =>
      'O pedido demorou demasiado. Tente novamente mais tarde.';

  @override
  String get reflectionInvalid => 'A resposta da reflexão não é válida.';

  @override
  String get reflectionUnavailable =>
      'Não foi possível gerar a reflexão agora. Tente novamente mais tarde.';

  @override
  String get reflectionConnection =>
      'Não foi possível gerar a reflexão. Verifique a ligação.';

  @override
  String get reflectionOverall => 'Visão geral';

  @override
  String get reflectionWentWell => 'O que correu bem';

  @override
  String get reflectionDifficulties => 'Dificuldades recorrentes';

  @override
  String get reflectionPatterns => 'Padrões observados';

  @override
  String get reflectionTry => 'Algo para experimentar';

  @override
  String get settingsTitle => 'Definições';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Escuro';

  @override
  String get language => 'Idioma';

  @override
  String get languageSystem => 'Predefinição do sistema';

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
  String get privacy => 'Privacidade';

  @override
  String get journalStoredTitle => 'O seu diário é guardado neste dispositivo';

  @override
  String get journalStoredBody =>
      'A escrita e as estatísticas funcionam sem conta ou ligação à Internet.';

  @override
  String get aiOptionalTitle => 'As reflexões com IA são opcionais';

  @override
  String get aiOptionalBody =>
      'Apenas as entradas incluídas num pedido são enviadas para processamento por IA.';

  @override
  String get deleteAllData => 'Eliminar todos os dados';

  @override
  String get deleteAllSubtitle => 'Entradas, reflexões e preferências locais';

  @override
  String get deleteAllQuestion => 'Eliminar todos os dados?';

  @override
  String get deleteAllBody =>
      'Isto elimina permanentemente todas as entradas e reflexões guardadas neste dispositivo.';

  @override
  String get deleteAllButton => 'Eliminar tudo';

  @override
  String get allDataDeleted => 'Todos os dados locais foram eliminados.';

  @override
  String get about => 'Acerca de';

  @override
  String versionLabel(String version) {
    return 'Versão $version';
  }

  @override
  String get aboutTagline =>
      'Um pequeno espaço privado para observar os seus dias.';
}
