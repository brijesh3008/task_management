import 'package:dartz/dartz.dart';
import 'package:task_management/core/error/app_failures.dart';
import 'package:task_management/core/helpers/impl_repo_helper.dart';
import 'package:task_management/features/dashboard/data/data_sources/task_list_rds.dart';
import 'package:task_management/features/dashboard/data/models/add_update_task_model.dart';
import 'package:task_management/features/dashboard/data/models/glitch_task_model.dart';
import 'package:task_management/features/dashboard/data/models/add_update_params.dart';
import 'package:task_management/features/dashboard/domain/repositories/task_list_repo.dart';
import 'package:task_management/network/eipl_network_info.dart';

class TaskRepoImpl implements TaskRepo {
  final NetworkInfo networkInfo;
  final TaskRDS taskRDS;
  final ImplRepoHelper implRepoHelper;

  const TaskRepoImpl({
    required this.networkInfo,
    required this.taskRDS,
    required this.implRepoHelper,
  });

  @override
  Future<Either<Failure, List<GlitchTaskModel>>> getTaskDetailsList() async {
    return implRepoHelper.execute(() => taskRDS.getGlitchTaskData());
  }

  @override
  Future<Either<Failure, AddUpdateTaskModel>> postTaskDetails(
      TaskParams params) async {
    return implRepoHelper.execute(() => taskRDS.postTaskDetails(params));
  }
}
