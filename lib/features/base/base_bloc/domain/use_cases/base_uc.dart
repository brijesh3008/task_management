import 'package:dartz/dartz.dart';
import 'package:task_management/core/error/app_failures.dart';
import 'package:task_management/core/usecases/common_usecases.dart';
import 'package:task_management/features/base/base_bloc/data/models/base_model.dart';
import 'package:task_management/features/base/base_bloc/domain/repositories/base_repo.dart';

class BasedUC implements UseCase<BaseModel, NoParams> {
  final BaseRepo baseRepo;

  const BasedUC({required this.baseRepo});

  @override
  Future<Either<Failure, BaseModel>> call(
    NoParams params,
  ) async {
    return await baseRepo.getDashboardData();
  }
}
