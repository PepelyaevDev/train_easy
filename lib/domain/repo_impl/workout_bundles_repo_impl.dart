import 'package:flutter/cupertino.dart';
import 'package:train_easy/domain/datasource/local_training_datasource.dart';
import 'package:train_easy/domain/datasource/remote_training_datasource.dart';
import 'package:train_easy/domain/entities/training_parameters.dart';
import 'package:train_easy/domain/entities/workout_bundle.dart';
import 'package:train_easy/domain/entities/workout_bundles.dart';
import 'package:train_easy/domain/repo/workout_bundles_repo.dart';

class WorkoutBundlesRepoImpl extends ChangeNotifier implements WorkoutBundlesRepo {
  WorkoutBundlesRepoImpl({
    required this.localTrainingDatasource,
    required this.remoteTrainingDatasource,
  });

  final LocalTrainingDatasource localTrainingDatasource;
  final RemoteTrainingDatasource remoteTrainingDatasource;

  @override
  WorkoutBundles get workoutBundles => localTrainingDatasource.workoutBundles;

  @override
  Future<void> createTrainingProgram(TrainingParameters parameters) async {
    final newProgram = await remoteTrainingDatasource.createTrainingProgram(parameters);
    final oldBundlesList = localTrainingDatasource.workoutBundles.bundles;
    final newBundles = WorkoutBundles(
      bundles: [
        WorkoutBundle(
          trainingProgram: newProgram,
          trainingParameters: parameters,
          createTime: DateTime.now(),
        ),
        ...oldBundlesList,
      ],
    );
    await localTrainingDatasource.updateWorkoutBundles(newBundles);
    notifyListeners();
  }

  @override
  Future<void> deleteWorkoutBundle(WorkoutBundle bundle) async {
    final newBundlesList = [...localTrainingDatasource.workoutBundles.bundles];
    newBundlesList.removeWhere((e) => e.createTime == bundle.createTime);
    final newBundles = WorkoutBundles(bundles: newBundlesList);
    await localTrainingDatasource.updateWorkoutBundles(newBundles);
    notifyListeners();
  }
}
