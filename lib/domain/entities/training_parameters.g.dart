// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingParameters _$TrainingParametersFromJson(Map<String, dynamic> json) =>
    TrainingParameters(
      trainingLevel: $enumDecode(_$TrainingLevelEnumMap, json['trainingLevel']),
      workoutDifficulty:
          $enumDecode(_$WorkoutDifficultyEnumMap, json['workoutDifficulty']),
      workoutGoal: $enumDecode(_$WorkoutGoalEnumMap, json['workoutGoal']),
      additionalInformation: json['additionalInformation'] as String,
    );

Map<String, dynamic> _$TrainingParametersToJson(TrainingParameters instance) =>
    <String, dynamic>{
      'trainingLevel': _$TrainingLevelEnumMap[instance.trainingLevel]!,
      'workoutDifficulty':
          _$WorkoutDifficultyEnumMap[instance.workoutDifficulty]!,
      'workoutGoal': _$WorkoutGoalEnumMap[instance.workoutGoal]!,
      'additionalInformation': instance.additionalInformation,
    };

const _$TrainingLevelEnumMap = {
  TrainingLevel.beginner: 'beginner',
  TrainingLevel.intermediate: 'intermediate',
  TrainingLevel.advanced: 'advanced',
};

const _$WorkoutDifficultyEnumMap = {
  WorkoutDifficulty.easy: 'easy',
  WorkoutDifficulty.medium: 'medium',
  WorkoutDifficulty.hard: 'hard',
};

const _$WorkoutGoalEnumMap = {
  WorkoutGoal.generalFitness: 'generalFitness',
  WorkoutGoal.weightLoss: 'weightLoss',
  WorkoutGoal.muscleGain: 'muscleGain',
};
