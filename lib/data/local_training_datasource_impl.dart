import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:train_easy/domain/datasource/local_training_datasource.dart';
import 'package:train_easy/domain/entities/workout_bundles.dart';

const _workoutBundlesKey = 'workoutBundlesKey';

class LocalTrainingDatasourceImpl implements LocalTrainingDatasource {
  LocalTrainingDatasourceImpl({required this.prefs});

  final SharedPreferences prefs;

  @override
  WorkoutBundles get workoutBundles {
    final bundlesString = prefs.getString(_workoutBundlesKey);
    if (bundlesString == null) return WorkoutBundles(bundles: []);
    return WorkoutBundles.fromJson(json.decode(bundlesString));
  }

  @override
  Future<void> updateWorkoutBundles(WorkoutBundles bundles) async {
    await prefs.remove(_workoutBundlesKey);
    await prefs.setString(_workoutBundlesKey, json.encode(bundles.toJson()));
  }
}
