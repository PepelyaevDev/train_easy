// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingProgram _$TrainingProgramFromJson(Map<String, dynamic> json) =>
    TrainingProgram(
      workouts: (json['workouts'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );

Map<String, dynamic> _$TrainingProgramToJson(TrainingProgram instance) =>
    <String, dynamic>{
      'workouts': instance.workouts
          .map((e) => e.map((e) => e.toJson()).toList())
          .toList(),
    };
