import 'package:train_easy/domain/entities/workout_bundles.dart';

abstract interface class LocalTrainingDatasource {
  WorkoutBundles get workoutBundles;

  Future<void> updateWorkoutBundles(WorkoutBundles bundles);
}
