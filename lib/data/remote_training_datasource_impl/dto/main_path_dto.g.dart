// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_path_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainPathDto _$MainPathDtoFromJson(Map<String, dynamic> json) => MainPathDto(
      workouts: (json['workouts'] as List<dynamic>)
          .map((e) => WorkoutMainPathDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MainPathDtoToJson(MainPathDto instance) => <String, dynamic>{
      'workouts': instance.workouts.map((e) => e.toJson()).toList(),
    };

WorkoutMainPathDto _$WorkoutMainPathDtoFromJson(Map<String, dynamic> json) => WorkoutMainPathDto(
      mainPath: (json['mainPath'] as List<dynamic>).map((e) => Exercise.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$WorkoutMainPathDtoToJson(WorkoutMainPathDto instance) => <String, dynamic>{
      'mainPath': instance.mainPath.map((e) => e.toJson()).toList(),
    };
