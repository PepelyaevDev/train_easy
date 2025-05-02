import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_easy/domain/entities/training_program.dart';
import 'package:train_easy/domain/entities/workout_bundles.dart';
import 'package:train_easy/domain/repo/workout_bundles_repo.dart';
import 'package:train_easy/presentation/create_workout_screen/create_workout_screen.dart';
import 'package:train_easy/presentation/l10n/context_locale_ext.dart';
import 'package:train_easy/presentation/workouts_screen/workouts_bloc.dart';
import 'package:train_easy/presentation/workouts_screen/workouts_events.dart';
import 'package:train_easy/presentation/workouts_screen/workouts_state.dart';

class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  WorkoutsBloc? _workoutsBloc;

  @override
  void dispose() {
    _workoutsBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _workoutsBloc ??= WorkoutsBloc(bundlesRepo: context.read<WorkoutBundlesRepo>());
    return BlocBuilder<WorkoutsBloc, WorkoutsState>(
      bloc: _workoutsBloc,
      builder: (BuildContext context, WorkoutsState state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('TrainEasy'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<dynamic>(builder: (_) => const CreateWorkoutScreen()),
                  );
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: state.bundles.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.localization.noPrograms,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<dynamic>(builder: (_) => const CreateWorkoutScreen()),
                            );
                          },
                          child: Text(context.localization.createProgram),
                        ),
                      ],
                    ),
                  )
                : ListView(
                    children: [
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropdownMenu<int>(
                            key: ValueKey(state.bundles[state.program].createTime),
                            initialSelection: state.program,
                            dropdownMenuEntries: state.bundles.indexed
                                .map(
                                  ((int index, WorkoutBundle bundle) e) => DropdownMenuEntry<int>(
                                    value: e.$1,
                                    label: e.$2.trainingParameters.name,
                                  ),
                                )
                                .toList(),
                            onSelected: (int? index) {
                              if (index != null) {
                                _workoutsBloc!.add(WorkoutsEventSelectProgram(index: index));
                              }
                            },
                          ),
                          IconButton(
                            onPressed: () {
                              _workoutsBloc!.add(WorkoutsEventDelete(bundle: state.bundles[state.program]));
                            },
                            icon: const Icon(Icons.delete_outline),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SegmentedButton<int>(
                        showSelectedIcon: false,
                        segments: state.bundles[state.program].trainingProgram.workouts.indexed
                            .map(
                              ((int index, Workout bundle) e) => ButtonSegment<int>(
                                value: e.$1,
                                label: Text('${context.localization.day} ${e.$1 + 1}'),
                              ),
                            )
                            .toList(),
                        selected: {state.day},
                        onSelectionChanged: (Set<int?> index) {
                          if (index.first != null) {
                            _workoutsBloc!.add(WorkoutsEventSelectDay(index: index.first!));
                          }
                        },
                      ),
                      const SizedBox(height: 8),
                      SegmentedButton<TrainingStage>(
                        showSelectedIcon: false,
                        segments: TrainingStage.values
                            .map(
                              (e) => ButtonSegment<TrainingStage>(
                                value: e,
                                label: Text(
                                  switch (e) {
                                    TrainingStage.wormUp => context.localization.warmUp,
                                    TrainingStage.mainPath => context.localization.mainPath,
                                    TrainingStage.callDown => context.localization.callDown,
                                  },
                                ),
                              ),
                            )
                            .toList(),
                        selected: {state.stage},
                        onSelectionChanged: (Set<TrainingStage?> index) {
                          if (index.first != null) {
                            _workoutsBloc!.add(WorkoutsEventSelectStage(stage: index.first!));
                          }
                        },
                      ),
                      const SizedBox(height: 8),
                      Text(
                        switch (state.stage) {
                          TrainingStage.wormUp => context.localization.warmUpDesc,
                          TrainingStage.mainPath => context.localization.mainPathDesc,
                          TrainingStage.callDown => context.localization.callDownDesc,
                        },
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 8),
                      ...List<Widget>.generate(
                        state.exercises.length,
                        (i) => Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.exercises[i].name,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  state.exercises[i].technique,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  state.exercises[i].specifications,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
