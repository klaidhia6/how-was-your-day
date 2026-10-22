// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'كيف كان يومك؟';

  @override
  String get navToday => 'اليوم';

  @override
  String get navHistory => 'السجل';

  @override
  String get navInsights => 'الأنماط';

  @override
  String get settingsTooltip => 'الإعدادات';

  @override
  String get howWasYourDay => 'كيف كان يومك؟';

  @override
  String howWasDate(String date) {
    return 'كيف كان يوم $date؟';
  }

  @override
  String get noWrongAnswer => 'لا توجد إجابة خاطئة.';

  @override
  String get chooseNumber => 'اختر الرقم الذي يناسب شعورك';

  @override
  String ratingOutOfTen(String rating, String maximum) {
    return '$rating من $maximum';
  }

  @override
  String get difficultDay => 'يوم صعب';

  @override
  String get averageDay => 'يوم عادي';

  @override
  String get goodDay => 'يوم جيد';

  @override
  String get greatDay => 'يوم رائع';

  @override
  String get whatHappenedToday => 'ماذا حدث اليوم؟';

  @override
  String get noteHint => 'اكتب بضع كلمات عن يومك…';

  @override
  String get anythingShapedIt => 'ما الذي أثّر في يومك؟';

  @override
  String get chooseRatingFirst => 'اختر تقييماً أولاً.';

  @override
  String get saveDay => 'حفظ اليوم';

  @override
  String get updateDay => 'تحديث اليوم';

  @override
  String get daySaved => 'تم حفظ اليوم.';

  @override
  String get dayUpdated => 'تم تحديث اليوم.';

  @override
  String get storedOnlyDevice => 'محفوظ على هذا الجهاز فقط.';

  @override
  String get tagWork => 'العمل';

  @override
  String get tagStudy => 'الدراسة';

  @override
  String get tagFamily => 'العائلة';

  @override
  String get tagFriends => 'الأصدقاء';

  @override
  String get tagRelationship => 'العلاقة';

  @override
  String get tagExercise => 'الرياضة';

  @override
  String get tagSleep => 'النوم';

  @override
  String get tagMoney => 'المال';

  @override
  String get tagRelaxation => 'الاسترخاء';

  @override
  String get tagHealth => 'الصحة';

  @override
  String get tagTravel => 'السفر';

  @override
  String get tagOther => 'أخرى';

  @override
  String get deleteEntryQuestion => 'حذف هذا الإدخال؟';

  @override
  String get deleteEntryBody => 'سيؤدي ذلك إلى إزالة الإدخال من هذا الجهاز.';

  @override
  String get cancel => 'إلغاء';

  @override
  String get delete => 'حذف';

  @override
  String get deleteEntryTooltip => 'حذف الإدخال';

  @override
  String get entries => 'الإدخالات';

  @override
  String get noEntriesYet => 'لا توجد إدخالات بعد.';

  @override
  String get historyEmpty => 'قيّم يومك لبدء بناء يومياتك.';

  @override
  String get noNote => 'لا توجد ملاحظة';

  @override
  String get yourPatterns => 'أنماطك';

  @override
  String get observationsDescription => 'ملاحظات بسيطة مستندة إلى ما سجلته.';

  @override
  String get thisWeek => 'هذا الأسبوع';

  @override
  String scoreOutOfTen(String score, String maximum) {
    return '$score / $maximum';
  }

  @override
  String loggedDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count يوم مسجّل',
      many: '$count يوماً مسجّلاً',
      few: '$count أيام مسجّلة',
      two: 'يومان مسجّلان',
      one: 'يوم واحد مسجّل',
      zero: 'لم تُسجّل أيام',
    );
    return '$_temp0';
  }

  @override
  String get highest => 'الأعلى';

  @override
  String get lowest => 'الأدنى';

  @override
  String get noEntriesShort => 'لا توجد إدخالات';

  @override
  String get recentTrend => 'الاتجاه الأخير';

  @override
  String get trendingHigher => 'يتجه إلى الارتفاع';

  @override
  String get aboutTheSame => 'مستقر تقريباً';

  @override
  String get trendingLower => 'يتجه إلى الانخفاض';

  @override
  String get logMoreForTrend => 'سجّل أياماً أكثر لرؤية الاتجاه';

  @override
  String get commonTags => 'الوسوم الشائعة';

  @override
  String get patternsAppear => 'ستظهر أنماطك مع تسجيل المزيد من الأيام.';

  @override
  String averageValue(String value) {
    return 'المتوسط: $value';
  }

  @override
  String dayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count يوم',
      many: '$count يوماً',
      few: '$count أيام',
      two: 'يومان',
      one: 'يوم واحد',
    );
    return '$_temp0';
  }

  @override
  String get aiReflection => 'تأمل بالذكاء الاصطناعي';

  @override
  String get aiDescription => 'اطلب نظرة أوسع إلى إدخالاتك عندما ترغب فقط.';

  @override
  String get logFirst => 'سجّل بضعة أيام قبل إنشاء أول تأمل.';

  @override
  String get weeklyReflection => 'تأمل أسبوعي';

  @override
  String get monthlyReflection => 'تأمل شهري';

  @override
  String get lookingForPatterns => 'جارٍ البحث عن أنماط مدعومة…';

  @override
  String get onlySelectedSent => 'تُرسل فقط إدخالات الفترة المحددة.';

  @override
  String get savedReflections => 'التأملات المحفوظة';

  @override
  String get deleteReflectionTooltip => 'حذف التأمل';

  @override
  String get beforeContinue => 'قبل المتابعة';

  @override
  String get consentText =>
      'ستُرسل إدخالات اليوميات المحددة بأمان إلى خدمة ذكاء اصطناعي لإنشاء تأملك. تُرسل فقط إدخالات هذا الطلب.';

  @override
  String get continueButton => 'متابعة';

  @override
  String get logMoreDays => 'سجّل بضعة أيام إضافية قبل إنشاء تأمل.';

  @override
  String get reflectionAlreadyRunning => 'يجري بالفعل إنشاء تأمل.';

  @override
  String get reflectionTimeout => 'استغرق الطلب وقتاً طويلاً. حاول لاحقاً.';

  @override
  String get reflectionInvalid => 'استجابة التأمل غير صالحة.';

  @override
  String get reflectionUnavailable => 'تعذّر إنشاء تأملك الآن. حاول لاحقاً.';

  @override
  String get reflectionConnection => 'تعذّر إنشاء تأملك. تحقق من اتصالك.';

  @override
  String get reflectionOverall => 'نظرة عامة';

  @override
  String get reflectionWentWell => 'ما سار جيداً';

  @override
  String get reflectionDifficulties => 'الصعوبات المتكررة';

  @override
  String get reflectionPatterns => 'الأنماط الملحوظة';

  @override
  String get reflectionTry => 'شيء يمكنك تجربته';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get theme => 'المظهر';

  @override
  String get themeSystem => 'النظام';

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeDark => 'داكن';

  @override
  String get language => 'اللغة';

  @override
  String get languageSystem => 'لغة النظام';

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
  String get privacy => 'الخصوصية';

  @override
  String get journalStoredTitle => 'يومياتك محفوظة على هذا الجهاز';

  @override
  String get journalStoredBody =>
      'تعمل الكتابة والإحصاءات دون حساب أو اتصال بالإنترنت.';

  @override
  String get aiOptionalTitle => 'تأملات الذكاء الاصطناعي اختيارية';

  @override
  String get aiOptionalBody =>
      'تُرسل فقط الإدخالات المشمولة في طلب التأمل لمعالجتها.';

  @override
  String get deleteAllData => 'حذف جميع البيانات';

  @override
  String get deleteAllSubtitle => 'الإدخالات والتأملات والتفضيلات المحلية';

  @override
  String get deleteAllQuestion => 'حذف جميع البيانات؟';

  @override
  String get deleteAllBody =>
      'سيؤدي ذلك إلى حذف جميع إدخالات اليوميات وتأملات الذكاء الاصطناعي المحفوظة نهائياً من هذا الجهاز.';

  @override
  String get deleteAllButton => 'حذف الكل';

  @override
  String get allDataDeleted => 'تم حذف جميع البيانات المحلية.';

  @override
  String get about => 'حول التطبيق';

  @override
  String versionLabel(String version) {
    return 'الإصدار $version';
  }

  @override
  String get aboutTagline => 'مساحة صغيرة وخاصة لملاحظة أيامك.';
}
