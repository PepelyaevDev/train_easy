import 'package:train_easy/domain/entities/training_parameters.dart';

final class CreateWorkoutEvent {
  final TrainingParameters parameters;

  const CreateWorkoutEvent({required this.parameters});
}
