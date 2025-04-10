import 'package:json_annotation/json_annotation.dart';
import 'package:train_easy/domain/entities/training_parameters.dart';
import 'package:train_easy/domain/entities/training_program.dart';

part 'workout_bundle.g.dart';

@JsonSerializable()
class WorkoutBundle {
  final TrainingProgram trainingProgram;
  final TrainingParameters trainingParameters;

  WorkoutBundle({
    required this.trainingProgram,
    required this.trainingParameters,
  });

  factory WorkoutBundle.fromJson(Map<String, dynamic> json) =>
      _$WorkoutBundleFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutBundleToJson(this);
}
