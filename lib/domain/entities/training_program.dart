import 'package:json_annotation/json_annotation.dart';

part 'training_program.g.dart';

@JsonSerializable()
class TrainingProgram {
  final List<Workout> workouts;

  TrainingProgram({required this.workouts});

  factory TrainingProgram.fromJson(Map<String, dynamic> json) => _$TrainingProgramFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingProgramToJson(this);
}

@JsonSerializable()
class Workout {
  final List<Exercise> wormUp;
  final List<Exercise> mainPath;
  final List<Exercise> callDown;

  Workout({
    required this.wormUp,
    required this.mainPath,
    required this.callDown,
  });

  factory Workout.fromJson(Map<String, dynamic> json) => _$WorkoutFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutToJson(this);
}

@JsonSerializable()
class Exercise {
  final String name;
  final String technique;
  final String specifications;

  Exercise({
    required this.name,
    required this.technique,
    required this.specifications,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}
