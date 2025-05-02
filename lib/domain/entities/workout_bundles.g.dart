// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_bundles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutBundles _$WorkoutBundlesFromJson(Map<String, dynamic> json) => WorkoutBundles(
      bundles:
          (json['bundles'] as List<dynamic>).map((e) => WorkoutBundle.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$WorkoutBundlesToJson(WorkoutBundles instance) => <String, dynamic>{
      'bundles': instance.bundles.map((e) => e.toJson()).toList(),
    };

WorkoutBundle _$WorkoutBundleFromJson(Map<String, dynamic> json) => WorkoutBundle(
      trainingProgram: TrainingProgram.fromJson(json['trainingProgram'] as Map<String, dynamic>),
      trainingParameters: TrainingParameters.fromJson(json['trainingParameters'] as Map<String, dynamic>),
      createTime: DateTime.parse(json['createTime'] as String),
    );

Map<String, dynamic> _$WorkoutBundleToJson(WorkoutBundle instance) => <String, dynamic>{
      'trainingProgram': instance.trainingProgram.toJson(),
      'trainingParameters': instance.trainingParameters.toJson(),
      'createTime': instance.createTime.toIso8601String(),
    };
