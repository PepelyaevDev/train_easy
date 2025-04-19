import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:train_easy/domain/datasource/remote_training_datasource.dart';
import 'package:train_easy/domain/entities/training_parameters.dart';
import 'package:train_easy/domain/entities/training_program.dart';
import 'package:train_easy/domain/entities/workout_goal.dart';

class RemoteTrainingDatasourceImpl implements RemoteTrainingDatasource {
  final Dio dio;

  RemoteTrainingDatasourceImpl({
    required this.dio,
  });

  @override
  Future<TrainingProgram> createTrainingProgram(TrainingParameters parameters) async {
    final response = await dio.post(
      'https://api.deepseek.com/chat/completions',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer sk-b1fdc7082d6b4394a73800f5257f9424',
        },
      ),
      data: {
        {
          "model": "deepseek-chat",
          "temperature": 1.5,
          "response_format": {"type": "json_object"},
          "messages": [
            {
              "role": "system",
              "content": '',
            },
            {
              "role": "user",
              "content": 'Create a training program. '
                  'Training difficulty: ${parameters.workoutDifficulty.name}, '
                  'my level of training: ${parameters.trainingLevel.name}, '
                  'my goal: ${_prettyGoal(parameters.workoutGoal)}. '
                  'Additional information: ${parameters.additionalInformation}',
            },
          ],
        },
      },
    );

    return TrainingProgram.fromJson(json.decode(response.data));
  }

  String _prettyGoal(WorkoutGoal goal) => switch (goal) {
        WorkoutGoal.generalFitness => 'general fitness',
        WorkoutGoal.weightLoss => 'weight loss',
        WorkoutGoal.muscleGain => 'muscle gain',
      };
}
