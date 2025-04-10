// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_bundle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutBundle _$WorkoutBundleFromJson(Map<String, dynamic> json) =>
    WorkoutBundle(
      trainingProgram: TrainingProgram.fromJson(
          json['trainingProgram'] as Map<String, dynamic>),
      trainingParameters: TrainingParameters.fromJson(
          json['trainingParameters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkoutBundleToJson(WorkoutBundle instance) =>
    <String, dynamic>{
      'trainingProgram': instance.trainingProgram,
      'trainingParameters': instance.trainingParameters,
    };
