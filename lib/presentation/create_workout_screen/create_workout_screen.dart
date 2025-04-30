import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_easy/domain/entities/training_parameters.dart';
import 'package:train_easy/domain/repo/workout_bundles_repo.dart';
import 'package:train_easy/presentation/create_workout_screen/create_workout_bloc.dart';
import 'package:train_easy/presentation/create_workout_screen/create_workout_events.dart';
import 'package:train_easy/presentation/create_workout_screen/create_workout_state.dart';

class CreateWorkoutScreen extends StatefulWidget {
  const CreateWorkoutScreen({super.key});

  @override
  State<CreateWorkoutScreen> createState() => _CreateWorkoutScreenState();
}

class _CreateWorkoutScreenState extends State<CreateWorkoutScreen> {
  CreateWorkoutBloc? _createWorkoutBloc;

  @override
  Widget build(BuildContext context) {
    _createWorkoutBloc ??= CreateWorkoutBloc(bundlesRepo: context.read<WorkoutBundlesRepo>());
    return BlocBuilder<CreateWorkoutBloc, CreateWorkoutState>(
      bloc: _createWorkoutBloc!,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            _createWorkoutBloc!.add(
              CreateWorkoutEvent(
                parameters: TrainingParameters(
                  trainingLevel: TrainingLevel.advanced,
                  workoutGoal: WorkoutGoal.muscleGain,
                  workoutsCount: 4,
                  locale: 'ru',
                ),
              ),
            );
            Navigator.of(context).pop();
          },
          child: Text('create'),
        );
      },
    );
  }
}
