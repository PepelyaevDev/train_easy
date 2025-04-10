import 'package:train_easy/domain/entities/training_parameters.dart';
import 'package:train_easy/domain/entities/training_program.dart';

abstract interface class TrainingApi {
  Future<TrainingProgram> getTrainingProgram(TrainingParameters parameters);
}
