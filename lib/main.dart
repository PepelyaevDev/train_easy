import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:train_easy/data/local_workout_bundles_datasource_impl.dart';
import 'package:train_easy/data/remote_training_datasource_impl.dart';
import 'package:train_easy/domain/datasource/local_workout_bundles_datasource.dart';
import 'package:train_easy/domain/datasource/remote_training_datasource.dart';
import 'package:train_easy/domain/repo/workout_bundles_repo.dart';
import 'package:train_easy/domain/repo_impl/workout_bundles_repo_impl.dart';
import 'presentation/l10n/generated/app_localizations.dart';
import 'presentation/workouts_screen/workouts_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Services
  final dio = Dio();
  final prefs = await SharedPreferences.getInstance();

  //Datasource's
  final RemoteTrainingDatasource remoteTrainingDatasource = RemoteTrainingDatasourceImpl(dio: dio);
  final LocalWorkoutBundlesDatasource localWorkoutBundlesDatasource = LocalWorkoutBundlesDatasourceImpl(prefs: prefs);

  runApp(
    MyApp(
      remoteTrainingDatasource: remoteTrainingDatasource,
      localWorkoutBundlesDatasource: localWorkoutBundlesDatasource,
    ),
  );
}

class MyApp extends StatelessWidget {
  final RemoteTrainingDatasource remoteTrainingDatasource;
  final LocalWorkoutBundlesDatasource localWorkoutBundlesDatasource;

  const MyApp({
    super.key,
    required this.remoteTrainingDatasource,
    required this.localWorkoutBundlesDatasource,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        ChangeNotifierProvider<WorkoutBundlesRepo>(
          create: (context) => WorkoutBundlesRepoImpl(
            localWorkoutBundlesDatasource.workoutBundles,
            localWorkoutBundlesDatasource: localWorkoutBundlesDatasource,
            remoteTrainingDatasource: remoteTrainingDatasource,
          ),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const WorkoutsScreen(),
      ),
    );
  }
}
