import 'package:task_management/core/usecases/common_usecases.dart';
import 'package:task_management/core/utils/api_common_exception.dart';
import 'package:task_management/features/base/base_bloc/domain/use_cases/base_uc.dart';
import 'package:task_management/features/base/base_bloc/presentation/manager/base_bloc.dart';
import 'package:task_management/features/dashboard/data/models/add_update_task_model.dart';
import 'package:task_management/features/dashboard/data/models/glitch_task_model.dart';
import 'package:task_management/features/dashboard/data/models/add_update_params.dart';
import 'package:task_management/features/dashboard/domain/use_cases/task_list_post_us.dart';
import 'package:task_management/features/dashboard/domain/use_cases/task_list_uc.dart';
import 'package:task_management/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'task_list_event.dart';
part 'task_list_state.dart';

class TaskBloc extends BaseBloc {
  final TaskUC taskUC;
  final GlitchTaskPostUC taskPostUC;

  TaskBloc({
    required this.taskUC,
    required this.taskPostUC,
  }) : super(BaseInitial(), BasedUC(baseRepo: sl())) {
    on<DashboardEvent>((event, emit) {});
    on<InitializePageEvent>(_initializePageEvent);
    on<FetchGlitchTaskDataEvent>(_fetchProductDataEvent);
    on<PostTaskDetailsDataEvent>(_postTaskDetailsEvent);
    on<ReInitializePageEvent>(_reinitializePageEvent);
  }

  PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;
  List<Widget> dashboardDataSections = [];
  List<GlitchTaskModel> glitchTaskModel =[];

  _initializePageEvent(InitializePageEvent event, Emitter emit) {
    currentPageIndex = 0;
    emit(DashboardInitialState());
    emit(DashboardCurrentPage(
      pageController: pageController,
      currentPage: currentPageIndex,
    ));
  }

  _reinitializePageEvent(ReInitializePageEvent event, Emitter emit) {
    add(InitializePageEvent());
  }

  Future<void> _fetchProductDataEvent(
      FetchGlitchTaskDataEvent event, Emitter emit) async {
    await ApiExceptionHandler.handle(
      () async {
        emit(BaseLoadingState());
        final failureOrDashboardList = await taskUC(NoParams());
        failureOrDashboardList.fold(
          (failure) {
            emit(DashboardFailureState(message: failure.message));
          },
          (r) {
            glitchTaskModel = r;
            emit(GlitchTaskDataSuccessfulState(
                productData: glitchTaskModel));
          },
        );
      },
      emit,
      onFailure: (message) => DashboardFailureState(message: message),
    );
  }

  Future<void> _postTaskDetailsEvent(
      PostTaskDetailsDataEvent event, Emitter emit) async {
    await ApiExceptionHandler.handle(
      () async {
        emit(BaseLoadingState());
        final failureOrDashboard = await taskPostUC(event.params);
        failureOrDashboard.fold(
          (failure) {
            emit(DashboardFailureState(message: failure.message));
          },
          (r) {
            emit(TaskDetailsPostSuccessfulState(productData: r));
          },
        );
      },
      emit,
      onFailure: (message) => DashboardFailureState(message: message),
    );
  }

}

class DeviceSize {
  static late double screenSize;
  static bool get isMobile => screenSize < 600;
}
