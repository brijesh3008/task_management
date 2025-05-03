part of 'task_list_bloc.dart';

abstract class DashboardEvent extends BaseEvent{
  const DashboardEvent();
}

class InitializePageEvent extends DashboardEvent {
  @override
  List<Object?> get props => [];
}

class ReInitializePageEvent extends DashboardEvent {
  @override
  List<Object?> get props => [];
}

class FetchGlitchTaskDataEvent extends DashboardEvent {
  @override
  List<Object?> get props => [];
}

class PostTaskDetailsDataEvent extends DashboardEvent {
  final TaskParams params;
  const PostTaskDetailsDataEvent({required this.params});
  @override
  List<Object?> get props => [params];
}
