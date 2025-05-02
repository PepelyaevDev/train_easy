import 'package:json_annotation/json_annotation.dart';
import 'package:train_easy/domain/entities/training_program.dart';

part 'worm_up_dto.g.dart';

@JsonSerializable()
class WormUpDto {
  WormUpDto({
    required this.wormUp,
    required this.callDown,
  });

  factory WormUpDto.fromJson(Map<String, dynamic> json) => _$WormUpDtoFromJson(json);
  final List<Exercise> wormUp;
  final List<Exercise> callDown;

  Map<String, dynamic> toJson() => _$WormUpDtoToJson(this);
}
