part of 'base_bloc.dart';

abstract class BaseState extends Equatable {
  const BaseState();
}

class BaseLoadingState extends BaseState {
  @override
  List<Object?> get props => [];
}

class BaseFailureState extends BaseState {
  final String message;
  const BaseFailureState({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

class BaseSuccessState extends BaseState{
  final BaseModel baseModel;
  const BaseSuccessState({required this.baseModel});
  @override
  List<Object?> get props => [baseModel];

}

final class BaseInitial extends BaseState {
  @override
  List<Object> get props => [];
}
