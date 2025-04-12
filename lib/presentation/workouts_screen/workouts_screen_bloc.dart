import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:train_easy/domain/entities/training_parameters.dart';
import 'package:train_easy/domain/entities/workout_bundle.dart';
import 'package:train_easy/domain/entities/workout_bundles.dart';
import 'package:train_easy/domain/repo/workout_bundles_repo.dart';

sealed class WorkoutsScreenEvent {
  const WorkoutsScreenEvent();
}

final class CreateWorkoutEvent extends WorkoutsScreenEvent {
  final TrainingParameters parameters;

  const CreateWorkoutEvent({required this.parameters});
}

final class DeleteWorkoutEvent extends WorkoutsScreenEvent {
  final WorkoutBundle bundle;

  const DeleteWorkoutEvent({required this.bundle});
}

final class UpdateBundlesEvent extends WorkoutsScreenEvent {
  final WorkoutBundles bundles;

  const UpdateBundlesEvent({required this.bundles});
}

class WorkoutsScreenBloc extends Bloc<WorkoutsScreenEvent, WorkoutBundles> {
  final WorkoutBundlesRepo bundlesRepo;

  WorkoutsScreenBloc({
    required this.bundlesRepo,
  }) : super(bundlesRepo.value) {
    on<CreateWorkoutEvent>(_createWorkoutEventHandler, transformer: droppable());
    on<DeleteWorkoutEvent>(_deleteWorkoutEventHandler, transformer: sequential());
    on<UpdateBundlesEvent>(_updateBundlesEventHandler, transformer: sequential());
    bundlesRepo.addListener(_bundlesListener);
  }

  @override
  Future<void> close() {
    bundlesRepo.removeListener(_bundlesListener);
    return super.close();
  }

  Future<void> _createWorkoutEventHandler(CreateWorkoutEvent event, emit) async {
    await bundlesRepo.createTrainingProgram(event.parameters);
  }

  Future<void> _deleteWorkoutEventHandler(DeleteWorkoutEvent event, emit) async {
    await bundlesRepo.deleteWorkoutBundle(event.bundle);
  }

  void _updateBundlesEventHandler(UpdateBundlesEvent event, emit) {
    emit(event.bundles);
  }

  void _bundlesListener() => add(UpdateBundlesEvent(bundles: bundlesRepo.value));
}
