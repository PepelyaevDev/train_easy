import 'package:json_annotation/json_annotation.dart';
import 'package:train_easy/domain/entities/training_program.dart';

part 'main_path_dto.g.dart';

@JsonSerializable()
class MainPathDto {
  MainPathDto({required this.workouts});

  factory MainPathDto.fromJson(Map<String, dynamic> json) => _$MainPathDtoFromJson(json);
  final List<WorkoutMainPathDto> workouts;

  Map<String, dynamic> toJson() => _$MainPathDtoToJson(this);
}

@JsonSerializable()
class WorkoutMainPathDto {
  WorkoutMainPathDto({
    required this.mainPath,
  });

  factory WorkoutMainPathDto.fromJson(Map<String, dynamic> json) => _$WorkoutMainPathDtoFromJson(json);
  final List<Exercise> mainPath;

  Map<String, dynamic> toJson() => _$WorkoutMainPathDtoToJson(this);
}
