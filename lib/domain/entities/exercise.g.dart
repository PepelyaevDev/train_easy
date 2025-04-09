// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      name: json['name'] as String,
      instruction: json['instruction'] as String,
      type: $enumDecode(_$ExerciseTypeEnumMap, json['type']),
      sets: (json['sets'] as num?)?.toInt(),
      reps: (json['reps'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toDouble(),
      load: (json['load'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'name': instance.name,
      'instruction': instance.instruction,
      'type': _$ExerciseTypeEnumMap[instance.type]!,
      'sets': instance.sets,
      'reps': instance.reps,
      'duration': instance.duration,
      'weight': instance.weight,
      'load': instance.load,
    };

const _$ExerciseTypeEnumMap = {
  ExerciseType.cardio: 'cardio',
  ExerciseType.strength: 'strength',
  ExerciseType.bodyweight: 'bodyweight',
};
