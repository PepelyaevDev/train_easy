import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_easy/domain/entities/training_program.dart';
import 'package:train_easy/domain/repo/workout_bundles_repo.dart';
import 'package:train_easy/presentation/create_workout_screen/create_workout_screen.dart';
import 'package:train_easy/presentation/workouts_screen/workouts_bloc.dart';
import 'package:train_easy/presentation/workouts_screen/workouts_state.dart';

class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  WorkoutsBloc? _workoutsBloc;
  int? _selectedDay;

  @override
  Widget build(BuildContext context) {
    _workoutsBloc ??= WorkoutsBloc(bundlesRepo: context.read<WorkoutBundlesRepo>());
    return BlocBuilder<WorkoutsBloc, WorkoutsState>(
      bloc: _workoutsBloc!,
      builder: (context, state) {
        final List<Workout> workouts =
            state.bundles.bundles.isEmpty ? [] : state.bundles.bundles.first.trainingProgram.workouts;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Программа тренировок'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => CreateWorkoutScreen()));
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  if (index == _selectedDay) {
                    _selectedDay = null;
                  } else {
                    _selectedDay = index;
                  }
                });
              },
              children: workouts.map<ExpansionPanel>((Workout workout) {
                final index = workouts.indexOf(workout);
                return ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: index == _selectedDay,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(title: Text('Train ${index + 1}'));
                  },
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Список упражнений',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...workout.wormUp.map((exercise) => _ExerciseCard(exercise: exercise)),
                      ...workout.mainPath.map((exercise) => _ExerciseCard(exercise: exercise)),
                      ...workout.callDown.map((exercise) => _ExerciseCard(exercise: exercise)),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class _ExerciseCard extends StatelessWidget {
  final Exercise exercise;

  const _ExerciseCard({required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exercise.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              exercise.technique,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              exercise.specifications,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
