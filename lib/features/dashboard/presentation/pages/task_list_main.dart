import 'package:task_management/core/config/app_colors.dart';
import 'package:task_management/core/config/app_routes.dart';
import 'package:task_management/core/config/app_string.dart';
import 'package:task_management/core/utils/app_flushbars.dart';
import 'package:task_management/core/utils/scroll_behaviour.dart';
import 'package:task_management/features/base/base_bloc/presentation/manager/base_bloc.dart';
import 'package:task_management/features/dashboard/data/models/glitch_task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/features/dashboard/data/models/task_list_page_args.dart';
import 'package:task_management/features/dashboard/presentation/manager/task_list/task_list_bloc.dart';

import '../../../../core/utils/common_functions.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<GlitchTaskModel> glitchTaskData = [];
  late TaskBloc taskBloc;

  @override
  void initState() {
    taskBloc = BlocProvider.of<TaskBloc>(context);
    taskBloc.add(FetchGlitchTaskDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appBackGroundColor,
        title: const Text(AppString.glitchTaskList,style: TextStyle(color: Colors.white,),),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<TaskBloc, BaseState>(
              builder: (context, state) {
                final dashboardBloc = BlocProvider.of<TaskBloc>(context);
                final dashboardList = dashboardBloc.dashboardDataSections;
                if (state is BaseLoadingState) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.88,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    ),
                  );
                } else if (state is DashboardFailureState) {
                  return const Center(
                    child: Text("NO DATA FOUND"),
                  );
                } else if (state is GlitchTaskDataSuccessfulState) {
                  glitchTaskData = state.productData;
                } else if (state is TaskDetailsPostSuccessfulState) {
                  WidgetsBinding.instance.addPostFrameCallback(
                    (timeStamp) {
                      AppFlushBars.appCommonFlushBar(
                          context: context,
                          message: state.productData.message ?? '',
                          success: true);
                    },
                  );
                  Navigator.pop(context);
                }
                return Expanded(
                  child: ScrollConfiguration(
                    behavior: NoGlowScrollPhysics(),
                    child: RefreshIndicator(
                      onRefresh: () async {
                        BlocProvider.of<TaskBloc>(context)
                            .add(InitializePageEvent());
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: glitchTaskData.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.addTaskPage,
                                      arguments: UpdateTaskArgs(taskId: glitchTaskData[index].taskId),
                                    ).then((value) {
                                      taskBloc.add(FetchGlitchTaskDataEvent());
                                    });
                                  },
                                  child: Card(
                                    elevation: 3,
                                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            glitchTaskData[index].taskName ?? 'No Title',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            glitchTaskData[index].taskDetails ?? '',
                                            style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                glitchTaskData[index].createdDate == null
                                                    ? ''
                                                    : formatDateDMMMY('${glitchTaskData[index].createdDate!}'),
                                                style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );/*Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                          style: BorderStyle.solid)),
                                  child: *//*InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context,
                                          AppRoutes.addTaskPage,
                                          arguments:  UpdateTaskArgs(
                                              taskId: glitchTaskData[index].taskId
                                          )
                                      ).then((value) {
                                        taskBloc.add(FetchGlitchTaskDataEvent());
                                      });
                                    },
                                    child: ListTile(
                                      title: Text(glitchTaskData[index].taskName ?? ''),
                                      subtitle:
                                      Text(glitchTaskData[index].taskDetails ?? ''),
                                      trailing: Text(
                                        glitchTaskData[index].createdDate == null
                                            ? ''
                                            : formatDateDMMMY(
                                            '${glitchTaskData[index].createdDate!}'),
                                      ),
                                    ),
                                  )*//*,
                                );*/
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.appBackGroundColor,
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoutes.addTaskPage,
            arguments: const UpdateTaskArgs()
          ).then((value) {
            taskBloc.add(FetchGlitchTaskDataEvent());
          });
        },
        child: const Center(
          child: Icon(Icons.add,color: Colors.white,),
        ),
      ),
    );
  }
}
