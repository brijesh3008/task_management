import 'package:dartz/dartz.dart';
import 'package:task_management/core/error/app_failures.dart';
import 'package:task_management/core/usecases/common_usecases.dart';
import 'package:task_management/features/dashboard/data/models/add_update_task_model.dart';
import 'package:task_management/features/dashboard/data/models/glitch_task_model.dart';
import 'package:task_management/features/dashboard/data/models/add_update_params.dart';
import 'package:task_management/features/dashboard/domain/repositories/task_list_repo.dart';

class GlitchTaskPostUC implements UseCase<AddUpdateTaskModel, TaskParams> {
  final TaskRepo taskRepo;
  const GlitchTaskPostUC({required this.taskRepo});

  @override
  Future<Either<Failure, AddUpdateTaskModel>> call(
      TaskParams params,
      ) async {
    return await taskRepo.postTaskDetails(params);
  }

}
