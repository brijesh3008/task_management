import 'dart:async';

import 'package:task_management/core/config/app_routes.dart';
import 'package:task_management/core/config/app_string.dart';
import 'package:task_management/features/dashboard/presentation/manager/task_list/task_list_bloc.dart';
import 'package:task_management/network/network_state.dart';
import 'package:task_management/network/widget/network_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/config/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with TickerProviderStateMixin, WidgetsBindingObserver, NetworkMixin {
  Timer? _timer;
  late TaskBloc dashboardBloc;

  Future onInitializeState(context) async {
    _timer = Timer.periodic(
      const Duration(seconds: 3),
      (timer) async {
        _timer!.cancel();
        dashboardBloc.add(InitializePageEvent());
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.taskListPage,
          (route) => false,
        );
      },
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        dashboardBloc = context.read<TaskBloc>();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NetWorkWidgetHandler(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: const SafeArea(
          child: Center(
            child: Text(
              AppString.appName,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onDisconnected() {}

  @override
  void onReconnected() {
    onInitializeState(context);
  }
}
