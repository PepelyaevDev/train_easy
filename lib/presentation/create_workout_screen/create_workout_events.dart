import 'package:train_easy/domain/entities/training_parameters.dart';

final class CreateWorkoutEvent {
  const CreateWorkoutEvent({required this.parameters});

  final TrainingParameters parameters;
}
