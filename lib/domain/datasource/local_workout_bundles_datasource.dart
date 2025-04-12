import 'package:train_easy/domain/entities/workout_bundles.dart';

abstract interface class LocalWorkoutBundlesDatasource {
  WorkoutBundles get workoutBundles;

  Future<void> updateWorkoutBundles(WorkoutBundles bundles);
}
