import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:train_easy/domain/repo/workout_bundles_repo.dart';
import 'package:train_easy/presentation/create_workout_screen/create_workout_events.dart';
import 'package:train_easy/presentation/create_workout_screen/create_workout_state.dart';

class CreateWorkoutBloc extends Bloc<CreateWorkoutEvent, CreateWorkoutState> {
  CreateWorkoutBloc({
    required this.bundlesRepo,
  }) : super(CreateWorkoutStateInit()) {
    on<CreateWorkoutEvent>(_createWorkoutEventHandler, transformer: droppable());
  }

  final WorkoutBundlesRepo bundlesRepo;

  Future<void> _createWorkoutEventHandler(CreateWorkoutEvent event, Emitter<CreateWorkoutState> emit) async {
    try {
      emit(CreateWorkoutStateLoading());
      await bundlesRepo.createTrainingProgram(event.parameters);
      emit(CreateWorkoutStateSuccess());
    } on Exception catch (_) {
      emit(CreateWorkoutStateError());
    }
  }
}
