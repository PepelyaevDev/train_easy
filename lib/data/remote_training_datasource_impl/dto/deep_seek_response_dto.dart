import 'package:json_annotation/json_annotation.dart';

part 'deep_seek_response_dto.g.dart';

@JsonSerializable()
class DeepSeekResponseDto {
  DeepSeekResponseDto({
    required this.id,
    required this.objectType,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
    required this.systemFingerprint,
  });

  factory DeepSeekResponseDto.fromJson(Map<String, dynamic> json) => _$DeepSeekResponseDtoFromJson(json);
  final String id;
  @JsonKey(name: 'object')
  final String objectType;
  final int created;
  final String model;
  final List<Choice> choices;
  final Usage usage;
  @JsonKey(name: 'system_fingerprint')
  final String systemFingerprint;

  Map<String, dynamic> toJson() => _$DeepSeekResponseDtoToJson(this);
}

@JsonSerializable()
class Choice {
  Choice({
    required this.index,
    required this.message,
    required this.logprobs,
    required this.finishReason,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);
  final int index;
  final Message message;
  final dynamic logprobs;
  @JsonKey(name: 'finish_reason')
  final String finishReason;

  Map<String, dynamic> toJson() => _$ChoiceToJson(this);
}

@JsonSerializable()
class Message {
  Message({
    required this.role,
    required this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  final String role;
  final String content;

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

@JsonSerializable()
class Usage {
  Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
    required this.promptTokensDetails,
    required this.promptCacheHitTokens,
    required this.promptCacheMissTokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) => _$UsageFromJson(json);
  @JsonKey(name: 'prompt_tokens')
  final int promptTokens;
  @JsonKey(name: 'completion_tokens')
  final int completionTokens;
  @JsonKey(name: 'total_tokens')
  final int totalTokens;
  @JsonKey(name: 'prompt_tokens_details')
  final PromptTokensDetails promptTokensDetails;
  @JsonKey(name: 'prompt_cache_hit_tokens')
  final int promptCacheHitTokens;
  @JsonKey(name: 'prompt_cache_miss_tokens')
  final int promptCacheMissTokens;

  Map<String, dynamic> toJson() => _$UsageToJson(this);
}

@JsonSerializable()
class PromptTokensDetails {
  PromptTokensDetails({required this.cachedTokens});

  factory PromptTokensDetails.fromJson(Map<String, dynamic> json) => _$PromptTokensDetailsFromJson(json);
  @JsonKey(name: 'cached_tokens')
  final int cachedTokens;

  Map<String, dynamic> toJson() => _$PromptTokensDetailsToJson(this);
}
