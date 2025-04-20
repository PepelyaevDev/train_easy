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
              "content": 'You are an AI fitness coach. '
                  'Respond strictly in JSON format. '
                  'The program should contain an array of workouts, where each workout is an array of exercises. '
                  'Fields for exercise: '
                  'name (string: exercise name), '
                  'instruction (string: execution technique: 2-3 sentences), '
                  'type (enum: cardio, strength, bodyweight), '
                  'sets (integer: sets), '
                  'reps (integer: repetitions), '
                  'duration (integer: duration in minutes), '
                  'weight (float: % of 1RM), '
                  'load (integer: exertion level 1-10 on RPE scale). '
                  'Rules: '
                  '1. For strength: sets, reps, weight are required. duration, load are forbidden. '
                  '2. For bodyweight: sets and load are required. reps, duration, weight are forbidden. '
                  '3. For cardio: duration and load are required. sets, reps, weight are forbidden. '
                  'Example answer: ${jsonEncode(_workoutsExampleForSystemPrompt)}',
            },
            {
              "role": "user",
              "content": 'Create a training program. '
                  'Training difficulty: ${parameters.workoutDifficulty.name}, '
                  'my level of training: ${parameters.trainingLevel.name}, '
                  'my goal: ${_prettyGoal(parameters.workoutGoal)}. '
                  'Additional information: ${parameters.additionalInformation}, '
                  'All information in the answer must be in the language: ${parameters.locale}',
            },
          ],
        },
      },
    );

    return TrainingProgram.fromJson(json.decode(response.data) as Map<String, dynamic>);
  }

  String _prettyGoal(WorkoutGoal goal) => switch (goal) {
        WorkoutGoal.generalFitness => 'general fitness',
        WorkoutGoal.weightLoss => 'weight loss',
        WorkoutGoal.muscleGain => 'muscle gain',
      };

  static const Map<String, dynamic> _workoutsExampleForSystemPrompt = {
    "workouts": [
      [
        {
          "name": "Deadlift",
          "instruction":
              "Feet shoulder-width apart. Grab the barbell, keep your back straight. Lift the weight by extending your hips.",
          "type": "strength",
          "sets": 4,
          "reps": 5,
          "weight": 85.0
        },
        {
          "name": "Jump rope",
          "instruction": "Jump at a moderate pace, rotating the rope with your wrists. Land on the balls of your feet.",
          "type": "cardio",
          "duration": 10,
          "load": 7
        },
        {
          "name": "Pull-ups",
          "instruction":
              "Grab the bar with a wide grip. Pull yourself up until your chin reaches the bar, squeezing your shoulder blades together.",
          "type": "bodyweight",
          "sets": 3,
          "load": 8
        }
      ]
    ]
  };
}
