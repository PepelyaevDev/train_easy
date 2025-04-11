// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingParameters _$TrainingParametersFromJson(Map<String, dynamic> json) => TrainingParameters(
      workoutDifficulty: $enumDecode(_$WorkoutDifficultyEnumMap, json['workoutDifficulty']),
      workoutGoal: $enumDecode(_$WorkoutGoalEnumMap, json['workoutGoal']),
      additionalInformation: json['additionalInformation'] as String,
    );

Map<String, dynamic> _$TrainingParametersToJson(TrainingParameters instance) => <String, dynamic>{
      'workoutDifficulty': _$WorkoutDifficultyEnumMap[instance.workoutDifficulty]!,
      'workoutGoal': _$WorkoutGoalEnumMap[instance.workoutGoal]!,
      'additionalInformation': instance.additionalInformation,
    };

const _$WorkoutDifficultyEnumMap = {
  WorkoutDifficulty.beginner: 'beginner',
  WorkoutDifficulty.intermediate: 'intermediate',
  WorkoutDifficulty.advanced: 'advanced',
};

const _$WorkoutGoalEnumMap = {
  WorkoutGoal.generalFitness: 'generalFitness',
  WorkoutGoal.weightLoss: 'weightLoss',
  WorkoutGoal.muscleGain: 'muscleGain',
};
