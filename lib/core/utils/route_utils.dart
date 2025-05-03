import 'package:task_management/core/config/app_routes.dart';
import 'package:task_management/features/dashboard/data/models/task_list_page_args.dart';
import 'package:task_management/features/dashboard/presentation/pages/add_task_page.dart';
import 'package:task_management/features/dashboard/presentation/pages/task_list_main.dart';
import 'package:flutter/material.dart';

import '../../features/splash_page.dart';

class RouteUtils {
  static Map<String, Widget Function(BuildContext)> routes = {
    /// Splash Page
    AppRoutes.splashPage: (context) {
      return const SplashPage();
    },

    /// TaskListPage
    AppRoutes.taskListPage: (context) {
      return const TaskListPage();
    },

    /// AddTaskPage
    AppRoutes.addTaskPage: (context) {
      final args = ModalRoute.of(context)?.settings.arguments;
      return AddUpdateTaskPage(updateTaskArgs: args as UpdateTaskArgs,);
    },
  };
}
