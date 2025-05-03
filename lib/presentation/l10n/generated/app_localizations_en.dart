// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get day => 'Day';

  @override
  String get warmUp => 'Warm-up';

  @override
  String get mainPath => 'Workout';

  @override
  String get callDown => 'Cool-down';

  @override
  String get warmUpDesc => 'Warm-up helps warm up muscles and joints, improve blood circulation, reduce injury risk, increase flexibility, and prepare the cardiovascular system';

  @override
  String get mainPathDesc => 'Main workout';

  @override
  String get callDownDesc => 'Cool-down helps restore breathing, relax muscles, and speed up recovery after exercise';

  @override
  String get noPrograms => 'You don\'t have any workout programs';

  @override
  String get createProgram => 'Create';

  @override
  String get deleteProgram => 'Delete workout program?';

  @override
  String get deleteProgramDesc => 'You can create several different programs. After deletion, recovery will be impossible';

  @override
  String get delete => 'Delete';

  @override
  String get close => 'Close';
}
