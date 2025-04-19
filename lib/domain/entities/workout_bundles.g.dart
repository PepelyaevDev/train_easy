// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_bundles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutBundles _$WorkoutBundlesFromJson(Map<String, dynamic> json) =>
    WorkoutBundles(
      bundles: (json['bundles'] as List<dynamic>)
          .map((e) => WorkoutBundle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkoutBundlesToJson(WorkoutBundles instance) =>
    <String, dynamic>{
      'bundles': instance.bundles.map((e) => e.toJson()).toList(),
    };
