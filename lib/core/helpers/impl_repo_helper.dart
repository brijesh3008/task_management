import 'package:dartz/dartz.dart';
import 'package:task_management/core/error/app_exceptions.dart';
import 'package:task_management/core/error/app_failures.dart';
import 'package:task_management/network/eipl_network_info.dart';

class ImplRepoHelper {
  final NetworkInfo networkInfo;

  ImplRepoHelper(this.networkInfo);

  Future<Either<Failure, T>> execute<T>(
      Future<T> Function() apiCall,
      ) async {
    if (await networkInfo.isConnected) {
      try {
        final T result = await apiCall();
        return Right(result);
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