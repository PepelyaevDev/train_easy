import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:train_easy/domain/repo/workout_bundles_repo.dart';
import 'package:train_easy/presentation/workouts_screen/workouts_events.dart';
import 'package:train_easy/presentation/workouts_screen/workouts_state.dart';

class WorkoutsScreenBloc extends Bloc<WorkoutsEvent, WorkoutsState> {
  final WorkoutBundlesRepo bundlesRepo;

  WorkoutsScreenBloc({
    required this.bundlesRepo,
  }) : super(WorkoutsState(bundles: bundlesRepo.value)) {
    on<WorkoutsEventDelete>(_workoutsEventDeleteHandler, transformer: sequential());
    on<WorkoutsEventUpdate>(_workoutsEventUpdateHandler, transformer: sequential());
    bundlesRepo.addListener(_bundlesListener);
  }

  @override
  Future<void> close() {
    bundlesRepo.removeListener(_bundlesListener);
    return super.close();
  }

  Future<void> _workoutsEventDeleteHandler(WorkoutsEventDelete event, emit) async {
    await bundlesRepo.deleteWorkoutBundle(event.bundle);
  }

  void _workoutsEventUpdateHandler(WorkoutsEventUpdate event, emit) {
    emit(event.bundles);
  }

  void _bundlesListener() => add(WorkoutsEventUpdate(bundles: bundlesRepo.value));
}
