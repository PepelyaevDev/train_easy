// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get day => 'День';

  @override
  String get warmUp => 'Разминка';

  @override
  String get mainPath => 'Тренировка';

  @override
  String get callDown => 'Заминка';

  @override
  String get warmUpDesc => 'Разминка помогает разогреть мышцы и суставы, улучшить кровообращение, снизить риск травм, повысить гибкость, подготовить сердечно-сосудистую систему';

  @override
  String get mainPathDesc => 'Основная часть тренировки';

  @override
  String get callDownDesc => 'Заминка помогает восстановить дыхание, расслабить мышцы и ускорить восстановление после нагрузки';

  @override
  String get noPrograms => 'У вас нет тренировочных программ';

  @override
  String get createProgram => 'Создать';
}
