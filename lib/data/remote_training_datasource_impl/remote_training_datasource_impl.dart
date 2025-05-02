import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:train_easy/data/remote_training_datasource_impl/dto/deep_seek_response_dto.dart';
import 'package:train_easy/data/remote_training_datasource_impl/dto/main_path_dto.dart';
import 'package:train_easy/data/remote_training_datasource_impl/dto/worm_up_dto.dart';
import 'package:train_easy/data/remote_training_datasource_impl/prompts.dart';
import 'package:train_easy/domain/datasource/remote_training_datasource.dart';
import 'package:train_easy/domain/entities/training_parameters.dart';
import 'package:train_easy/domain/entities/training_program.dart';

class RemoteTrainingDatasourceImpl implements RemoteTrainingDatasource {
  RemoteTrainingDatasourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<TrainingProgram> createTrainingProgram(TrainingParameters parameters) async {
    try {
      final wormUpAndCallDownFuture = _makeRequest(
        systemContent: PromptLines.systemWormUpAndCallDown,
        userContent: PromptLines.userWarmUpAndCoolDown(
          isAgeOver50: false,
          injuriesAndSickness: '',
          trainLevel: 'professional',
          equipment: ['bicycle', 'skipping rope'],
          useFloor: false,
          locale: 'ru',
        ),
      );

      final mainPathsFuture = _makeRequest(
        systemContent: PromptLines.systemMainPath,
        userContent: PromptLines.userMainPath(
          const PromptTrainParams(
            age: 28,
            height: 175,
            weight: 80,
            trainingLevel: 'intermediate',
            equipment: ['bicycle', 'skipping rope', 'pull-up bar', 'parallel bars'],
            useFloor: true,
            locale: 'ru',
          ),
          '',
          0,
        ),
      );

      await Future.wait([wormUpAndCallDownFuture, mainPathsFuture]);

      final wormUpAndCallDown = WormUpDto.fromJson(await wormUpAndCallDownFuture);
      final mainPaths = MainPathDto.fromJson(await mainPathsFuture);

      return TrainingProgram(
        workouts: mainPaths.workouts
            .map(
              (e) => Workout(
                wormUp: wormUpAndCallDown.wormUp,
                mainPath: e.mainPath,
                callDown: wormUpAndCallDown.callDown,
              ),
            )
            .toList(),
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>> _makeRequest({
    required String systemContent,
    required String userContent,
  }) async {
    final response = await dio.post<Map<String, dynamic>>(
      'https://api.deepseek.com/chat/completions',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer sk-b1fdc7082d6b4394a73800f5257f9424',
        },
      ),
      data: {
        'model': 'deepseek-chat',
        'temperature': 1.5,
        'max_tokens': 4096,
        'response_format': {'type': 'json_object'},
        'messages': [
          {
            'role': 'system',
            'content': systemContent,
          },
          {
            'role': 'user',
            'content': userContent,
          },
        ],
      },
    );
    final dto = DeepSeekResponseDto.fromJson(response.data!);
    final content = dto.choices.first.message.content;
    return jsonDecode(content) as Map<String, dynamic>;
  }
}
