import 'package:dartz/dartz.dart';
import 'package:task_management/core/error/app_failures.dart';
import 'package:task_management/core/usecases/common_usecases.dart';
import 'package:task_management/features/dashboard/data/models/glitch_task_model.dart';
import 'package:task_management/features/dashboard/domain/repositories/task_list_repo.dart';

class TaskUC implements UseCase<List<GlitchTaskModel>, NoParams> {
  final TaskRepo taskRepo;
  const TaskUC({required this.taskRepo});

  @override
  Future<Either<Failure, List<GlitchTaskModel>>> call(
      NoParams params,
  ) async {
    return await taskRepo.getTaskDetailsList();
  }

}
