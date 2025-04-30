import 'package:train_easy/domain/entities/workout_bundles.dart';

sealed class WorkoutsEvent {
  const WorkoutsEvent();
}

final class WorkoutsEventDelete extends WorkoutsEvent {
  final WorkoutBundle bundle;

  const WorkoutsEventDelete({required this.bundle});
}

final class WorkoutsEventUpdate extends WorkoutsEvent {
  final WorkoutBundles bundles;

  const WorkoutsEventUpdate({required this.bundles});
}
