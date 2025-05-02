import 'package:json_annotation/json_annotation.dart';

part 'training_program.g.dart';

@JsonSerializable()
class TrainingProgram {
  TrainingProgram({required this.workouts});

  factory TrainingProgram.fromJson(Map<String, dynamic> json) => _$TrainingProgramFromJson(json);
  final List<Workout> workouts;

  Map<String, dynamic> toJson() => _$TrainingProgramToJson(this);
}

@JsonSerializable()
class Workout {
  Workout({
    required this.wormUp,
    required this.mainPath,
    required this.callDown,
  });

  factory Workout.fromJson(Map<String, dynamic> json) => _$WorkoutFromJson(json);
  final List<Exercise> wormUp;
  final List<Exercise> mainPath;
  final List<Exercise> callDown;

  Map<String, dynamic> toJson() => _$WorkoutToJson(this);
}

@JsonSerializable()
class Exercise {
  Exercise({
    required this.name,
    required this.technique,
    required this.specifications,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);
  final String name;
  final String technique;
  final String specifications;

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}
