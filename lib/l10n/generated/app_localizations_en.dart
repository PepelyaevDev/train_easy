// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Fitness Coach';

  @override
  String welcome(Object name) {
    return 'Welcome, $name!';
  }

  @override
  String get age => 'Age';

  @override
  String get weight => 'Weight (kg)';

  @override
  String get goal => 'Training Goal';

  @override
  String get generateProgram => 'Generate Program';
}
