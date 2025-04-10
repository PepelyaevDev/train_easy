import 'package:train_easy/domain/entities/training_parameters.dart';
import 'package:train_easy/domain/entities/training_program.dart';

abstract interface class TrainingRepo {
  Future<Wo> getTrainingProgram(TrainingParameters parameters);
}
