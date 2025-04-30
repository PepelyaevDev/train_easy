import 'package:flutter/cupertino.dart';
import 'package:train_easy/domain/entities/training_parameters.dart';
import 'package:train_easy/domain/entities/workout_bundles.dart';

abstract interface class WorkoutBundlesRepo implements ValueNotifier<WorkoutBundles> {
  Future<void> createTrainingProgram(TrainingParameters parameters);

  Future<void> deleteWorkoutBundle(WorkoutBundle bundle);
}
