// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Фитнес Тренер';

  @override
  String welcome(Object name) {
    return 'Добро пожаловать, $name!';
  }

  @override
  String get age => 'Возраст';

  @override
  String get weight => 'Вес (кг)';

  @override
  String get goal => 'Цель тренировок';

  @override
  String get generateProgram => 'Создать программу';
}
