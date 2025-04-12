import 'package:flutter/cupertino.dart';
import 'package:train_easy/domain/datasource/local_workout_bundles_datasource.dart';
import 'package:train_easy/domain/datasource/remote_training_datasource.dart';
import 'package:train_easy/domain/entities/training_parameters.dart';
import 'package:train_easy/domain/entities/workout_bundle.dart';
import 'package:train_easy/domain/entities/workout_bundles.dart';
import 'package:train_easy/domain/repo/workout_bundles_repo.dart';

class WorkoutBundlesRepoImpl extends ValueNotifier<WorkoutBundles> implements WorkoutBundlesRepo {
  WorkoutBundlesRepoImpl(
    super._value, {
    required this.localTrainingDatasource,
    required this.remoteTrainingDatasource,
  });

  final LocalWorkoutBundlesDatasource localTrainingDatasource;
  final RemoteTrainingDatasource remoteTrainingDatasource;

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
    value = newBundles;
  }

  @override
  Future<void> deleteWorkoutBundle(WorkoutBundle bundle) async {
    final newBundlesList = [...localTrainingDatasource.workoutBundles.bundles];
    newBundlesList.removeWhere((e) => e.createTime == bundle.createTime);
    final newBundles = WorkoutBundles(bundles: newBundlesList);
    await localTrainingDatasource.updateWorkoutBundles(newBundles);
    value = newBundles;
  }
}
