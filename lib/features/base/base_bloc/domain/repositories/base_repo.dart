import 'package:dartz/dartz.dart';
import 'package:task_management/core/error/app_failures.dart';
import 'package:task_management/features/base/base_bloc/data/models/base_model.dart';

abstract class BaseRepo {
  Future<Either<Failure, BaseModel>> getDashboardData();
}
