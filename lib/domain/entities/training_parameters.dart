import 'package:json_annotation/json_annotation.dart';

part 'training_parameters.g.dart';

@JsonSerializable()
class TrainingParameters {
  TrainingParameters({
    required this.trainingLevel,
    required this.workoutGoal,
    required this.workoutsCount,
    required this.locale,
    required this.name,
  });

  factory TrainingParameters.fromJson(Map<String, dynamic> json) => _$TrainingParametersFromJson(json);
  final TrainingLevel trainingLevel;
  final WorkoutGoal workoutGoal;
  final int workoutsCount;
  final String locale;
  final String name;

  Map<String, dynamic> toJson() => _$TrainingParametersToJson(this);
}

enum TrainingLevel {
  beginner,
  intermediate,
  advanced,
}

enum WorkoutGoal {
  generalFitness,
  weightLoss,
  muscleGain,
}
