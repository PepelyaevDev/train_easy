import 'package:train_easy/domain/entities/workout_bundles.dart';
import 'package:train_easy/presentation/workouts_screen/workouts_state.dart';

sealed class WorkoutsEvent {
  const WorkoutsEvent();
}

final class WorkoutsEventUpdateBundles extends WorkoutsEvent {
  const WorkoutsEventUpdateBundles();
}

final class WorkoutsEventDelete extends WorkoutsEvent {
  const WorkoutsEventDelete({required this.bundle});

  final WorkoutBundle bundle;
}

sealed class WorkoutsEventSelect extends WorkoutsEvent {
  const WorkoutsEventSelect();
}

final class WorkoutsEventSelectProgram extends WorkoutsEventSelect {
  const WorkoutsEventSelectProgram({required this.index});

  final int index;
}

final class WorkoutsEventSelectDay extends WorkoutsEventSelect {
  const WorkoutsEventSelectDay({required this.index});

  final int index;
}

final class WorkoutsEventSelectStage extends WorkoutsEventSelect {
  const WorkoutsEventSelectStage({required this.stage});

  final TrainingStage stage;
}
