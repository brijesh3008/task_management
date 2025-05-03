import 'package:equatable/equatable.dart';
import 'package:task_management/core/config/app_failure_messages.dart';

abstract class Failure extends Equatable {
  final dynamic error;

  const Failure({this.error});

  String get message;

  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  @override
  String get message => LmgFailMessage.serverFail;
}

class CacheFailure extends Failure {
  const CacheFailure({super.error});

  @override
  String get message {
    if (error == null) {
      return LmgFailMessage.cacheFail;
    }
    return '$error';
  }
}

class NetworkFailure extends Failure {
  @override
  String get message => LmgFailMessage.networkFailure;
}
