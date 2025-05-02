import 'package:flutter/cupertino.dart';
import 'package:train_easy/presentation/l10n/generated/app_localizations.dart';

extension ContextLocaleExt on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this)!;
}
