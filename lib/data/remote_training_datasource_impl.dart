import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:train_easy/data/prompts.dart';
import 'package:train_easy/domain/datasource/remote_training_datasource.dart';
import 'package:train_easy/domain/entities/training_parameters.dart';
import 'package:train_easy/domain/entities/training_program.dart';

class RemoteTrainingDatasourceImpl implements RemoteTrainingDatasource {
  final Dio dio;

  RemoteTrainingDatasourceImpl({
    required this.dio,
  });

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
          PromptTrainParams(
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

      final Map<String, dynamic> wormUpAndCallDown = await wormUpAndCallDownFuture;

      final Map<String, dynamic> mainPaths = await mainPathsFuture;

      mainPaths['workouts'].forEach((e) => e.addAll(wormUpAndCallDown));

      return TrainingProgram.fromJson(mainPaths);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>> _makeRequest({
    required String systemContent,
    required String userContent,
  }) async {
    final response = await dio.post(
      'https://api.deepseek.com/chat/completions',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer sk-b1fdc7082d6b4394a73800f5257f9424',
        },
      ),
      data: {
        "model": "deepseek-chat",
        "temperature": 1.5,
        "max_tokens": 4096,
        "response_format": {"type": "json_object"},
        "messages": [
          {
            "role": "system",
            "content": systemContent,
          },
          {
            "role": "user",
            "content": userContent,
          },
        ],
      },
    );
    final content = response.data['choices'][0]['message']['content'];
    return jsonDecode(content);
  }
}
