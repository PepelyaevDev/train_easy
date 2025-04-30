// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingParameters _$TrainingParametersFromJson(Map<String, dynamic> json) =>
    TrainingParameters(
      trainingLevel: $enumDecode(_$TrainingLevelEnumMap, json['trainingLevel']),
      workoutGoal: $enumDecode(_$WorkoutGoalEnumMap, json['workoutGoal']),
      workoutsCount: (json['workoutsCount'] as num).toInt(),
      locale: json['locale'] as String,
    );

Map<String, dynamic> _$TrainingParametersToJson(TrainingParameters instance) =>
    <String, dynamic>{
      'trainingLevel': _$TrainingLevelEnumMap[instance.trainingLevel]!,
      'workoutGoal': _$WorkoutGoalEnumMap[instance.workoutGoal]!,
      'workoutsCount': instance.workoutsCount,
      'locale': instance.locale,
    };

const _$TrainingLevelEnumMap = {
  TrainingLevel.beginner: 'beginner',
  TrainingLevel.intermediate: 'intermediate',
  TrainingLevel.advanced: 'advanced',
};

const _$WorkoutGoalEnumMap = {
  WorkoutGoal.generalFitness: 'generalFitness',
  WorkoutGoal.weightLoss: 'weightLoss',
  WorkoutGoal.muscleGain: 'muscleGain',
};
