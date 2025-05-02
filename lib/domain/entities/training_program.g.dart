// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingProgram _$TrainingProgramFromJson(Map<String, dynamic> json) => TrainingProgram(
      workouts: (json['workouts'] as List<dynamic>).map((e) => Workout.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$TrainingProgramToJson(TrainingProgram instance) => <String, dynamic>{
      'workouts': instance.workouts.map((e) => e.toJson()).toList(),
    };

Workout _$WorkoutFromJson(Map<String, dynamic> json) => Workout(
      wormUp: (json['wormUp'] as List<dynamic>).map((e) => Exercise.fromJson(e as Map<String, dynamic>)).toList(),
      mainPath: (json['mainPath'] as List<dynamic>).map((e) => Exercise.fromJson(e as Map<String, dynamic>)).toList(),
      callDown: (json['callDown'] as List<dynamic>).map((e) => Exercise.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$WorkoutToJson(Workout instance) => <String, dynamic>{
      'wormUp': instance.wormUp.map((e) => e.toJson()).toList(),
      'mainPath': instance.mainPath.map((e) => e.toJson()).toList(),
      'callDown': instance.callDown.map((e) => e.toJson()).toList(),
    };

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      name: json['name'] as String,
      technique: json['technique'] as String,
      specifications: json['specifications'] as String,
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'name': instance.name,
      'technique': instance.technique,
      'specifications': instance.specifications,
    };
