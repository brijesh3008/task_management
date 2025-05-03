import 'package:dartz/dartz.dart';
import 'package:task_management/core/error/app_exceptions.dart';
import 'package:task_management/core/error/app_failures.dart';
import 'package:task_management/features/base/base_bloc/data/data_sources/base_rds.dart';
import 'package:task_management/features/base/base_bloc/data/models/base_model.dart';
import 'package:task_management/features/base/base_bloc/domain/repositories/base_repo.dart';
import 'package:task_management/network/eipl_network_info.dart';

class BaseRepoImpl implements BaseRepo {
  final NetworkInfo networkInfo;
  final BaseRDS baseRDS;

  const BaseRepoImpl({
    required this.networkInfo,
    required this.baseRDS,
  });

  @override
  Future<Either<Failure, BaseModel>> getDashboardData() async {
    if (await networkInfo.isConnected) {
      try {
        final BaseModel baseData =
        await baseRDS.getBaseData();
        return Right(baseData);
      } on ServerException {
        return Left(ServerFailure());
      } catch (error) {
        return Left(CacheFailure(error: error));
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
