// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_seek_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeepSeekResponseDto _$DeepSeekResponseDtoFromJson(Map<String, dynamic> json) => DeepSeekResponseDto(
      id: json['id'] as String,
      objectType: json['object'] as String,
      created: (json['created'] as num).toInt(),
      model: json['model'] as String,
      choices: (json['choices'] as List<dynamic>).map((e) => Choice.fromJson(e as Map<String, dynamic>)).toList(),
      usage: Usage.fromJson(json['usage'] as Map<String, dynamic>),
      systemFingerprint: json['system_fingerprint'] as String,
    );

Map<String, dynamic> _$DeepSeekResponseDtoToJson(DeepSeekResponseDto instance) => <String, dynamic>{
      'id': instance.id,
      'object': instance.objectType,
      'created': instance.created,
      'model': instance.model,
      'choices': instance.choices.map((e) => e.toJson()).toList(),
      'usage': instance.usage.toJson(),
      'system_fingerprint': instance.systemFingerprint,
    };

Choice _$ChoiceFromJson(Map<String, dynamic> json) => Choice(
      index: (json['index'] as num).toInt(),
      message: Message.fromJson(json['message'] as Map<String, dynamic>),
      logprobs: json['logprobs'],
      finishReason: json['finish_reason'] as String,
    );

Map<String, dynamic> _$ChoiceToJson(Choice instance) => <String, dynamic>{
      'index': instance.index,
      'message': instance.message.toJson(),
      'logprobs': instance.logprobs,
      'finish_reason': instance.finishReason,
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      role: json['role'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };

Usage _$UsageFromJson(Map<String, dynamic> json) => Usage(
      promptTokens: (json['prompt_tokens'] as num).toInt(),
      completionTokens: (json['completion_tokens'] as num).toInt(),
      totalTokens: (json['total_tokens'] as num).toInt(),
      promptTokensDetails: PromptTokensDetails.fromJson(json['prompt_tokens_details'] as Map<String, dynamic>),
      promptCacheHitTokens: (json['prompt_cache_hit_tokens'] as num).toInt(),
      promptCacheMissTokens: (json['prompt_cache_miss_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$UsageToJson(Usage instance) => <String, dynamic>{
      'prompt_tokens': instance.promptTokens,
      'completion_tokens': instance.completionTokens,
      'total_tokens': instance.totalTokens,
      'prompt_tokens_details': instance.promptTokensDetails.toJson(),
      'prompt_cache_hit_tokens': instance.promptCacheHitTokens,
      'prompt_cache_miss_tokens': instance.promptCacheMissTokens,
    };

PromptTokensDetails _$PromptTokensDetailsFromJson(Map<String, dynamic> json) => PromptTokensDetails(
      cachedTokens: (json['cached_tokens'] as num).toInt(),
    );

Map<String, dynamic> _$PromptTokensDetailsToJson(PromptTokensDetails instance) => <String, dynamic>{
      'cached_tokens': instance.cachedTokens,
    };
