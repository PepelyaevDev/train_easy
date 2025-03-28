import 'package:flutter/material.dart';

import 'l10n/generated/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5F9EA0),
          brightness: Brightness.light,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Тест')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Кнопка')),
            const Card(child: ListTile(title: Text('Карточка'))),
            const TextField(),
            Switch(value: true, onChanged: (_) {}),
            const Checkbox(value: true, onChanged: null),
            Text('Основной текст'),
          ],
        ),
      ),
    );
  }
}
