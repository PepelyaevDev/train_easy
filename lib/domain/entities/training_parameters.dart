import 'package:json_annotation/json_annotation.dart';
import 'package:train_easy/domain/entities/training_level.dart';
import 'package:train_easy/domain/entities/workout_difficulty.dart';
import 'package:train_easy/domain/entities/workout_goal.dart';

part 'training_parameters.g.dart';

@JsonSerializable()
class TrainingParameters {
  final TrainingLevel trainingLevel;
  final WorkoutDifficulty workoutDifficulty;
  final WorkoutGoal workoutGoal;
  final String additionalInformation;
  final String locale;

  TrainingParameters({
    required this.trainingLevel,
    required this.workoutDifficulty,
    required this.workoutGoal,
    required this.additionalInformation,
    required this.locale,
  });

  factory TrainingParameters.fromJson(Map<String, dynamic> json) => _$TrainingParametersFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingParametersToJson(this);
}
