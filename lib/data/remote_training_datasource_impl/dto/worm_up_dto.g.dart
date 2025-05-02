// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worm_up_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WormUpDto _$WormUpDtoFromJson(Map<String, dynamic> json) => WormUpDto(
      wormUp: (json['wormUp'] as List<dynamic>).map((e) => Exercise.fromJson(e as Map<String, dynamic>)).toList(),
      callDown: (json['callDown'] as List<dynamic>).map((e) => Exercise.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$WormUpDtoToJson(WormUpDto instance) => <String, dynamic>{
      'wormUp': instance.wormUp.map((e) => e.toJson()).toList(),
      'callDown': instance.callDown.map((e) => e.toJson()).toList(),
    };
