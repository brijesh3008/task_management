import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_management/core/error/app_failures.dart';

/// [UseCase] used for write use cases of any feature
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class GetDataUseCase<Type> {
  Future<Either<Failure, Type>> call();
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
