import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:train_easy/domain/repo/workout_bundles_repo.dart';
import 'package:train_easy/presentation/workouts_screen/workouts_events.dart';
import 'package:train_easy/presentation/workouts_screen/workouts_state.dart';

class WorkoutsBloc extends Bloc<WorkoutsEvent, WorkoutsState> {
  WorkoutsBloc({
    required this.bundlesRepo,
  }) : super(
          _createInitialState(bundlesRepo),
        ) {
    on<WorkoutsEventDelete>(_workoutsEventDeleteHandler, transformer: sequential());
    on<WorkoutsEventUpdateBundles>(_workoutsEventUpdateBundlesHandler, transformer: sequential());
    on<WorkoutsEventSelect>(_workoutsEventSelectHandler, transformer: sequential());
    bundlesRepo.addListener(_bundlesListener);
  }

  final WorkoutBundlesRepo bundlesRepo;

  static WorkoutsState _createInitialState(WorkoutBundlesRepo bundlesRepo) => WorkoutsState(
        bundles: bundlesRepo.value.bundles,
        program: 0,
        day: 0,
        stage: TrainingStage.wormUp,
      );

  @override
  Future<void> close() {
    bundlesRepo.removeListener(_bundlesListener);
    return super.close();
  }

  Future<void> _workoutsEventDeleteHandler(WorkoutsEventDelete event, Emitter<WorkoutsState> emit) async {
    await bundlesRepo.deleteWorkoutBundle(event.bundle);
  }

  void _workoutsEventUpdateBundlesHandler(WorkoutsEventUpdateBundles event, Emitter<WorkoutsState> emit) {
    emit(_createInitialState(bundlesRepo));
  }

  void _workoutsEventSelectHandler(WorkoutsEventSelect event, Emitter<WorkoutsState> emit) {
    final newState = switch (event) {
      WorkoutsEventSelectProgram() => state.copyWith(
          program: event.index,
          day: 0,
          stage: TrainingStage.wormUp,
        ),
      WorkoutsEventSelectDay() => state.copyWith(day: event.index),
      WorkoutsEventSelectStage() => state.copyWith(stage: event.stage),
    };
    emit(newState);
  }

  void _bundlesListener() => add(const WorkoutsEventUpdateBundles());
}
