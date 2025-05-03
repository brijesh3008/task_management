part of 'task_list_bloc.dart';

abstract class DashboardState extends BaseState {
  const DashboardState();
}

class DashboardInitialState extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashboardReInitialState extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashboardCurrentPage extends DashboardState {
  final PageController pageController;
  final int currentPage;

  const DashboardCurrentPage({
    required this.pageController,
    required this.currentPage,
  });
  @override
  List<Object> get props => [pageController, currentPage];
}

class DashboardLoadingState extends DashboardState {
  @override
  List<Object?> get props => [];
}

class DashboardFailureState extends DashboardState {
  final String message;
  const DashboardFailureState({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}

class GlitchTaskDataSuccessfulState extends DashboardState {
  final List<GlitchTaskModel> productData;
  const GlitchTaskDataSuccessfulState({required this.productData});
  @override
  List<Object?> get props => [productData];
}

class TaskDetailsPostSuccessfulState extends DashboardState {
  final AddUpdateTaskModel productData;
  const TaskDetailsPostSuccessfulState({required this.productData});
  @override
  List<Object?> get props => [productData];
}
