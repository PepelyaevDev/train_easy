import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'presentation/l10n/generated/app_localizations.dart';
import 'presentation/workouts_screen/workouts_screen.dart';

void main() {
  final dio = Dio();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5F9EA0),
          brightness: Brightness.light,
        ),
      ),
      home: const WorkoutsScreen(),
    );
  }
}
