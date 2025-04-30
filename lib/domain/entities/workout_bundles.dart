import 'package:json_annotation/json_annotation.dart';
import 'package:train_easy/domain/entities/training_parameters.dart';
import 'package:train_easy/domain/entities/training_program.dart';

part 'workout_bundles.g.dart';

@JsonSerializable()
class WorkoutBundles {
  final List<WorkoutBundle> bundles;

  WorkoutBundles({
    required this.bundles,
  });

  factory WorkoutBundles.fromJson(Map<String, dynamic> json) => _$WorkoutBundlesFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutBundlesToJson(this);
}

@JsonSerializable()
class WorkoutBundle {
  final TrainingProgram trainingProgram;
  final TrainingParameters trainingParameters;
  final DateTime createTime;

  WorkoutBundle({
    required this.trainingProgram,
    required this.trainingParameters,
    required this.createTime,
  });

  factory WorkoutBundle.fromJson(Map<String, dynamic> json) => _$WorkoutBundleFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutBundleToJson(this);
}
