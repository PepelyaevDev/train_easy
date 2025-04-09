import 'package:json_annotation/json_annotation.dart';
import 'exercise_type.dart';

part 'exercise.g.dart';

@JsonSerializable()
class Exercise {
  final String name;
  final String instruction;
  final ExerciseType type;
  final int? sets;
  final int? reps;
  final int? duration;
  final double? weight;
  final int? load;

  Exercise({
    required this.name,
    required this.instruction,
    required this.type,
    this.sets,
    this.reps,
    this.duration,
    this.weight,
    this.load,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}
