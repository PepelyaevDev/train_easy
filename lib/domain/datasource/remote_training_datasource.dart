import 'package:train_easy/domain/entities/training_parameters.dart';
import 'package:train_easy/domain/entities/training_program.dart';

abstract interface class RemoteTrainingDatasource {
  Future<TrainingProgram> createTrainingProgram(TrainingParameters parameters);
}
