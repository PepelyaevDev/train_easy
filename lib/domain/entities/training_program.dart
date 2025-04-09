import 'package:json_annotation/json_annotation.dart';
import 'exercise.dart';

part 'training_program.g.dart';

@JsonSerializable()
class TrainingProgram {
  final List<List<Exercise>> workouts;

  TrainingProgram({required this.workouts});

  factory TrainingProgram.fromJson(Map<String, dynamic> json) =>
      _$TrainingProgramFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingProgramToJson(this);
}
