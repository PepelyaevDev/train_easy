import 'package:json_annotation/json_annotation.dart';
import 'package:train_easy/domain/entities/workout_bundle.dart';

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
