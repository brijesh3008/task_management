import 'package:dartz/dartz.dart';
import 'package:task_management/core/error/app_failures.dart';
import 'package:task_management/features/dashboard/data/models/add_update_task_model.dart';
import 'package:task_management/features/dashboard/data/models/glitch_task_model.dart';
import 'package:task_management/features/dashboard/data/models/add_update_params.dart';

abstract class TaskRepo {
  Future<Either<Failure, List<GlitchTaskModel>>> getTaskDetailsList();

  Future<Either<Failure, AddUpdateTaskModel>> postTaskDetails(TaskParams params);
}
