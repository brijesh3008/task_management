part of 'base_bloc.dart';

abstract class BaseEvent extends Equatable {
  const BaseEvent();
}

class FetchBaseDataEvent extends BaseEvent{
  @override
  List<Object?> get props => [];
}