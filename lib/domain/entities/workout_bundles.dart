import 'package:json_annotation/json_annotation.dart';
import 'package:train_easy/domain/entities/training_parameters.dart';
import 'package:train_easy/domain/entities/training_program.dart';

part 'workout_bundles.g.dart';

@JsonSerializable()
class WorkoutBundles {
  WorkoutBundles({
    required this.bundles,
  });

  factory WorkoutBundles.fromJson(Map<String, dynamic> json) => _$WorkoutBundlesFromJson(json);
  final List<WorkoutBundle> bundles;

  Map<String, dynamic> toJson() => _$WorkoutBundlesToJson(this);
}

@JsonSerializable()
class WorkoutBundle {
  WorkoutBundle({
    required this.trainingProgram,
    required this.trainingParameters,
    required this.createTime,
  });

  factory WorkoutBundle.fromJson(Map<String, dynamic> json) => _$WorkoutBundleFromJson(json);
  final TrainingProgram trainingProgram;
  final TrainingParameters trainingParameters;
  final DateTime createTime;

  Map<String, dynamic> toJson() => _$WorkoutBundleToJson(this);
}
