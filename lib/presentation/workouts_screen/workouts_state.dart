import 'package:train_easy/domain/entities/training_program.dart';
import 'package:train_easy/domain/entities/workout_bundles.dart';

enum TrainingStage { wormUp, mainPath, callDown }

final class WorkoutsState {
  const WorkoutsState({
    required this.bundles,
    required this.program,
    required this.day,
    required this.stage,
  });

  final List<WorkoutBundle> bundles;
  final int program;
  final int day;
  final TrainingStage stage;

  List<Exercise> get exercises => switch (stage) {
        TrainingStage.wormUp => bundles[program].trainingProgram.workouts[day].wormUp,
        TrainingStage.mainPath => bundles[program].trainingProgram.workouts[day].mainPath,
        TrainingStage.callDown => bundles[program].trainingProgram.workouts[day].callDown,
      };

  WorkoutsState copyWith({
    List<WorkoutBundle>? bundles,
    int? program,
    int? day,
    TrainingStage? stage,
  }) {
    return WorkoutsState(
      bundles: bundles ?? this.bundles,
      program: program ?? this.program,
      day: day ?? this.day,
      stage: stage ?? this.stage,
    );
  }
}
